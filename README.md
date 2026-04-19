# PetQ AI

Starter iOS SwiftUI app structure with a simple clean-architecture layout:

- `App`: app entry point and dependency container
- `Presentation`: SwiftUI views and view models
- `Domain`: core models and use cases
- `Domain/Localization`: Thai-first copy with future i18n readiness
- `Domain/Platform`: local-only version boundaries
- `Domain/Guardrails`: local prompt safety evaluation
- `Domain/Safety`: app-wide safety rules and safe-response templates
- `Domain/Privacy`: consent policy and privacy placeholders
- `Data`: repository protocols and local-safe implementations

Current UI includes:

- Title: `PetQ AI`
- Warm, calm, Thai-first home screen for pet owners in Thailand
- Local AI chat module with guardrail enforcement and mock responses
- Button: `ถาม AI`
- Button: `โปรไฟล์สัตว์เลี้ยง`
- Visible core safety rules on the home screen
- Shared visual theme for future i18n-ready screens

Core Rules:

- AI scope is strictly limited to pet-related questions, pet care, pet profiles, pet wellness, and pet safety
- If a request is outside pet-related scope, the system must refuse or redirect safely
- AI never accesses or modifies backend systems
- AI never approves API access or tokens
- AI must not provide veterinary diagnosis, prescribe medication, or claim emergency certainty
- For risky symptoms, emergencies, poisoning, seizures, breathing issues, bleeding, or collapse, the UI and logic must escalate to a veterinarian immediately
- AI uses safe-response templates for sensitive cases
- All personal data and pet data require explicit user consent
- The app structure reserves space for Consent System, Privacy Notice, and Data Deletion flow
- Do not add backend integration, database writes, analytics, push notifications, API keys, or external services unless explicitly requested later
- Keep the first version local-only and UI-first
- All system design prioritizes safety, privacy, and user control

No backend or network connection is configured yet.
