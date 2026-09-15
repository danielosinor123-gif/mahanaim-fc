-- Admin/ingest support: extend tables, enable RLS policies, seed content
alter table players add column if not exists position_detail text;
alter table players add column if not exists date_of_birth text;
alter table players add column if not exists birth_place text;
alter table players add column if not exists height text;
alter table players add column if not exists weight text;
alter table players add column if not exists previous_club text;
alter table fixtures add column if not exists is_home boolean default true;
alter table fixtures add column if not exists kickoff text;
alter table fixtures add column if not exists match_report_slug text;
alter table staff add column if not exists department text;
alter table staff add column if not exists sort_order int default 99;
alter table staff add column if not exists created_at timestamptz default now();

-- Public read (anon) for site build sync
create policy "public read players" on players for select to anon using (true);
create policy "public read fixtures" on fixtures for select to anon using (true);
create policy "public read news" on news_posts for select to anon using (true);
create policy "public read staff" on staff for select to anon using (true);
-- Authenticated staff manage content
create policy "staff manage players" on players for all to authenticated using (true) with check (true);
create policy "staff manage fixtures" on fixtures for all to authenticated using (true) with check (true);
create policy "staff manage news" on news_posts for all to authenticated using (true) with check (true);
create policy "staff manage staff" on staff for all to authenticated using (true) with check (true);
create policy "public read enquiries none" on enquiries for select to anon using (false);

