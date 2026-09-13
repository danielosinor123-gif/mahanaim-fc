# Staff Handover

## What was built
Mobile-first static site: home, about, pathway, players (22, filterable), stories (2 reported), fixtures/results (5 published), news index + 3 articles, media hub, facilities vision (current vs proposed), sponsors, trials hub (9 validated forms), contact, safeguarding/privacy/accessibility/complaints/cookies, admin guide, Supabase phase-2 schema.

## How to update (5 minutes)
See `/admin/` on the site. Data truth lives in `/data/*.json`; visible HTML mirrors it. Keep both in sync until phase 2.

## Rules
1. Never invent players, scores, transfers, sponsors, facilities, dates.
2. Labels: REPORTED / PROPOSED / CONTENT REQUIRED stay until signed.
3. Minors: no DOB/address/private contacts; photos only with consent form filed.
4. Template junk (UK address, example@gmail.com, Lorem Ipsum) is gone — don't re-add.

## Approvals still needed (summary)
Club name/slogan, contacts, Arena status, 22 players + photo consents, 5 scores, 2 transfer stories + 9 alumni permissions, facilities land status, staff titles, affiliation meaning, trial process/fees/services, safeguarding/privacy/complaints owners, sponsors, social handles. Full list: `docs/ASSUMPTIONS.md`.

## Future improvements (out of v1 scope)
Supabase-backed CMS + auth + RLS writes; server form endpoint with anti-spam/rate limits; image CDN + uploads; full news archive migration; league table when competition confirmed; ticketing/shop; multilingual (EN/FR/Hausa/Yoruba/Igbo); PWA offline; analytics dashboard; consent-form document store.
