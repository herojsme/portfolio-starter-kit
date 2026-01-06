import { CMS_NAME } from "@/lib/constants";

export function Intro() {
  return (
    <section className="flex-col md:flex-row flex items-center md:justify-between mt-16 mb-16 md:mb-12">
      <h1 className="text-5xl md:text-8xl font-bold tracking-tighter leading-tight md:pr-8">
        码途.
      </h1>
      <h4 className="text-center md:text-left text-lg mt-5 md:pl-8">
        我是一名视觉开发者同时是前互联网开发人员。在这个网站上，我分享我的项目、博客文章以及职业经历。欢迎浏览并与我联系！{" "}
      </h4>
    </section>
  );
}