insert into players (id, slug, name, position, position_detail, squad, number, bio, photo, video, date_of_birth, birth_place, height, weight, previous_club, status, consent, published, created_at, updated_at, updated_by) values
('abdullahi-sabiu', 'abdullahi-sabiu', 'Abdullahi Sabiu', 'Defender', 'Right-Back', 'First Team', 14, 'Right-Back â€” Mahanaim FC first team.', '/images/players/abdullahi-sabiu-01.jpg', null, 'May 11, 2008', null, '1.80m', '60kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('akinwande-okiki-joseph', 'akinwande-okiki-joseph', 'Akinwande Okiki Joseph', 'Forward', 'Centre Forward', 'First Team', 20, 'Centre Forward â€” Mahanaim FC first team.', '/images/players/akinwande-okiki-joseph-01.jpg', null, 'February 14, 2007', null, '1.87m', '83kg', 'Mahanaim Fc', 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('anthony-favour', 'anthony-favour', 'Anthony Favour', 'Defender', 'Centre-Back', 'First Team', 5, 'Centre-Back â€” Mahanaim FC first team.', '/images/players/anthony-favour-01.jpg', null, 'February 24, 2009', null, '1.85m', '69kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('dahiru-abdullahi', 'dahiru-abdullahi', 'Dahiru Abdullahi', 'Forward', 'Left/Right Winger', 'First Team', 17, 'Left/Right Winger â€” Mahanaim FC first team.', '/images/players/dahiru-abdullahi-01.jpg', null, 'January 01, 2008', null, '1.80m', '66kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('dogni-harry', 'dogni-harry', 'Dogni Harry', 'Forward', 'Winger', 'First Team', 21, 'Winger â€” Mahanaim FC first team.', '/images/players/dogni-harry-01.jpg', null, 'June 25, 2007', null, '1.83m', '70kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('edoh-christopher', 'edoh-christopher', 'Edoh Christopher', 'Goalkeeper', 'Goalkeeper', 'First Team', 1, 'Goalkeeper â€” Mahanaim FC first team.', '/images/players/edoh-christopher-01.jpg', null, 'June 06, 2009', null, '1.79m', '77kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('egwuatu-daniel', 'egwuatu-daniel', 'Egwuatu Daniel', 'Midfielder', 'Midfield', 'First Team', 4, 'Midfield â€” Mahanaim FC first team.', '/images/players/egwuatu-daniel-01.jpg', null, 'March 16, 2008', null, '1.80m', '65kg', 'Mahanaim Fc', 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('elijah-emmanuel', 'elijah-emmanuel', 'Elijah Emmanuel', 'Midfielder', 'Central/Attacking Midfielder', 'First Team', 11, 'Central/Attacking Midfielder â€” Mahanaim FC first team.', '/images/players/elijah-emmanuel-01.jpg', null, 'January 08, 2009', null, '1.77m', '58kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('haruna-abdullahi', 'haruna-abdullahi', 'Abdullahi Haruna', 'Midfielder', 'Attacking Midfielder', 'First Team', 8, 'Attacking Midfielder â€” Mahanaim FC first team.', '/images/players/haruna-abdullahi-01.jpg', null, 'January 01, 2007', null, '1.82m', '61kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('ikoh-joseph-danjuma', 'ikoh-joseph-danjuma', 'Ikoh Joseph Danjuma', 'Midfielder', 'Defensive Midfielder', 'First Team', 12, 'Defensive Midfielder â€” Mahanaim FC first team.', '/images/players/ikoh-joseph-danjuma-01.jpg', null, 'January 21, 2009', null, '1.85m', '85kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('imam-khalifa', 'imam-khalifa', 'Imam Khalifa', 'Defender', 'Centre-Back', 'First Team', 13, 'Centre-Back â€” Mahanaim FC first team.', '/images/players/imam-khalifa-01.jpg', null, 'September 20, 2008', null, '1.89m', '70kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('imran-aliyu', 'imran-aliyu', 'Imran Aliyu', 'Forward', 'Forward', 'First Team', 9, 'Forward â€” Mahanaim FC first team.', '/images/players/imran-aliyu-01.jpg', null, 'June 10, 2006', null, '1.96m', '68kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('michael-gilbert', 'michael-gilbert', 'Michael Gilbert', 'Midfielder', 'Midfield', 'First Team', 7, 'Midfield â€” Mahanaim FC first team.', '/images/players/micheal-gilbert-01.jpg', null, 'May 15, 2006', null, '1.8m', '60kg', 'Royal Sporting', 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('mohamed-sylla', 'mohamed-sylla', 'Mohamed Sylla', 'Forward', 'Left/Right Winger', 'First Team', 23, 'Left/Right Winger â€” Mahanaim FC first team.', '/images/players/mohamed-sylla-01.jpg', null, 'August 14, 2007', null, '1.76m', '70kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('mohammed-yahi-guy', 'mohammed-yahi-guy', 'Mohammed Yahi Guy', 'Midfielder', 'Midfielder', 'First Team', 25, 'Midfielder â€” Mahanaim FC first team.', '/images/players/mohammed-yahi-guy-01.jpg', null, 'July 09, 2007', null, '1.85m', '70kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('mokele-jesse', 'mokele-jesse', 'Mokele Jessy', 'Defender', 'Right Centre-Back', 'First Team', 20, 'Right Centre-Back â€” Mahanaim FC first team.', '/images/players/mokele-jesse-01.jpg', null, 'August 15, 2006', null, '1.85m', '77kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('momouolou-batchily', 'momouolou-batchily', 'Momouolou Batchily', 'Forward', 'Forward', 'First Team', 24, 'Forward â€” Mahanaim FC first team.', '/images/players/momouolou-batchily-01.jpg', null, 'March 03, 2008', null, '1.91m', '83kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('nambou-jean-roman', 'nambou-jean-roman', 'Nambou Jean Roman', 'Forward', 'Forward', 'First Team', 19, 'Forward â€” Mahanaim FC first team.', '/images/players/nambou-jean-roman-01.jpg', null, 'June 03, 2007', null, '1.95m', '84kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('nwankwo-joseph-okechukwu', 'nwankwo-joseph-okechukwu', 'Nwankwo Joseph Okechukwu', 'Forward', 'Centre Forward', 'First Team', 19, 'Centre Forward â€” Mahanaim FC first team.', '/images/players/okechukwu-joseph-nwankwo-01.jpg', null, 'December 07, 2006', null, '1.8m', '84kg', 'Mahanaim Fc', 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('samson-friday-adejoh', 'samson-friday-adejoh', 'Samson Friday Adejoh', 'Forward', 'Winger', 'First Team', 10, 'Winger â€” Mahanaim FC first team.', '/images/players/samson-friday-adejoh-01.jpg', null, 'March 31, 2007', null, '1.75m', '62kg', 'Peelinks Football Academy', 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('yahaya-nura', 'yahaya-nura', 'Yahaya Nura', 'Defender', 'Centre-Back', 'First Team', 6, 'Centre-Back â€” Mahanaim FC first team.', '/images/players/yahaya-nura-01.jpg', null, 'August 07, 2008', null, '1.84m', '66kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('yakubu-haruna', 'yakubu-haruna', 'Yakubu Haruna', 'Midfielder', 'Defensive Midfielder', 'First Team', 99, 'Defensive Midfielder â€” Mahanaim FC first team.', '/images/players/yakubu-haruna-01.jpg', null, 'October 01, 2007', null, '1.79m', '75kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script'),
('zakariya-salis', 'zakariya-salis', 'Zakariya Salis', 'Defender', 'Right-Back', 'First Team', 15, 'Right-Back â€” Mahanaim FC first team.', '/images/players/zakariya-salis-01.jpg', null, 'December 01, 2007', null, '1.80m', '66kg', null, 'current', 'approved-on-old-site', true, now(), now(), 'seed-script')
on conflict (id) do nothing;

insert into fixtures (id, opponent, date, venue, competition, home_away, status, score_home, score_away, match_report_slug, published, created_at) values
('aib-fc-2-2', 'AIB FC', '2026-08-23', 'Sunrise Waterpark Arena', 'Friendly', false, 'Completed', 2, 2, null, true, now()),
('golden-eaglets-4-2', 'Golden Eaglets (Nigeria U17)', '2026-08-26', 'FIFA Goal Project, Abuja', 'Friendly', true, 'Completed', 4, 2, 'golden-eaglets-4-2', true, now()),
('kano-pillars-1-3', 'Kano Pillars', '2026-08-25', 'Turf Arena mini stadium', 'Friendly', false, 'Completed', 1, 3, 'kano-pillars-3-1', true, now()),
('rose-fa-4-1', 'Rose FA', '2026-05-09', 'Mahanaim FC football pitch, Abuja', 'Friendly', true, 'Completed', 4, 1, null, true, now()),
('spain-fa-3-1', 'Spain FA', '2026-08-08', 'Mahanaim FC football pitch, Abuja', 'Friendly', true, 'Completed', 3, 1, 'spain-fa-double', true, now())
on conflict (id) do nothing;

insert into news_posts (id, slug, title, date, category, excerpt, image, image_alt, author, body, published, published_at, created_at, updated_at, updated_by) values
('aib-fc-2-2', 'aib-fc-2-2', 'Mahanaim forced to 2-2 draw by AIB', '2026-08-25', 'Match Report', 'Mahanaim were held to a 2-2 draw by AIB FC, as published.', '/images/news/aib-draw.jpg', 'Mahanaim FC in action against AIB FC', 'Mahanaim FC', 'Mahanaim FC were held to a 2-2 draw by AIB FC at the Sunrise Waterpark Arena, as published by the club. A full match report is to be supplied by staff.', true, now(), now(), now(), 'seed-script'),
('eid-mubarak', 'eid-mubarak', 'Eid Mubarak from Mahanaim Football Club', '2026-03-20', 'Club News', 'Seasonal greeting published by the club.', '/images/badge/mahanaim-og.png', 'Mahanaim FC crest on a navy background', 'Mahanaim FC', 'Eid Mubarak to all supporters, players, staff and well-wishers from everyone at Mahanaim Football Club, as published by the club.', true, now(), now(), now(), 'seed-script'),
('golden-eaglets-4-2', 'golden-eaglets-4-2', 'Mahanaim pass Golden Eaglets'' test with 4-2 victory', '2026-08-26', 'Match Report', 'Mahanaim FC defeated Nigeria''s U17 national team 4-2 at the FIFA Goal Project in Abuja, as published by the club.', '/images/news/golden-eaglets.jpg', 'Mahanaim FC celebrating during the 4-2 victory over Nigeria U17 Golden Eaglets', 'Mahanaim FC', 'Mahanaim FC defeated the Nigerian U17 male national team, the Golden Eaglets, 4-2 on Friday evening at the FIFA Goal Project in Abuja, as published by the club.

Scorers, line-up and minute-by-minute details were not verifiable at the time of rebuild and are withheld pending staff confirmation.', true, now(), now(), now(), 'seed-script'),
('kano-pillars-3-1', 'kano-pillars-3-1', 'Mahanaim edge Kano Pillars 3-1 in cracking encounter', '2026-08-26', 'Match Report', 'Mahanaim won 3-1 away at Kano Pillars at the Turf Arena mini stadium, as published.', '/images/news/kano-pillars.jpg', 'Match action from Kano Pillars versus Mahanaim FC at the Turf Arena', 'Mahanaim FC', 'Mahanaim FC won 3-1 away at Kano Pillars at the Turf Arena mini stadium, as published by the club. The club''s previous site gave two different dates (25 vs 26 August) â€” staff to confirm the correct one.', true, now(), now(), now(), 'seed-script'),
('spain-fa-double', 'spain-fa-double', 'Mahanaim do the double over Spain FA', '2026-08-25', 'Match Report', 'Second win over Spain FA within weeks at the Moshood Abiola Stadium in Abuja.', '/images/news/spain-fa.jpg', 'Match action from Mahanaim FC versus Spain FA at Moshood Abiola Stadium', 'Mahanaim FC', 'Mahanaim FC beat Spain FA for the second time within a few weeks on Thursday at the Moshood Abiola Stadium in Abuja, as published by the club. An earlier meeting on 8 August ended 3-1 to Mahanaim on the club''s pitch.', true, now(), now(), now(), 'seed-script')
on conflict (id) do nothing;

insert into staff (name, role, department, confirm, sort_order, created_at) values
('Abdul Ominisi', 'Scout', 'Technical', 7, 1, now()),
('Biola Shodiya', 'Director of Operation', 'Operations', 5, 2, now()),
('Gideon Adalo', 'Legal & In-House Counsel', 'Legal', 9, 3, now()),
('Hassana Oyinkansola', 'Vice President', 'Management', 2, 4, now()),
('James Hope', 'Legal & In-House Counsel', 'Legal', 10, 5, now()),
('Nurture Enigma Integrated Services', 'Partner (role to be confirmed)', 'Partner', 11, 6, now()),
('Olaoluwa Aro', 'Director of Communications', 'Media', 4, 7, now()),
('Simon Alfred', 'CEO', 'Management', 1, 8, now()),
('Sunday Amoo', 'Club Coordinator', 'Operations', 8, 9, now()),
('Tobi Adepoju', 'Digital Media', 'Media', 6, 10, now()),
('Usman Mohammed', 'Director of Logistics', 'Operations', 3, 11, now());
