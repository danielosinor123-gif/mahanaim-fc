/**
 * Pull content from Supabase and regenerate src/content markdown files.
 * Runs before every build (npm prebuild) so admin-panel changes reach the site.
 * Public read (anon key + RLS) is all this needs — staff manage via the admin panel.
 */
import { createClient } from "@supabase/supabase-js";
import fs from "node:fs";
import path from "node:path";

const URL = "https://cdontogynrllryqytnjf.supabase.co";
const ANON =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNkb250b2d5bnJsbHJ5cXl0bmpmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODkzMzI4NzQsImV4cCI6MjEwNDkwODg3NH0.pD5gS8H5IvPq5dSRFsP_8BUxs3DzRnAQKW_hcW2XPlE";
const sb = createClient(URL, ANON);

const fm = (obj) =>
  Object.entries(obj)
    .filter(([, v]) => v !== undefined && v !== null && v !== "")
    .map(([k, v]) =>
      typeof v === "boolean" || typeof v === "number"
        ? `${k}: ${v}`
        : `${k}: "${String(v).replace(/"/g, '\\"')}"`
    )
    .join("\n");

function write(dir, file, content) {
  const full = path.join(dir, file);
  const prev = fs.existsSync(full) ? fs.readFileSync(full, "utf-8") : "";
  if (prev !== content) fs.writeFileSync(full, content, "utf-8");
}

// Clear generated dirs
for (const d of ["players", "fixtures", "news", "staff"]) {
  const dir = path.join("src/content", d);
  fs.mkdirSync(dir, { recursive: true });
  for (const f of fs.readdirSync(dir)) fs.unlinkSync(path.join(dir, f));
}

// Players
const { data: players, error: pe } = await sb.from("players").select("*").order("name");
if (pe) throw new Error(pe.message);
for (const p of players ?? []) {
  if (p.published === false) continue;
  const front = fm({
    name: p.name,
    slug: p.slug,
    squadNumber: p.number,
    position: p.position,
    positionDetail: p.position_detail,
    team: p.squad || "First Team",
    photo: p.photo,
    dateOfBirth: p.date_of_birth,
    birthPlace: p.birth_place,
    height: p.height,
    weight: p.weight,
    previousClub: p.previous_club,
    nationality: p.nationality || "Nigerian",
    active: p.published !== false,
  });
  const body = (p.bio || `${p.name} plays for Mahanaim FC's first team.`).trim();
  write(path.join("src/content", "players"), `${p.slug}.md`, `---\n${front}\n---\n\n${body}\n\n*Overview as published by the club — pending final editorial approval.*\n`);
}

// Fixtures
const { data: fixtures, error: fe } = await sb.from("fixtures").select("*").order("date", { ascending: false });
if (fe) throw new Error(fe.message);
for (const f of fixtures ?? []) {
  if (f.published === false) continue;
  const isHome = f.is_home !== null && f.is_home !== undefined ? f.is_home : f.home_away === "true";
  const front = fm({
    opponent: f.opponent,
    competition: f.competition,
    date: f.date,
    venue: f.venue,
    isHome,
    status: f.status,
    homeScore: f.score_home,
    awayScore: f.score_away,
    matchReportSlug: f.match_report_slug,
  });
  write(path.join("src/content", "fixtures"), `${f.id}.md`, `---\n${front}\n---\n\n${f.opponent} — ${f.competition}.\n`);
}

// News
const { data: news, error: ne } = await sb.from("news_posts").select("*").order("date", { ascending: false });
if (ne) throw new Error(ne.message);
for (const n of news ?? []) {
  const front = fm({
    title: n.title,
    date: n.date,
    author: n.author || "Mahanaim FC",
    category: n.category || "Club News",
    leadImage: n.image,
    leadImageAlt: n.image_alt,
    summary: n.excerpt,
    featured: false,
    draft: n.published === false,
  });
  write(path.join("src/content", "news"), `${n.slug || n.id}.md`, `---\n${front}\n---\n\n${n.body || n.excerpt || ""}\n`);
}

// Staff
const { data: staff, error: se } = await sb.from("staff").select("*").order("sort_order");
if (se) throw new Error(se.message);
(staff ?? []).forEach((s, i) => {
  const front = fm({
    name: s.name,
    role: s.role,
    department: s.department || "Management",
    order: s.sort_order ?? i + 1,
  });
  write(path.join("src/content", "staff"), `${String(s.name).toLowerCase().replace(/[^a-z0-9]+/g, "-")}.md`, `---\n${front}\n---\n\nAs published on the club's official site — titles and roles pending confirmation.\n`);
});

console.log(`sync-from-supabase: ${players?.length ?? 0} players, ${fixtures?.length ?? 0} fixtures, ${news?.length ?? 0} news, ${staff?.length ?? 0} staff`);
