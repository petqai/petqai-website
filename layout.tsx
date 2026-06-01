import type { Metadata } from "next";

import "./globals.css";

export const metadata: Metadata = {
  metadataBase: new URL("https://www.petqai.com"),
  title: "PetQ AI | Coming Soon",
  description: "AI ดูแลสัตว์เลี้ยง เพื่อชีวิตที่ดีที่สุดของพวกเขา 🐶🐱 PetQ AI กำลังจะเปิดให้ใช้งานเร็วๆ นี้",
  applicationName: "PetQ AI",
  alternates: {
    canonical: "/"
  },
  openGraph: {
    title: "PetQ AI | Coming Soon",
    description: "Built with love in Thailand. Designed for pets everywhere.",
    url: "https://www.petqai.com/",
    siteName: "PetQ AI",
    locale: "th_TH",
    type: "website"
  },
  twitter: {
    card: "summary_large_image",
    title: "PetQ AI | Coming Soon",
    description: "AI ดูแลสัตว์เลี้ยง เพื่อชีวิตที่ดีที่สุดของพวกเขา 🐶🐱"
  }
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="th">
      <body>{children}</body>
    </html>
  );
}
