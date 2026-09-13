# Deployment

Static site — no server, no env vars in v1. Any host works.

## Option A — Netlify / Vercel / Cloudflare Pages / GitHub Pages
1. Push `mahanaim-fc/` to a repo (or drag-drop the folder in Netlify Drop).
2. Build command: none. Publish directory: `mahanaim-fc/`.
3. Custom domain: point `mahanaimfc.com` DNS to host; enable HTTPS.
4. Forms (v1): mailto + device queue — works with zero config.

## Option B — cPanel shared hosting (likely current setup)
1. Zip `mahanaim-fc/` contents, upload to `public_html/`, extract.
2. Ensure `404.html` is used as error page (cPanel → Error Pages).
3. Test on mobile data: homepage should load in one request batch (CSS+JS < 35KB).

## Phase-2 wiring (optional, after approvals)
- Forms → Formspree: set each `<form data-to>` + add `action="https://formspree.io/f/XXXX" method="POST"` progressively (JS already validates; keep mailto fallback).
- Supabase: run `supabase/schema.sql`, import `/data/*.json`, add server-side form endpoint with honeypot + rate limit (e.g. 5/hr/IP) + validation mirroring `main.js`.
- Analytics: privacy-friendly (Plausible/Umami), disclosed in `/privacy/` + `/cookies/`.

## Pre-launch checklist
- [ ] Club signs ASSUMPTIONS.md items 1–13
- [ ] Replace placeholder-match.svg where used
- [ ] Set canonical domain in all `<link rel=canonical>` if it changes
- [ ] 404, forms, filters tested (see TEST_RESULTS.md)
