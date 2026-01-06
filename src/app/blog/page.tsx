import { BlogPosts } from '@/app/_components/posts'
import { Navbar } from '@/app/_components/nav'
import Container from "@/app/_components/container";

export const metadata = {
  title: '博客',
  description: '阅读我的博客。',
}

export default function Page() {
  return (
    <main>
      <Container>
        <Navbar />
        <h1 className="font-semibold text-2xl mb-8 tracking-tighter">我的博客</h1>
        <BlogPosts />
      </Container>
    </main>
  )
}
