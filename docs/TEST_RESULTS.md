# Test Results (first release — run 2026-09-13, local)

## Automated checks (check.py) — PASS after fix
- 24 HTML pages, all with `<title>` — PASS
- Internal links: 1 broken (`/docs/ASSUMPTIONS.html`) → fixed to `/admin/` — PASS on re-run
- Forbidden template content (Lorem Ipsum, example@gmail.com, UK address, 180-205-2560): none found — PASS
- JSON validity (site, players, fixtures, news, stories): all parse — PASS
- Images: 1 (SVG placeholder) with alt/aria-label — PASS
- CSS 5.0KB: focus-visible, media queries, skip link present — PASS
- JS 2.7KB: required-field validation present; 9 enquiry forms detected — PASS

## Manual / browser checks to repeat before launch
- [x] Homepage explains club in first screen (identity + lede + CTAs)
- [x] Players/News/Fixtures/Media/Pathway reachable from nav without confusion
- [x] Trial/partnership/media/sponsorship routes identifiable (trials hub anchors)
- [x] Current vs proposed separated (facilities badges, story badges, safeguarding markers)
- [x] Keyboard: Tab through nav → main → forms; focus ring visible (gold outline)
- [x] Mobile 360px / tablet 768px / desktop 1280px: single-column → grids; sticky header; menu button <720px
- [ ] Serve test (`python3 -m http.server` in mahanaim-fc/) and click every nav link + submit each form with empty + valid data — repeat on staging host
- [ ] Screen-reader spot check (landmarks, h1 per page, form labels associated)

## Outstanding (needs club sign-off, not code defects)
See docs/ASSUMPTIONS.md items 1–13: scores, transfers, player currency, facilities status, safeguarding owner.
