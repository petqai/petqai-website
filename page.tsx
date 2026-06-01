"use client";

import { useEffect } from "react";

const features = [
  {
    title: "Pet Profile",
    description: "โปรไฟล์สัตว์เลี้ยงที่อ่านง่าย ครบ และพร้อมใช้จริง"
  },
  {
    title: "Health Timeline",
    description: "ลำดับเหตุการณ์ด้านสุขภาพ ความทรงจำ และการดูแลต่อเนื่อง"
  },
  {
    title: "Gentle Notifications",
    description: "การแจ้งเตือนที่คำนึงถึงอารมณ์ ความพร้อม และความไว้วางใจ"
  },
  {
    title: "AI Assistance Coming Soon",
    description: "ระบบผู้ช่วยดูแลสัตว์เลี้ยงด้วย AI กำลังจะเปิดให้ใช้งานเร็วๆ นี้"
  }
];

function PetQLogo() {
  return (
    <svg className="brand-mark" viewBox="0 0 84 84" fill="none" aria-hidden="true">
      <circle cx="31" cy="34" r="17" stroke="currentColor" strokeWidth="2.4" />
      <path d="M24 22L28.5 16.5L34 22" stroke="currentColor" strokeWidth="2.4" strokeLinecap="round" strokeLinejoin="round" />
      <circle cx="50" cy="40" r="14" stroke="currentColor" strokeWidth="2.4" />
      <path d="M44.5 31L49.5 25.2L54.2 31" stroke="currentColor" strokeWidth="2.4" strokeLinecap="round" strokeLinejoin="round" />
      <circle cx="26.5" cy="35" r="1.8" fill="currentColor" />
      <circle cx="47.2" cy="41" r="1.8" fill="currentColor" />
    </svg>
  );
}

export default function HomePage() {
  useEffect(() => {
    const nodes = document.querySelectorAll<HTMLElement>(".reveal");
    const media = window.matchMedia("(prefers-reduced-motion: reduce)");

    if (media.matches) {
      nodes.forEach((node) => node.classList.add("is-visible"));
      return;
    }

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add("is-visible");
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.16, rootMargin: "0px 0px -8% 0px" }
    );

    nodes.forEach((node) => observer.observe(node));
    return () => observer.disconnect();
  }, []);

  return (
    <main className="app-landing landing-minimal">
      <div className="bg-layer bg-layer-gold" aria-hidden="true" />
      <div className="bg-layer bg-layer-cyan" aria-hidden="true" />
      <div className="ambient-orb orb-left" aria-hidden="true" />
      <div className="ambient-orb orb-right" aria-hidden="true" />

      <section className="hero-section hero-section-clean">
        <div className="container hero-grid hero-grid-clean">
          <div className="hero-copy hero-copy-clean">
            <div className="brand-lockup reveal reveal-delay-1">
              <PetQLogo />
              <div className="brand-text">
                <span className="brand-kicker">PetQ AI</span>
                <span className="brand-name">PetQ AI</span>
              </div>
            </div>

            <div className="hero-heading-group reveal reveal-delay-2">
              <p className="hero-coming-soon" aria-hidden="true">COMING SOON</p>
              <h1>
                <span>AI Care for Pets.</span>
                <span>
                  Built with <span className="gradient-word">Love.</span>
                </span>
              </h1>
              <p className="hero-subtitle">AI ดูแลสัตว์เลี้ยง เพื่อชีวิตที่ดีที่สุดของพวกเขา 🐶🐱</p>
              <p className="hero-subtitle-th">Built with love in Thailand. Designed for pets everywhere.</p>
            </div>

            <div className="hero-actions reveal reveal-delay-3">
              <a className="button button-primary" href="#contact">
                <span>Coming Soon</span>
              </a>
              <a className="button button-secondary" href="mailto:info@petqai.com?subject=PetQ%20AI%20Website%20Inquiry">
                <span>Contact PetQ AI</span>
              </a>
            </div>
          </div>

          <div className="hero-stage hero-stage-clean reveal reveal-delay-3">
            <article className="hero-pet-visual hero-pet-visual-clean float-soft">
              <img src="/assets/petq-hero-dog-cat.jpg" alt="PetQ AI dog and cat" />
            </article>
          </div>
        </div>
      </section>

      <section className="features-section features-section-clean reveal reveal-delay-2">
        <div className="container">
          <div className="section-intro section-intro-clean">
            <span className="section-kicker">What We're Building</span>
            <h2>เริ่มจากความรัก สู่ระบบดูแลสัตว์เลี้ยงด้วย AI ที่รับผิดชอบ</h2>
          </div>

          <div className="features-grid features-grid-clean">
            {features.map((feature) => (
              <article key={feature.title} className="feature-card feature-card-clean reveal card-reveal">
                <span className="card-kicker">{feature.title}</span>
                <p>{feature.description}</p>
              </article>
            ))}
          </div>
        </div>
      </section>

      <section className="trust-section trust-section-clean reveal reveal-delay-3" id="contact">
        <div className="container trust-shell trust-shell-clean">
          <div className="trust-divider" aria-hidden="true" />
          <p className="trust-line">
            <span>Built with love in Thailand. Designed for pets everywhere.</span>
            <span>PetQ AI Thailand • Coming Soon</span>
          </p>
          <p className="trust-note">
            <span>AI ดูแลสัตว์เลี้ยง เพื่อชีวิตที่ดีที่สุดของพวกเขา 🐶🐱</span>
            <span>Warm, trustworthy, and carefully built for the public launch ahead.</span>
          </p>
          <div className="contact-inline">
            <a href="https://www.petqai.com">www.petqai.com</a>
            <span aria-hidden="true">·</span>
            <a href="mailto:info@petqai.com">info@petqai.com</a>
            <span aria-hidden="true">·</span>
            <a href="https://line.me/R/ti/p/@petqai" target="_blank" rel="noreferrer">
              LINE @petqai
            </a>
          </div>
        </div>
      </section>

      <footer className="site-footer reveal reveal-delay-4">
        <div className="container">
          <p>© 2026 PetQ AI. All Rights Reserved.</p>
        </div>
      </footer>
    </main>
  );
}
