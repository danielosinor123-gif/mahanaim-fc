export interface AlbumImage {
  src: string;
  alt: string;
  caption: string;
}

export interface Album {
  slug: string;
  title: string;
  category: "Matchday" | "Players" | "Behind the Scenes";
  date: string;
  context: string;
  cover: string;
  coverAlt: string;
  images: AlbumImage[];
}

export const albums: Album[] = [
  {
    slug: "matchday-2026",
    title: "Matchday — 2026 Season",
    category: "Matchday",
    date: "May–August 2026",
    context: "Published match-action photography from Mahanaim FC fixtures in Abuja, as carried with the club's match reports.",
    cover: "/images/news/golden-eaglets.jpg",
    coverAlt: "Mahanaim FC in action during the 4-2 friendly win over the Golden Eaglets",
    images: [
      { src: "/images/news/golden-eaglets.jpg", alt: "Mahanaim FC players contesting the friendly against Nigeria U17 Golden Eaglets", caption: "Mahanaim FC vs Golden Eaglets (U17) · FIFA Goal Project · Aug 2026" },
      { src: "/images/news/spain-fa.jpg", alt: "Match action from Mahanaim FC versus Spain FA at Moshood Abiola Stadium", caption: "Mahanaim FC vs Spain FA · Moshood Abiola Stadium · Aug 2026" },
      { src: "/images/news/kano-pillars.jpg", alt: "Match action from Kano Pillars versus Mahanaim FC at the Turf Arena", caption: "Kano Pillars vs Mahanaim FC · Turf Arena · Aug 2026" },
      { src: "/images/news/aib-draw.jpg", alt: "Mahanaim FC in action against AIB FC", caption: "AIB FC vs Mahanaim FC · Sunrise Waterpark Arena · Aug 2026" },
    ],
  },
  {
    slug: "first-team-squad",
    title: "First Team Squad — 2026",
    category: "Players",
    date: "2026 squad",
    context: "Published portraits from the club's official squad page — the full 23-player directory lives on the Players page.",
    cover: "/images/players/imran-aliyu-01.jpg",
    coverAlt: "Imran Aliyu, Mahanaim FC Forward",
    images: [
      { src: "/images/players/imran-aliyu-01.jpg", alt: "Imran Aliyu, Mahanaim FC Forward", caption: "Imran Aliyu · Forward · No. 9" },
      { src: "/images/players/samson-friday-adejoh-01.jpg", alt: "Samson Friday Adejoh, Mahanaim FC Winger", caption: "Samson Friday Adejoh · Winger · No. 10" },
      { src: "/images/players/mohamed-sylla-01.jpg", alt: "Mohamed Sylla, Mahanaim FC Left/Right Winger", caption: "Mohamed Sylla · Winger · No. 23" },
      { src: "/images/players/haruna-abdullahi-01.jpg", alt: "Abdullahi Haruna, Mahanaim FC Attacking Midfielder", caption: "Abdullahi Haruna · Attacking Midfielder · No. 8" },
      { src: "/images/players/egwuatu-daniel-01.jpg", alt: "Egwuatu Daniel, Mahanaim FC Midfielder", caption: "Egwuatu Daniel · Midfielder · No. 4" },
      { src: "/images/players/micheal-gilbert-01.jpg", alt: "Michael Gilbert, Mahanaim FC Midfielder", caption: "Michael Gilbert · Midfielder · No. 7" },
      { src: "/images/players/dogni-harry-01.jpg", alt: "Dogni Harry, Mahanaim FC Winger", caption: "Dogni Harry · Winger · No. 21" },
      { src: "/images/players/edoh-christopher-01.jpg", alt: "Edoh Christopher, Mahanaim FC Goalkeeper", caption: "Edoh Christopher · Goalkeeper · No. 1" },
    ],
  },
  {
    slug: "inside-the-club",
    title: "Inside the Club — Abuja",
    category: "Behind the Scenes",
    date: "2026",
    context: "Squad and club-life photography published by Mahanaim FC.",
    cover: "/images/about-club.jpg",
    coverAlt: "Mahanaim FC squad and officials gathered on the pitch",
    images: [
      { src: "/images/about-club.jpg", alt: "Mahanaim FC squad and officials gathered on the pitch", caption: "Squad and officials · Abuja" },
      { src: "/images/gallery-g1.jpg", alt: "Mahanaim FC — club photo", caption: "Club life · Abuja" },
      { src: "/images/gallery-g2.jpg", alt: "Mahanaim FC players in training", caption: "Training · Abuja" },
      { src: "/images/gallery-g3.jpg", alt: "Mahanaim FC — club photo", caption: "Club life · Abuja" },
      { src: "/images/gallery-g4.jpg", alt: "Mahanaim FC — club photo", caption: "Club life · Abuja" },
    ],
  },
];

export const categories = ["Matchday", "Players", "Behind the Scenes"] as const;
