/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        // Mahanaim FC brand palette — sampled from club badge
        'mahanaim': {
          black:      '#0B0B0B',
          'near-black': '#111827',
          gold:       '#D4A843',
          'gold-hover': '#B8922E',
          'gold-light': '#F3BE25',
          white:      '#FFFFFF',
          'off-white': '#F9FAFB',
          'grey-100': '#F3F4F6',
          'grey-300': '#D1D5DB',
          'grey-600': '#4B5563',
          'grey-800': '#1F2937',
        },
      },
      fontFamily: {
        display: ['"Barlow Condensed"', 'sans-serif'],
        body:    ['Inter', 'system-ui', 'sans-serif'],
      },
      fontSize: {
        'hero':    ['3.5rem',  { lineHeight: '1.1',  fontWeight: '700' }],
        'hero-sm': ['2.25rem', { lineHeight: '1.15', fontWeight: '700' }],
        'score':   ['2rem',    { lineHeight: '1',    fontWeight: '700' }],
      },
      maxWidth: {
        'site': '1200px',
      },
    },
  },
  plugins: [],
};
