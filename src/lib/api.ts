import { Post,Experience } from "@/interfaces/post";
import fs from "fs";
import matter from "gray-matter";
import { join } from "path";

const postsDirectory = join(process.cwd(), "_posts");

export function getPostSlugs() {
  return fs.readdirSync(postsDirectory);
}

export function getPostBySlug(slug: string) {
  const realSlug = slug.replace(/\.md$/, "");
  const fullPath = join(postsDirectory, `${realSlug}.md`);
  const fileContents = fs.readFileSync(fullPath, "utf8");
  const { data, content } = matter(fileContents);

  return { ...data, slug: realSlug, content } as Post;
}

export function getAllPosts(): Post[] {
  const slugs = getPostSlugs();
  const posts = slugs
    .map((slug) => getPostBySlug(slug))
    // sort posts by date in descending order
    .sort((post1, post2) => (post1.date > post2.date ? -1 : 1));
  return posts;
}



const profilesDirectory = join(process.cwd(), "_profiles");

export function getProfileSlugs() {
  return fs.readdirSync(profilesDirectory);
}

export function getProfileBySlug(slug: string) {
  const realSlug = slug.replace(/\.md$/, "");
  const fullPath = join(profilesDirectory, `${realSlug}.md`);
  const fileContents = fs.readFileSync(fullPath, "utf8");
  const { data, content } = matter(fileContents);

  return { ...data, slug: realSlug, content } as Experience;
}

export function getAllProfiles(): Experience[] {
  const slugs = getProfileSlugs();
  const experiences = slugs
    .map((slug) => getProfileBySlug(slug))
    // sort posts by date in descending order
    .sort((experience1, experience2) => (experience1.sort > experience2.sort ? 1 : -1));
  return experiences;
}