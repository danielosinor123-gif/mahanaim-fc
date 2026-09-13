# Mahanaim FC — Product & Design Document (First Release)

## 1. What this is
A mobile-first, fast, trustworthy static website replacing the current mahanaimfc.com template. No invented players, results, sponsors, or facilities. Current facts separated from proposed vision.

## 2. Audiences & jobs
| Audience | Job | Primary route |
|---|---|---|
| Players / parents | Understand club, ask about trials safely | /trials/ |
| Scouts / pro clubs | Review development evidence | /players/, /stories/, /fixtures/ |
| Sponsors / partners | Understand reach + support routes | /sponsors/, /facilities/ |
| Supporters | Fixtures, results, news, media | /fixtures/, /news/, /media/ |
| Staff | Direct enquiries to right place | /contact/, /trials/ |

## 3. Design direction
- **Identity:** "Mahanaim FC — Football Excellence For Greater Good." Crest placeholder (initials MFC shield rendered in CSS/SVG until official vector supplied).
- **Palette:** Navy `#0A1931` (primary), Gold `#C9A227` (accent), White `#FFFFFF`, Pitch green `#0E7A3D`, Light `#F4F6F9`, Ink `#14202E`. Contrast ≥ 4.5:1 for body text.
- **Type:** System stack (no webfont download → fast on Nigerian mobile networks). Scale 1.0/1.25/1.563/1.953. Line-height 1.6 body.
- **Layout:** max-width 1120px, 16px gutters, cards grid (1col mobile → 2 tablet → 3 desktop). Sticky header, skip-link, visible focus ring (3px gold outline).
- **Voice:** Factual, short sentences. "Reported", "as published by the club", "proposed" where unverified.

## 4. Stack decision
**Static HTML + CSS + vanilla JS + JSON content files. No framework, no build step.**
Why: fastest on 3G, deployable to any host (cPanel/Netlify/Vercel/GitHub Pages), editable by non-technical staff, no server to secure, SEO-friendly (pre-rendered HTML + meta + JSON-LD). Supabase schema supplied for phase 2 but NOT required for launch (keeps first release secure + simple). Forms validate client-side and compose a structured email to mahanaimfc@hotmail.com + save to localStorage queue; wiring to Formspree/Supabase documented in `docs/DEPLOYMENT.md`.

## 5. Content truth rules
- Only players/results/news observed on live site (Aug 2026 crawl) are included; everything else marked `CONTENT REQUIRED FROM CLUB` or `Proposed`.
- Transfer stories (FK Sarajevo, Sigma Olomouc) labelled "as reported by the club — details to be confirmed".
- Minors: no DOB, address, private contacts. Photos only with consent note.
- Removed template placeholders (UK address, example@gmail.com, Lorem Ipsum) — verified absent.

## 6. Performance / a11y budgets
- Single CSS file < 25KB, JS < 10KB, no external requests, lazy images, semantic landmarks, alt text, keyboard-operable nav + forms, `prefers-reduced-motion` respected.
