import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const players = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/players' }),
  schema: z.object({
    name: z.string(),
    slug: z.string(),
    squadNumber: z.number().optional(),
    position: z.enum(['Goalkeeper', 'Defender', 'Midfielder', 'Forward']),
    positionDetail: z.string().optional(),
    team: z.enum(['First Team', 'Academy', 'Alumni']).default('First Team'),
    photo: z.string(),
    dateOfBirth: z.string().optional(),
    birthPlace: z.string().optional(),
    height: z.string().optional(),
    weight: z.string().optional(),
    previousClub: z.string().optional(),
    preferredFoot: z.enum(['Left', 'Right', 'Both']).optional(),
    nationality: z.string().default('Nigerian'),
    bio: z.string().optional(),
    appearances: z.number().optional(),
    goals: z.number().optional(),
    cleanSheets: z.number().optional(),
    highlightVideo: z.string().optional(),
    currentClub: z.string().optional(),
    transferDate: z.string().optional(),
    active: z.boolean().default(true),
  }),
});

const staff = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/staff' }),
  schema: z.object({
    name: z.string(),
    role: z.string(),
    department: z.enum(['Management', 'Technical', 'Medical', 'Operations', 'Legal', 'Media', 'Partner']),
    photo: z.string().optional(),
    bio: z.string().optional(),
    order: z.number().default(99),
  }),
});

const fixtures = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/fixtures' }),
  schema: z.object({
    opponent: z.string(),
    competition: z.string(),
    date: z.coerce.date(),
    kickoff: z.string().optional(),
    venue: z.string(),
    isHome: z.boolean().default(true),
    status: z.enum(['Scheduled', 'Completed', 'Postponed', 'Cancelled']).default('Scheduled'),
    homeScore: z.number().optional(),
    awayScore: z.number().optional(),
    goalscorers: z.array(z.string()).optional(),
    matchReportSlug: z.string().optional(),
  }),
});

const news = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/news' }),
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    author: z.string().default('Mahanaim FC'),
    category: z.enum(['Match Report', 'Transfer', 'Club News', 'Academy', 'Announcement']).default('Club News'),
    leadImage: z.string(),
    leadImageAlt: z.string(),
    summary: z.string(),
    featured: z.boolean().default(false),
    draft: z.boolean().default(false),
  }),
});

export const collections = { players, staff, fixtures, news };
