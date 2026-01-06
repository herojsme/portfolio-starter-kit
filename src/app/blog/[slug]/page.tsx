// import { notFound } from 'next/navigation'
// import { formatDate, getBlogPosts } from '@/app/blog/utils'
// import { baseUrl } from '@/app/sitemap'

// export async function generateStaticParams() {
//   let posts = getBlogPosts()

//   return posts.map((post) => ({
//     slug: post.slug,
//   }))
// }

// export function generateMetadata({ params }) {
//   let post = getBlogPosts().find((post) => post.slug === params.slug)
//   if (!post) {
//     return
//   }

//   let {
//     title,
//     publishedAt: publishedTime,
//     summary: description,
//     image,
//   } = post.metadata
//   let ogImage = image
//     ? image
//     : `${baseUrl}/og?title=${encodeURIComponent(title)}`

//   return {
//     title,
//     description,
//     openGraph: {
//       title,
//       description,
//       type: 'article',
//       publishedTime,
//       url: `${baseUrl}/blog/${post.slug}`,
//       images: [
//         {
//           url: ogImage,
//         },
//       ],
//     },
//     twitter: {
//       card: 'summary_large_image',
//       title,
//       description,
//       images: [ogImage],
//     },
//   }
// }

// export default function Blog({ params }) {
//   let post = getBlogPosts().find((post) => post.slug === params.slug)

//   if (!post) {
//     notFound()
//   }

//   return (
//     <section>
//       <script
//         type="application/ld+json"
//         suppressHydrationWarning
//         dangerouslySetInnerHTML={{
//           __html: JSON.stringify({
//             '@context': 'https://schema.org',
//             '@type': 'BlogPosting',
//             headline: post.metadata.title,
//             datePublished: post.metadata.publishedAt,
//             dateModified: post.metadata.publishedAt,
//             description: post.metadata.summary,
//             image: post.metadata.image
//               ? `${baseUrl}${post.metadata.image}`
//               : `/og?title=${encodeURIComponent(post.metadata.title)}`,
//             url: `${baseUrl}/blog/${post.slug}`,
//             author: {
//               '@type': 'Person',
//               name: 'My Portfolio',
//             },
//           }),
//         }}
//       />
//       <h1 className="title font-semibold text-2xl tracking-tighter">
//         {post.metadata.title}
//       </h1>
//       <div className="flex justify-between items-center mt-2 mb-8 text-sm">
//         <p className="text-sm text-neutral-600 dark:text-neutral-400">
//           {formatDate(post.metadata.publishedAt)}
//         </p>
//       </div>
//       <article className="prose">
//       </article>
//     </section>
//   )
// }


import { Metadata } from "next";
import { notFound } from "next/navigation";
import { getAllPosts, getPostBySlug } from "@/lib/api";
import { CMS_NAME } from "@/lib/constants";
import markdownToHtml from "@/lib/markdownToHtml";
import Alert from "@/app/_components/alert";
import Container from "@/app/_components/container";
import Header from "@/app/_components/header";
import { PostBody } from "@/app/_components/post-body";
import { PostHeader } from "@/app/_components/post-header";
import { Navbar } from '@/app/_components/nav'

export default async function Post(props: Params) {
  const params = await props.params;
  const post = getPostBySlug(params.slug);

  if (!post) {
    return notFound();
  }

  const content = await markdownToHtml(post.content || "");

  return (
    <main>
      <Alert preview={post.preview} />
      <Container>
        <Navbar />
        <Header headerTitle="Blog" />
        <article className="mb-32">
          <PostHeader
            title={post.title}
            coverImage={post.coverImage}
            date={post.date}
            author={post.author}
          />
          <PostBody content={content} />
        </article>
      </Container>
    </main>
  );
}

type Params = {
  params: Promise<{
    slug: string;
  }>;
};

export async function generateMetadata(props: Params): Promise<Metadata> {
  const params = await props.params;
  const post = getPostBySlug(params.slug);

  if (!post) {
    return notFound();
  }

  const title = `${post.title} | Next.js Blog Example with ${CMS_NAME}`;

  return {
    title,
    openGraph: {
      title,
      images: [post.ogImage.url],
    },
  };
}

export async function generateStaticParams() {
  const posts = getAllPosts();

  return posts.map((post) => ({
    slug: post.slug,
  }));
}

