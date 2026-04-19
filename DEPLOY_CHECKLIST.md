# PetQ AI Deploy Checklist

## Files to upload
- `index.html`
- `styles.css`
- `script.js`
- `favicon.svg`
- `og-image.svg`
- `site.webmanifest`

## Recommended production paths
- `/index.html`
- `/styles.css`
- `/script.js`
- `/favicon.svg`
- `/og-image.svg`
- `/site.webmanifest`

## Pre-deploy checks
- Confirm `canonical` is `https://www.petqai.ai/`
- Confirm `og:url` is `https://www.petqai.ai/`
- Confirm `og:image` is `https://www.petqai.ai/og-image.svg`
- Confirm `twitter:image` is `https://www.petqai.ai/og-image.svg`
- Confirm `manifest` path is `/site.webmanifest`
- Confirm favicon path is `/favicon.svg`
- Confirm all local asset references are relative and valid after upload
- Confirm Google Fonts can load in production environment

## SEO and metadata checks
- Page title appears correctly in browser tab
- Meta description appears correctly in page source
- Open Graph tags are present in page source
- Twitter card tags are present in page source
- JSON-LD script is present in page source
- `lang` defaults correctly and language switch still works

## Functional QA
- Navigation anchors scroll to the correct sections
- Thai and English switch updates all visible copy correctly
- LINE link opens `@petqai` correctly
- Email link opens `info@petqai.com`
- Mobile menu opens and closes correctly
- Scroll progress bar works correctly
- Sticky header changes state on scroll
- Reveal animations work without layout shift
- App sticky storytelling works on desktop
- App section falls back cleanly on tablet and mobile
- Footer links work correctly

## Responsive QA
- Test desktop width around `1440px`
- Test laptop width around `1280px`
- Test tablet width around `820px`
- Test mobile width around `390px`
- Test small mobile width around `360px`
- Check hero spacing and button stacking on mobile
- Check cards do not overflow horizontally
- Check Thai text wraps cleanly in headings and body copy
- Check footer layout stacks cleanly on mobile

## Performance and delivery checks
- Enable gzip or brotli on HTML, CSS, JS, SVG, and manifest files
- Set correct content types:
  - `text/html` for `index.html`
  - `text/css` for `styles.css`
  - `application/javascript` or `text/javascript` for `script.js`
  - `image/svg+xml` for `favicon.svg` and `og-image.svg`
  - `application/manifest+json` or `application/json` for `site.webmanifest`
- Add cache headers for static assets like CSS, JS, SVG, and manifest
- Avoid aggressive caching on `index.html` unless you have a versioning strategy

## Social preview validation
- After deploy, test the live URL in:
  - Facebook Sharing Debugger
  - LinkedIn Post Inspector
  - X/Twitter Card Validator if available
- If social platforms do not render SVG previews reliably, create `og-image.png` at `1200x630` and update:
  - `og:image`
  - `twitter:image`
  - `og:image:type`

## Final live checks on `https://www.petqai.ai/`
- Hard refresh the page
- Check browser console for errors
- Check network panel for missing files or `404`s
- Check page source to confirm new metadata is live
- Verify favicon appears in the browser tab
- Verify social image URL opens directly
- Verify manifest file opens directly

## Optional next improvements
- Create raster `og-image.png` fallback for broader social compatibility
- Add analytics only after confirming performance and privacy expectations
- Add server redirects to force one canonical hostname if needed
