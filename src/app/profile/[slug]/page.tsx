import { Metadata } from "next";
import { notFound } from "next/navigation";
import { getAllProfiles, getProfileBySlug } from "@/lib/api";
import { CMS_NAME } from "@/lib/constants";
import markdownToHtml from "@/lib/markdownToHtml";
import Alert from "@/app/_components/alert";
import Container from "@/app/_components/container";
import Header from "@/app/_components/header";
import { ExperienceBody } from "@/app/_components/experience-body";
import { ExperienceHeader } from "@/app/_components/experience-header";
import { Navbar } from '@/app/_components/nav'
import CoverImage from "@/app/_components/cover-image";


export default async function Post(props: Params) {
  const params = await props.params;
  const experience = getProfileBySlug(params.slug);

  if (!experience) {
    return notFound();
  }

  console.log('experience:', experience);

  const content = await markdownToHtml(experience.content || "");

  return (
    <main>
      <Alert preview={experience.preview} />
      <Container>
        <Navbar />
        <article className="mb-32">
          <ExperienceHeader
            title={experience.title}
            coverImage={experience.coverImage}
            date={experience.date}
            author={experience.author}
          />
          <ExperienceBody content={content} />

          {experience.RealEffectVideo && (<>
            <br />
            <h2 className="text-4xl">效果</h2>
            <br />
            <video controls src={experience.RealEffectVideo}></video>
          </>)}
          {
            experience.flow && (
              <>
                <br />
                <h2 className="text-4xl">资料信息</h2>
                <br />
                <div className="grid grid-cols-1 md:grid-cols-2 md:gap-x-16 lg:gap-x-32 gap-y-20 md:gap-y-32 mb-32">
                  {experience.flow.image1 && <div className="mb-8 md:mb-16 sm:mx-0">
                    <CoverImage title={experience.title} src={experience.flow.image1} view="profile" />
                  </div>}
                  {experience.flow.image2 && <div className="mb-8 md:mb-16 sm:mx-0">
                    <CoverImage title={experience.title} src={experience.flow.image2} view="profile" />
                  </div>}
                  {experience.flow.image3 && <div className="mb-8 md:mb-16 sm:mx-0">
                    <CoverImage title={experience.title} src={experience.flow.image3} view="profile" />
                  </div>}
                  {experience.flow.image4 && <div className="mb-8 md:mb-16 sm:mx-0">
                    <CoverImage title={experience.title} src={experience.flow.image4} view="profile" />
                  </div>}
                  {experience.flow.image5 && <div className="mb-8 md:mb-16 sm:mx-0">
                    <CoverImage title={experience.title} src={experience.flow.image5} view="profile" />
                  </div>}
                  {experience.flow.image6 && <div className="mb-8 md:mb-16 sm:mx-0">
                    <CoverImage title={experience.title} src={experience.flow.image6} view="profile" />
                  </div>}
                  {experience.flow.image7 && <div className="mb-8 md:mb-16 sm:mx-0">
                    <CoverImage title={experience.title} src={experience.flow.image7} view="profile" />
                  </div>}
                  {experience.flow.image8 && <div className="mb-8 md:mb-16 sm:mx-0">
                    <CoverImage title={experience.title} src={experience.flow.image8} view="profile" />
                  </div>}
                  {experience.flow.image9 && <div className="mb-8 md:mb-16 sm:mx-0">
                    <CoverImage title={experience.title} src={experience.flow.image9} view="profile" />
                  </div>}
                  {experience.flow.image10 && <div className="mb-8 md:mb-16 sm:mx-0">
                    <CoverImage title={experience.title} src={experience.flow.image10} view="profile" />
                  </div>}
                </div>
              </>
            )

          }
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
  const experience = getProfileBySlug(params.slug);

  if (!experience) {
    return notFound();
  }

  const title = `${experience.title} | Next.js Blog Example with ${CMS_NAME}`;

  return {
    title,
    openGraph: {
      title,
      images: [experience.ogImage.url],
    },
  };
}

export async function generateStaticParams() {
  const posts = getAllProfiles();

  return posts.map((post) => ({
    slug: post.slug,
  }));
}
