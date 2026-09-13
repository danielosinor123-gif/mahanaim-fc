# Sitemap (first release, clean URLs)

- `/` — Homepage (identity, actions, featured result, pathway, news, media, trust)
- `/about/` — History (2018), mission/values, what club provides, leadership & staff, current vs future
- `/pathway/` — Player Pathway (5 stages, guarantees, placeholder markers)
- `/players/` — Player directory (cards from `data/players.json`, consent note)
- `/stories/` — Player stories & alumni index
  - `/stories/fk-sarajevo-move/` — Marcus Haruna + Yahi Guy Mohammed (reported FK Sarajevo)
  - `/stories/edward-jassy-pathway/` — Edward Jassy (reported Al Masi → Sigma Olomouc)
- `/fixtures/` — Upcoming + results (from `data/fixtures.json`), no fabricated table
- `/news/` — News index (category filter via JS)
  - `/news/golden-eaglets-4-2/` — sample verified report (Aug 2026)
  - `/news/spain-fa-double/` — sample verified report
  - `/news/kano-pillars-3-1/` — sample verified report
- `/media/` — Social links (Instagram/Facebook/X/YouTube), embed guidance
- `/facilities/` — Current activities vs proposed 13-hectare vision, phases, partner CTA
- `/trials/` — Enquiry hub: trials, parents, scouting, partnerships, sponsorship, media, facilities, safeguarding, general (9 forms → structured mailto + validation)
- `/sponsors/` — Sponsorship & partnership page
- `/contact/` — Address, phone, email, Arena note, map link, response expectations
- Trust (footer-linked): `/safeguarding/`, `/privacy/`, `/accessibility/`, `/complaints/`, `/cookies/`
- `/admin/` — Staff content workflow (JSON editing guide, no public admin login in v1)
- `/404.html` — Not found with helpful links

All pages share `_shell`: skip-link, header/nav, main, footer. Canonical + OG + JSON-LD on news/player/fixture pages.
