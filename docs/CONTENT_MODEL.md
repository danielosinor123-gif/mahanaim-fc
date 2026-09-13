# Content Model (JSON files in /data mirror future Supabase tables)

## site.json
`{ club_name, slogan, founded, city, address, phone, email, arena, social{instagram,facebook,x,youtube}, response_sla }`

## players.json — entity `players`
`{ id, slug, name, position, position_group(Goalkeeper|Defender|Midfielder|Forward), squad:"First Team", number|null, bio, photo:null|path, video:null|url, status:"current"|"alumni", consent:"pending"|"approved", updated_at }`
Rule: publish only if consent=approved or already public on old site. No DOB/address.

## stories.json — entity `player_stories`
`{ id, slug, title, players[], era, club_role, destination, status:"reported"|"verified", source, body }`

## fixtures.json — entity `fixtures`+`results`
`{ id, opponent, date, venue, competition, home_away, status:"upcoming"|"played"|"postponed", score_home, score_away, report_url, media_url }`
Rule: no invented rows. Empty upcoming → "No fixture published" state.

## news.json — entity `news_posts`
`{ id, slug, title, date, category(Match Report|Training|Interview|Player Story|Scouting|Transfer|Community|Facilities|Sponsor|Club), excerpt, image_alt, author, body_file }`

## staff.json — entity `staff`
`{ name, role, group:"board"|"staff"|"consultant"|"partner", confirm:"published"|"to-confirm" }`
From /about crawl: Simon Alfred (CEO), Usman Mohammed, Olaoluwa Aro, Biola Shodiya + 13 staff/consultant rows carried as "as published".

## facilities.json — entity `facilities_phases`
`{ phase, items[], status:"current"|"proposed", note }` — 13ha site + 9 proposed items always labelled PROPOSED.

## enquiries (no JSON seed)
Fields per category in `docs/CONTENT_MODEL.md` + validation in `assets/js/main.js`. Phase-2 table in `supabase/schema.sql`.

## Audit
Every record: `updated_at`, `source` (old-site URL or "club-supplied"), `approval` flag.
