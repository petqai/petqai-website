document.addEventListener("DOMContentLoaded", () => {
  const animatedNodes = document.querySelectorAll(".fade-in-up");

  if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
    animatedNodes.forEach((node) => node.classList.add("is-visible"));
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
    { threshold: 0.15 }
  );

  animatedNodes.forEach((node) => observer.observe(node));
});
