import Container from "@/app/_components/container";
import { HeroPost } from "@/app/_components/hero-post";
import { Intro } from "@/app/_components/intro";
import { MoreStories } from "@/app/_components/more-stories";
import { getAllProfiles } from "@/lib/api";
import { Navbar } from '@/app/_components/nav'

export default function Index() {
  const allProfiles = getAllProfiles();

  const helloProfile = allProfiles[0];

  const moreProfiles = allProfiles.slice(1);

  console.log('allProfiles:', allProfiles); 
  return (
    <main>
      <Container>
        <Navbar />
        <Intro />
        <HeroPost
          title={helloProfile.title}
          coverImage={helloProfile.coverImage}
          date={helloProfile.date}
          author={helloProfile.author}
          slug={helloProfile.slug}
          excerpt={helloProfile.excerpt}
        />
        {moreProfiles.length > 0 && <MoreStories experiences={moreProfiles} />}
      </Container>
    </main>
  );
}
