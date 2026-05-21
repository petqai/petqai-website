document.addEventListener("DOMContentLoaded", () => {
  const revealNodes = document.querySelectorAll(".reveal");
  const landing = document.querySelector(".app-landing");
  const hero = document.querySelector(".hero-section");
  const reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  if (reduceMotion) {
    revealNodes.forEach((node) => node.classList.add("is-visible"));
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

  revealNodes.forEach((node) => observer.observe(node));

  let rafId = 0;
  let currentX = 0;
  let currentY = 0;
  let targetX = 0;
  let targetY = 0;

  const animatePointer = () => {
    currentX += (targetX - currentX) * 0.08;
    currentY += (targetY - currentY) * 0.08;

    if (landing) {
      landing.style.setProperty("--pointer-x", currentX.toFixed(4));
      landing.style.setProperty("--pointer-y", currentY.toFixed(4));
    }

    if (Math.abs(targetX - currentX) > 0.001 || Math.abs(targetY - currentY) > 0.001) {
      rafId = window.requestAnimationFrame(animatePointer);
    } else {
      rafId = 0;
    }
  };

  const queuePointerAnimation = () => {
    if (!rafId) {
      rafId = window.requestAnimationFrame(animatePointer);
    }
  };

  const handlePointerMove = (event) => {
    if (!hero) {
      return;
    }

    const rect = hero.getBoundingClientRect();
    targetX = ((event.clientX - rect.left) / rect.width - 0.5) * 2;
    targetY = ((event.clientY - rect.top) / rect.height - 0.5) * 2;
    queuePointerAnimation();
  };

  const handlePointerLeave = () => {
    targetX = 0;
    targetY = 0;
    queuePointerAnimation();
  };

  if (hero) {
    hero.addEventListener("mousemove", handlePointerMove);
    hero.addEventListener("mouseleave", handlePointerLeave);
  }
});
