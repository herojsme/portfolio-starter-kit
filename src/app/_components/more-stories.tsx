import { Experience } from "@/interfaces/post";
import { ExperiencePreview } from "./experience-preview";

type Props = {
  experiences: Experience[];
};

export function MoreStories({ experiences }: Props) {
  return (
    <section>
      <h2 className="mb-8 text-5xl md:text-7xl font-bold tracking-tighter leading-tight">
        项目经历
      </h2>
      <div className="grid grid-cols-1 md:grid-cols-2 md:gap-x-16 lg:gap-x-32 gap-y-20 md:gap-y-32 mb-32">
        {experiences.map((experience) => (
          <ExperiencePreview
            key={experience.slug}
            title={experience.title}
            coverImage={experience.coverImage}
            date={experience.date}
            author={experience.author}
            slug={experience.slug}
            excerpt={experience.excerpt}
          />
        ))}
      </div>
    </section>
  );
}
