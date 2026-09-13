-- Mahanaim FC — Phase-2 Supabase schema (NOT required for v1 static launch).
-- Public read only for published rows; staff writes via authenticated role.
create table if not exists players(
 id text primary key, slug text unique not null, name text not null,
 position text, position_group text, squad text default 'First Team',
 number int, bio text, photo text, video text,
 status text default 'current', consent text default 'pending',
 published boolean default false, created_at timestamptz default now(),
 updated_at timestamptz default now(), updated_by text);
create table if not exists teams(id text primary key, name text not null, age_group text);
create table if not exists staff(id generated always as identity primary key, name text not null, role text, grp text, confirm text default 'to-confirm');
create table if not exists fixtures(
 id text primary key, opponent text not null, date date, venue text,
 competition text, home_away text, status text default 'upcoming',
 score_home int, score_away int, report_url text, media_url text,
 published boolean default true, created_at timestamptz default now());
create table if not exists news_posts(
 id text primary key, slug text unique not null, title text not null,
 date date, category text, excerpt text, image text, image_alt text,
 author text, body text, published boolean default false,
 published_at timestamptz, created_at timestamptz default now(),
 updated_at timestamptz default now(), updated_by text);
create table if not exists media_items(id text primary key, title text, kind text, url text, caption text, published boolean default true);
create table if not exists player_stories(id text primary key, slug text unique, title text, players text[], club_role text, destination text, status text default 'reported', source text, body text, published boolean default false);
create table if not exists facilities_phases(id text primary key, phase text, items text[], status text, note text);
create table if not exists partners(id text primary key, name text, logo text, tier text, published boolean default false);
create table if not exists enquiries(
 id generated always as identity primary key, category text not null,
 name text, contact text, payload jsonb, created_at timestamptz default now(),
 handled boolean default false);
create table if not exists site_settings(key text primary key, value jsonb);
-- RLS
alter table players enable row level security;
alter table news_posts enable row level security;
alter table fixtures enable row level security;
alter table player_stories enable row level security;
alter table media_items enable row level security;
alter table facilities_phases enable row level security;
alter table enquiries enable row level security;
-- Public read published only:
-- create policy "public read published players" on players for select using (published = true);
-- create policy "public read published news" on news_posts for select using (published = true);
-- (Repeat per table.) Staff/authenticated full access via service role or authenticated policies.
-- Storage: buckets `images` (public read, authenticated write), `documents` (private; signed URLs).
