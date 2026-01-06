---
sort: 8
title: "电池外包装OCR字符识别  "
excerpt: "电池外包装OCR字符识别  "
coverImage: "/assets/profiles/vision/power_battery.jpg"
date: "2022.6-2022.7"
author:
  name: JJ Kasper
  picture: "/assets/blog/authors/jj.jpeg"
ogImage:
  url: "/assets/blog/hello-world/cover.jpg"
---

电池外包装OCR字符识别 

## 详情

实时读取电池外包装OCR并与数据库比对，确保每块电池的信息唯一性，防止混批、缺字、歪斜检测、错码。并且做质量检测包括漏印、移位、模糊、断线、反光遮挡等，避免因字符不可读导致下游环节中断。例如在动力电池生产中，喷码位置偏移＞0.5mm或清晰度不足即触发NG,并上报MSE系统。 2000万像素全局快门CMOS（应对高速移动）+同轴漫射光（抑制金属反光）+VM OCR识别；

技术栈：OCR字符识别；模版匹配算法；卡尺测量；SQLServer；