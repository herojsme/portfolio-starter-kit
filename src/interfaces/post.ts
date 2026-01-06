import { type Author } from "./author";

export type Post = {
  slug: string;
  title: string;
  date: string;
  coverImage: string;
  author: Author;
  excerpt: string;
  ogImage: {
    url: string;
  };
  content: string;
  preview?: boolean;
};
export type Experience = {
  slug: string;
  sort:number;
  title: string;
  date: string;
  coverImage: string;
  author: Author;
  excerpt: string;
  ogImage: {
    url: string;
  };
  flow: {
    image1: string;
    image2?: string;
    image3?: string;
    image4?: string;
    image5?: string;
    image6?: string;
    image7?: string;
    image8?: string;
    image9?: string;
    image10?: string;
  };
  RealEffectVideo?: string;
  content: string;
  preview?: boolean;
};
