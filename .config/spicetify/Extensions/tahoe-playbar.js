(function () {
  "use strict";

  console.log("🧊 Tahoe Playbar: Starting...");

  function waitForPlaybar(callback) {
    if (Spicetify?.Playbar) {
      console.log("🧊 Tahoe Playbar: API found!");
      callback();
    } else {
      console.log("🧊 Tahoe Playbar: Waiting for API...");
      setTimeout(() => waitForPlaybar(callback), 1000);
    }
  }

  function createButtons() {
    try {
      // Queue button (macOS Music style)
      const queueBtn = new Spicetify.Playbar.Button(
        "Queue",
        `<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5">
          <rect x="3" y="3" width="10" height="1" rx=".5"/>
          <rect x="3" y="7" width="6" height="1" rx=".5"/>
          <rect x="3" y="11" width="6" height="1" rx=".5"/>
          <path d="M15 9l-3 3-3-3"/>
        </svg>`,
        () => {
          Spicetify.showNotification("Queue!");
          // Spicetify.Platform.History.push(Spicetify.URI.from(Spicetify.Player.queueUri));
        },
        false,
        false,
        false // Don't auto-register
      );

      // Style it
      queueBtn.element.classList.add("tahoe-playbar-button");
      queueBtn.element.style.cssText = `
        border-radius: 12px !important;
        padding: 6px !important;
        background: rgba(255,255,255,0.1) !important;
        backdrop-filter: blur(20px) !important;
      `;

      queueBtn.register();
      console.log("🧊 Tahoe Playbar: Queue button registered!");
    } catch (e) {
      console.error("🧊 Tahoe Playbar error:", e);
    }
  }

  // Multiple attempts
  let attempts = 0;
  const maxAttempts = 30;

  function init() {
    attempts++;
    console.log(`🧊 Tahoe Playbar: Attempt ${attempts}/${maxAttempts}`);

    waitForPlaybar(() => {
      if (Spicetify.Player?.queueUri) {
        createButtons();
      } else {
        setTimeout(init, 2000);
      }
    });
  }

  // Try multiple times
  init();
  Spicetify?.connect?.then(init);
})();
