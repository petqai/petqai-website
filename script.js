document.addEventListener("DOMContentLoaded", () => {
  const revealNodes = document.querySelectorAll(".reveal");
  const reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  if (reduceMotion) {
    revealNodes.forEach((node) => node.classList.add("is-visible"));
  } else {
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
  }

  const form = document.getElementById("waitlist-form");
  const input = document.getElementById("waitlist-email");
  const message = document.getElementById("waitlist-message");

  if (!form || !input || !message) {
    return;
  }

  form.addEventListener("submit", (event) => {
    event.preventDefault();

    const email = input.value.trim();
    const isValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

    if (!isValid) {
      message.textContent = "Please enter a valid email address.";
      message.className = "form-message is-error";
      return;
    }

    // Front-end only for now.
    // Intentionally no network request, no persistence, and no backend integration yet.
    message.textContent = "Thank you. You’ll be among the first to know when PetQ AI launches.";
    message.className = "form-message is-success";
    input.value = "";
  });

  input.addEventListener("input", () => {
    if (message.textContent.trim()) {
      message.textContent = " ";
      message.className = "form-message";
    }
  });
});
