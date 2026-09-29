# SaaS UI rules, v2

A checklist for making AI-built software look and behave like a product people pay for. Version 1 used Attio as the visual reference. This version takes its principles and numbers from Apple's Human Interface Guidelines and OpenAI's published guidance for ChatGPT and for AI-generated frontends, and it corrects a few claims in v1 that didn't hold up.

Paste the whole file into Cursor, Lovable, Bolt or Claude and say "these are the rules." Part 7 is a shorter block written for exactly that.

---

## Part 0. What we borrow from Apple and ChatGPT, and what we don't

Both references agree on the core idea v1 already had. The interface should get out of the way of the content, and decoration is a cost. Apple's current guidance says to express hierarchy through layout and grouping rather than decoration. OpenAI's app guidelines say to reduce information and UI to the minimum the context needs.

Take from Apple:

- Semantic color roles instead of raw hex values in components
- Real accessibility floors for contrast, text size, tap targets and spacing
- Light, dark and increased-contrast versions of every color
- Nested corner radii that match each other, which Apple calls concentricity
- Respecting the Reduce Motion setting

Take from ChatGPT and OpenAI:

- System fonts in the product UI, with very few sizes
- One primary action and at most one secondary action per card
- Cards only when the card itself is the thing you interact with
- Monochrome, outlined icons
- Utility copy inside the product, marketing copy only on the landing page
- A defined token set before any screen gets built

Don't take:

- **Liquid Glass.** Apple's translucent material from 2025 got a harsh usability review from Nielsen Norman Group, which found less legible, less predictable controls laid over busy backgrounds. Apple later added a setting to make it more opaque. On the web, `backdrop-filter` blur also costs performance. If you want a hint of it, use a frosted navigation bar and nothing else. Never put glass behind body text, never stack glass on glass, and always give it a solid fallback.
- **Native-app assumptions.** Apple's system hands developers finished components. On the web you build them, so every state Apple gives for free, like hover, pressed, focus, disabled and loading, is your job.
- **ChatGPT's layout wholesale.** Its published guidelines are for widgets that live inside a chat. A dense B2B tool still needs tables, filters and side panels. OpenAI's own frontend skill tells the model to default to "Linear-style restraint" for app UI, which is a good summary of the target.

---

## Part 1. Undo what the AI gave you

Cursor, Lovable and Bolt build something functional in an afternoon, and they apply the same defaults every time. OpenAI's frontend team describes the cause plainly: when a prompt is vague, models fall back to the most common patterns in their training data, and many of those are habits, not good conventions.

The slop checklist from v1 still stands. Emoji decorations, glow shadows, clashing gradients, random font sizes, mixed corner radii, off-center labels, feature boxes of different sizes. Most of these take under an hour to fix.

### Icons

Replace every emoji used as an icon. Use one set only, Lucide or Phosphor on the web, SF Symbols in native Apple apps. Pick one stroke width and two sizes, 16px inline with text and 20px in toolbars, and never mix outline and filled styles except to show a selected state. ChatGPT asks for monochrome, outlined icons, and that works for most SaaS too.

An icon without a label is a guess. Put a text label next to any icon that triggers an action, or at least a tooltip and an `aria-label`. Status and metadata icons, like a calendar next to a date, can go unlabeled because the value explains them.

### Color

AI picks a saturated blue or purple and then adds a second bright accent that fights it. OpenAI's own prompt for GPT-5.4 has to tell the model to avoid purple-on-white defaults, which tells you how common this is.

The rule is one neutral scale, one accent, and a small set of status colors. Put color on the thing that means something, a status, a chart series, the one primary button. Apple says to reserve color for elements that truly benefit from emphasis and not to color the backgrounds of several controls at once. It also says never to use the same color to mean two different things. If blue means "clickable," blue text can't also be a heading style.

Color alone never carries meaning. People with red-green color blindness can't tell your "done" dot from your "blocked" dot. Pair every status color with a word or a shape. In the Sarah Chen example from v1, the fix is the dot plus the word "High," not the dot by itself.

Part 2 has the actual token values.

### Layout

The clearest tell of a generated app is repetition. The AI puts the same four KPI cards on the dashboard, the analytics page and the billing page because it doesn't remember what it already built.

Each page answers one question. Audit every page, write that question at the top of the file as a comment, and delete anything that doesn't serve it.

### Cards

OpenAI's rule is the best one I found. If removing the border, shadow, background or radius doesn't hurt interaction or understanding, it shouldn't be a card. Rows in a list, sections of a settings page and stat groups usually work better as plain layout with dividers and spacing.

When something is a card:

- One primary action and at most one secondary action. Everything else goes in the overflow menu.
- No scrolling inside the card.
- No tabs or multiple drill-in views inside the card.
- The number that matters sits on the right, aligned with the same number on every other card.
- Every card in a set uses the same hierarchy, title, then supporting text, then action.

If a slide-out panel holds four fields and a lot of empty space, use a centered modal. If a modal holds a multi-step workflow, it needs its own page.

### The question behind all of this

AI optimizes for a screen that looks finished. You need a screen that helps someone finish something. Ask of every element, "does this help the user do the job they came here for?" If it's decoration, delete it.

---

## Part 2. The one page of rules, as tokens

v1 said to write the rules down. v2 writes them for you. OpenAI recommends defining tokens like background, surface, primary text, muted text and accent before building, plus type roles like display, headline, body and caption. Apple's color system works the same way, with colors named by purpose, like label or separator, rather than by appearance.

Components only ever reference these names. No raw hex values inside components.

### Color tokens

Every pair below has been checked against WCAG AA. Normal text needs 4.5:1 contrast, and text 18pt or larger, or bold, needs 3:1. Apple's Accessibility Inspector uses the same thresholds.

| Token | Light | Dark | Use |
|---|---|---|---|
| `bg` | #FFFFFF | #171717 | Page background |
| `surface` | #F7F7F8 | #212121 | Sidebars, grouped sections |
| `surface-raised` | #FFFFFF | #2A2A2A | Menus, modals, popovers |
| `border` | #E5E5E5 | #333333 | Dividers and outlines, never text |
| `text` | #0D0D0D | #ECECEC | Primary content |
| `text-secondary` | #5D5D5D | #A3A3A3 | Supporting text, labels |
| `text-tertiary` | #6B6B6B | #939393 | Timestamps, hints |
| `accent` | #2563EB | #60A5FA | Primary button, links, selection |
| `on-accent` | #FFFFFF | #0D0D0D | Text on the accent color |
| `danger` | #DC2626 | #F87171 | Destructive actions, errors |
| `success` | #15803D | #4ADE80 | Completed states |
| `warning` | #B45309 | #FBBF24 | Needs attention |

Swap `accent` for your brand color, then re-check it. White text on your accent needs 4.5:1. A lot of bright brand greens and oranges fail this, and the fix is a darker shade for buttons.

Apple also asks for an increased-contrast variant of each color. On the web that means a `@media (prefers-contrast: more)` block that darkens `text-secondary`, `text-tertiary` and `border`. It takes ten minutes.

Border colors like #E5E5E5 are for lines. They fail contrast as text, and the AI will use them for placeholder text if you let it.

### Type

Inside the product, use the system font stack. ChatGPT does this, SF Pro on Apple devices and the platform sans-serif elsewhere, and OpenAI tells app builders to limit variation in font size and prefer body and body-small.

```css
font-family: -apple-system, BlinkMacSystemFont, "SF Pro Text", "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
```

On the landing page, one display face for headlines is fine. OpenAI's landing-page rules actually tell the model to avoid default stacks there. Keep body text on the system stack, and cap it at two typefaces.

| Role | Size / line height | Weight | Use |
|---|---|---|---|
| `display` | 32 / 40 | 600 | Landing hero only |
| `title` | 24 / 32 | 600 | Page title, one per page |
| `headline` | 17 / 24 | 600 | Section and card titles |
| `body` | 15 / 22 | 400 | Default text in the app |
| `body-small` | 13 / 18 | 400 | Secondary text, table cells in dense views |
| `caption` | 12 / 16 | 500 | Labels, timestamps, badges |

Nothing goes below 12px. Apple's minimum on iOS is 11pt and on macOS 10pt, with defaults of 17pt and 13pt. A web app sits between the two. Use weight and color for hierarchy before you reach for a new size. If a screen needs a seventh size, the layout is wrong.

Uppercase is for `caption` labels only, with a little letter spacing. Never uppercase a sentence.

Support text zoom. Apple wants text to scale to at least 200%, and WCAG asks the same of web pages. Use `rem` units and test at 200% browser zoom. Layouts break in cards with fixed heights first.

### Spacing

A 4px base with these steps only: 4, 8, 12, 16, 24, 32, 48, 64. Inside a component use 4 to 16. Between components use 16 to 32. Between page sections use 48 to 64.

### Corner radius

Pick one family and write it down.

| Token | Value | Use |
|---|---|---|
| `radius-sm` | 6px | Inputs, small buttons, badges |
| `radius-md` | 10px | Cards, menus |
| `radius-lg` | 16px | Modals, sheets |
| `radius-full` | 9999px | Avatars, and pill buttons if you choose pills |

Buttons are either all `radius-sm` or all pills. Apple moved large controls to capsule shapes in 2025, and that's a reasonable choice, but only if you apply it everywhere.

Nested corners follow one rule from Apple's concentricity idea. The inner radius equals the outer radius minus the padding between them. A 16px modal with 8px padding holds elements with an 8px radius. When the AI puts a 12px-radius button inside a 12px-radius card with 4px padding, the corners look wrong and nobody can say why. This is why.

### Sizes and hit areas

WCAG 2.2 level AA requires pointer targets of at least 24 by 24 CSS pixels, or enough spacing around smaller ones. Apple's default control size on iOS is 44 by 44 points. Use both.

- Desktop buttons and inputs are 36px tall. Compact table actions can go to 28px.
- Anything tappable on a touch screen gets a 44px hit area, even if the icon inside is 20px. Padding counts toward the target.
- Apple suggests about 12 points of padding around controls that have a visible background and about 24 around controls that don't. That stops people tapping the wrong button.

### Shadows

Borders separate. Shadows mean "this floats above the page." That leaves exactly three things with a shadow, menus, popovers and modals. Cards don't get one. The "start here" card in onboarding is the one exception, and Part 3 covers it.

### Words

Write the verb list into the rules file, because the AI will drift.

| Action | Always | Never |
|---|---|---|
| Remove permanently | Delete | Remove, Trash, Destroy |
| Take out of a group but keep | Remove | Delete |
| Make new | Create | Add new, New, Make |
| Persist changes | Save | Submit, Apply, Update |
| Close without saving | Cancel | Discard, Dismiss, Back |
| Start the product | Start free trial | Get started, Try it, Sign up free |

"Delete" and "Remove" mean different things, and that difference is why the words need to stay consistent. Name the object in buttons whenever it fits. "Delete project" beats "Delete," which beats "OK."

---

## Part 3. The laws that don't change

Trends turn over every few years, skeuomorphic, flat, neumorphic, glass. Underneath them sits a small set of principles.

### Start with intent and delete the rest

Before you draw anything, write down what the person arrived to do. Capern's app was a table of investors with filters, a contact count, an export button and a credit balance in the corner. That was the whole product.

Add a feature when the user's intent expands, never because there's space to fill. Before adding anything, try deleting something. OpenAI's version of this for ChatGPT apps is "extract, don't port." Find the few core jobs and build those, rather than mirroring everything the product could do.

### Hierarchy

Every screen is a sentence and something has to be the subject. Pick the one element per screen that matters and turn the volume down on everything around it with weight, color and space. Basecamp does this with bold titles and muted secondary text and nothing else.

A quick test from OpenAI's frontend skill. If someone scans only the headings, labels and numbers on a screen, can they tell what it's for?

### Utility copy inside the product

This is new in v2. The copy advice on landing pages, "promise an outcome," is wrong inside the app. OpenAI's frontend skill draws the line clearly.

- Headings say what the area is or what you can do there, like "Plan status," "Last sync" or "Top segments."
- Supporting text explains scope, behavior or freshness in one sentence, like "Updated every 15 minutes from Stripe."
- No hero sections, slogans or "Supercharge your workflow" banners inside a dashboard.
- If a sentence could run in an ad, rewrite it until it sounds like a label.

### Design for the ugly data

Load real data before you judge a screen. Long company names, zero rows, ten thousand rows, a missing avatar, a failed sync.

- Truncate by width, not by character count. Fifteen characters of "W" and fifteen of "i" are very different widths. Use `text-overflow: ellipsis`, and show the full value in a tooltip and on the detail page.
- Truncate file names and IDs in the middle, like `invoice_2026…_final.pdf`, so the end stays readable.
- Never truncate numbers. Abbreviate them, like 12.4K, and put the exact figure in the tooltip.
- Every list has four states you design on purpose. Loading, empty, error and full. The empty state says why it's empty and offers the one action that fills it.
- Error messages say what happened, why, and what to do next. "Couldn't connect to Stripe. Your API key expired. Reconnect Stripe." Never "Something went wrong."

### Onboarding

The first minutes of a trial are when people are least patient. Don't force a tutorial, because people click through without reading.

Show one obvious action, then reveal the next when they finish it. The first step should be impossible to miss. A "Start here" card can break the no-shadow rule and use the accent color. It's the one place where loud is correct, because it's the only thing on the screen that matters yet.

Add a progress bar so people can see the finish line, and celebrate completion. Confetti on the first connected account works, as long as it respects reduced motion. Keep the follow-up email that says what to do next.

### Waiting

v1 said a one-second delay costs 7% of conversions. That number is real but narrow. It comes from a 2008 Aberdeen Group report on page load times for websites. It's still directionally true, but don't quote it as a fact about in-app actions.

Nielsen Norman Group's thresholds are more useful for deciding what to build.

| Wait | Show |
|---|---|
| Under 1 second | Nothing. An indicator that flashes for 200ms looks like a glitch |
| 1 to 10 seconds, whole page or panel | A skeleton that matches the real layout |
| 1 to 10 seconds, one element | A small spinner inside that element, like a button |
| Over 10 seconds | A progress bar with an estimate, and a Cancel button |
| Minutes | Let them leave, and notify them when it's done |

A skeleton that only shows a header and an empty box doesn't count, because NN/g found it tells the user nothing. It has to preview the real layout.

I dropped v1's trick about using Apple's system spinner so users blame the phone. It's anecdotal, it doesn't exist on the web, and it's a small dishonesty the rest of this document argues against.

For long jobs, a playful loader is fine, like PostHog's hedgehog. Pair it with real progress text, like "Enriching 140 of 600 leads," because a joke alone doesn't answer "is it stuck?"

### AI features

Most of what you build now has a model in it. OpenAI's ChatGPT shows streaming with a shimmer on the composer while a response is on its way. The pattern generalizes.

- Show that the model is working within 100ms, then stream output as it arrives rather than waiting for the whole thing.
- Say what it's doing in plain words, like "Reading 3 files" or "Searching your CRM," not "Thinking…"
- Always give a Stop button while it runs.
- Anything the AI produces that changes data, like sending an email or updating a record, lands as a draft the user reviews first, unless the user turned that off.
- Show where facts came from when the AI states them.

### Show value in numbers

Business buyers have to justify the subscription to a boss or to themselves, and if the app doesn't show what it achieved, they assume it achieved nothing. Put a small scoreboard on the dashboard, like "This month: 25 posts, about 10 hours saved." Count real events. If "hours saved" is an estimate, say how you estimated it, because a buyer who catches one inflated number stops trusting the rest.

### Destructive actions

v1 had this mostly right and got one detail wrong. Research on confirmation dialogs points one way. People stop reading dialogs they see often, so every unnecessary "Are you sure?" weakens the ones that matter. NN/g's advice is to not overuse them, make them specific, and provide undo wherever you can.

So there are three tiers.

1. **Reversible actions** get no dialog. Archiving, removing from a list, deleting a row that goes to Trash. Do it, then show "Project deleted" with an Undo button.
2. **Irreversible actions** get a specific dialog. The title names the object, "Delete Q3 launch plan?" The body names the consequence, "This deletes the project and its 14 tasks. You can't undo this." The button repeats the verb, "Delete project," and styles it in `danger`. The default focus goes to Cancel.
3. **Irreversible actions with a big blast radius**, like deleting a database, a workspace or billing data, also require typing the name. That's what Supabase does, and it should feel tedious.

The fix to v1 is the undo timer. A toast that disappears after 5 seconds fails people who read slowly or use a screen reader. Apple's accessibility guidance says to minimize elements that auto-dismiss on a timer, and NN/g flags Google Drive's short-lived undo snackbar as a problem. Keep the Undo toast until the user dismisses it or leaves the page, and back it with a Trash that keeps items for 30 days.

After any action, show that it finished. A checkmark on the button, the row updating in place, a toast. The Zeigarnik effect from v1 still applies, because unfinished-feeling actions nag at people.

### Motion

v1 banned almost all animation in the app. That's close, but too strict. Motion is useful when it explains a change, like a panel sliding in from the side it lives on or a deleted row collapsing so you see where it went.

- Product UI animates state changes only. Keep durations between 150 and 250ms, use ease-out, and never animate things on page load.
- No scrolljacking, no parallax, nothing flying in from the edges.
- Respect `prefers-reduced-motion`. Apple's list is specific. Replace sliding and zooming with fades, reduce bounce, and don't animate in and out of blurs. Confetti becomes a static checkmark.
- Landing pages get more room. OpenAI's frontend guidance suggests two or three intentional motions for visual pages, like one entrance in the hero and one scroll-linked effect, and removing any that are only ornamental.

The test is the same as v1. Does this motion tell the user something?

Use a Load More button instead of infinite scroll for anything task-based. NN/g found that infinite scroll can make the footer impossible to reach, and in e-commerce testing Load More avoided the problems of both pagination and infinite scroll.

### Accessibility

v1 never mentioned it, and it's where Apple's guidance is strongest. Most of it is already in the tokens above. What's left:

- Every interactive element has a visible focus ring. Use a 2px `accent` outline with a 2px offset, and never `outline: none` without a replacement.
- Everything works with the keyboard. Tab reaches every control in a sensible order, Escape closes modals and menus, and Enter submits.
- Sticky headers and cookie banners must not cover the focused element, which is a WCAG 2.2 requirement.
- Every image has alt text, and every icon-only button has an `aria-label`.
- Test both light and dark mode, because contrast that passes in one often fails in the other.
- Any drag interaction also works with a click or a button.

---

## Part 4. Landing pages

The landing page is where a vibe-coded product loses most of its visitors. It needs a clear reason to be here, a clear thing being sold and a clear reason to buy.

### First screen

OpenAI's frontend guidance calls the first viewport a poster, not a document. It sets a budget for that first screen.

- The product name, one headline, one short supporting sentence, one group of calls to action, and one dominant visual.
- No stat strips, logo clouds, pill badges, floating cards or feature lists above the fold.
- The product name has to be unmistakable. If you hide the nav and the page could belong to another company, the branding is too weak.
- Headlines run two or three lines at most on desktop.

That also settles v1's "kill the alternating layout" advice. Stack the hero and give it room.

### The visual

v1 said to replace stock photos with a screenshot of your product, and that's still right for SaaS. Crop the screenshot to the part that proves the section's point. A full dashboard makes the visitor hunt for what matters.

A real product shot is the dominant visual in the hero. Decorative gradients and abstract 3D shapes don't count as one.

### Structure

OpenAI suggests this order, and it matches what worked for Paper Schedule in v1.

1. Hero, with the promise and the call to action
2. One concrete proof point or feature
3. Detail, like how the workflow runs, in about three steps
4. Social proof, like reviews and customer logos
5. Pricing and FAQs
6. A final call to action

Each section gets one job, one headline and usually one sentence. If deleting 30% of the copy improves the page, keep deleting.

### Calls to action

Every call to action for the same destination uses the same words. Pick "Start free trial" and use it in the nav, the hero, the pricing card and the footer. A secondary action like "Book a demo" can sit next to it in a quieter style, and there are only ever those two.

### Copy

On the landing page, and only there, shift copy from what it does to what it gets them. "Collect and analyze your data" becomes "Turn your data into decisions." Inside the app, go back to utility copy.

### Extras that look expensive

A bento grid instead of four identical feature cards, so the most important feature gets the most room. A row of customer logos, with no more than six. A mega menu if you have several products, since it tells visitors there's depth. All of these still follow the one-accent color rule.

---

## Part 5. Getting a design without designing

Screenshots still work, and OpenAI says the same. Reference images help the model infer layout rhythm, type scale, spacing and imagery treatment. Keep a folder from Mobbin or Dribbble, and add screenshots of Apple's own apps like Settings, Reminders and Notes, plus ChatGPT's settings screens, since both are clean examples of the style this document describes.

Three things improve the results.

- Attach the screenshots and this file together. The screenshots give the look, the file gives the rules.
- Give the AI your real copy and product details before it builds. OpenAI found that real content is one of the simplest ways to get better output, because otherwise it fills the page with generic placeholder patterns.
- If your tool can run a browser, like Playwright, have the AI screenshot its own work at desktop and mobile widths and compare it to your reference before calling it done.

Figma files you can use as a starting point. Apple publishes UI kits for its platforms at developer.apple.com/design/resources. OpenAI publishes a Figma component library and a React and Tailwind design system for ChatGPT apps called `@openai/apps-sdk-ui`. Even if you're not building for ChatGPT, its tokens are a good reference for sizes and spacing.

---

## Part 6. Self-check before shipping a screen

- Can I state the one question this page answers?
- Is there exactly one primary action on screen?
- Does every color mean something, and is that meaning also shown with a word or shape?
- Does every text color pass 4.5:1 in both light and dark mode?
- Are there six or fewer text sizes, all from the scale?
- Do nested corners follow the outer-minus-padding rule?
- Does every card need to be a card?
- Have I seen this screen with ugly data, no data and an error?
- Does every wait longer than a second show something, and every wait longer than ten show progress?
- Can I finish the main task with only the keyboard?
- Does anything move without explaining a change?
- Does every destructive action have undo, or a specific dialog if it can't be undone?
- Does the copy read like a label, not an ad?

---

## Part 7. Paste this into your AI tool

```
You are building UI for a SaaS product. Follow these rules exactly. If a rule conflicts with an existing design system in this codebase, keep the existing system and tell me.

Style: calm, restrained, like Apple's own apps and ChatGPT's settings screens. Hierarchy comes from layout, spacing, weight and color, never decoration. Minimal chrome, dense but readable data.

Tokens: define CSS variables first and only reference them in components. Colors: bg, surface, surface-raised, border, text, text-secondary, text-tertiary, accent, on-accent, danger, success, warning, each with light and dark values that pass WCAG AA (4.5:1 for normal text). No raw hex values in components. One accent color. No gradients, no glow, no colored backgrounds on multiple controls.

Type: system font stack in the app. Sizes only 12, 13, 15, 17, 24, and 32 for the landing hero. Weights 400, 500, 600. Uppercase only for small labels. Use rem units.

Spacing: 4, 8, 12, 16, 24, 32, 48, 64 only. Radius: 6px inputs and buttons, 10px cards and menus, 16px modals. Inner radius = outer radius minus padding. Shadows only on menus, popovers and modals.

Icons: Lucide only, 1.5px stroke, 16px inline and 20px in toolbars, outline style. No emojis anywhere in the UI. Icon-only buttons need aria-label and a tooltip.

Cards: only when the card is the interaction. Max one primary and one secondary action, extra actions in an overflow menu. No scrolling or tabs inside cards. Otherwise use plain rows with dividers.

Pages: each page answers one question. Do not repeat KPI cards across pages. Product copy is utility copy: headings say what the area is, no slogans or hero sections inside the app.

States: design loading (layout-matching skeleton for 1-10s, progress bar with cancel over 10s), empty (why it's empty plus one action), error (what happened, why, what to do), and full. Truncate text by width with the full value in a tooltip. Never truncate numbers.

Actions: verbs are Delete (permanent), Remove (from a group), Create, Save, Cancel. Reversible actions happen immediately with an Undo toast that stays until dismissed. Irreversible actions use a dialog that names the object and the consequence, with a button that repeats the verb and default focus on Cancel.

Motion: only for state changes, 150-250ms, ease-out. Nothing animates on page load. Respect prefers-reduced-motion by replacing movement with fades. No parallax, no scrolljacking. Use Load More instead of infinite scroll.

Accessibility: visible 2px focus ring on everything interactive, full keyboard support, Escape closes overlays, hit areas at least 24x24px on desktop and 44x44px on touch, color never the only signal.

Before you finish, check every screen against these rules at desktop and mobile widths and in light and dark mode, and list anything you couldn't follow.
```

---

## What changed from v1

- **Reference.** Attio swapped for Apple's HIG and OpenAI's ChatGPT and frontend guidance, with Linear-style restraint kept for dense app screens.
- **Tokens added.** v1 said to write the rules down. v2 includes contrast-checked colors in light and dark, a type scale, spacing, radii and hit sizes.
- **Accessibility added.** Contrast, target size, focus, keyboard, reduced motion, text zoom and color-plus-label for status.
- **88% statistic.** v1 said 88% of users abandon and don't pay after one bad experience. The widely repeated figure, usually credited to a Gomez study from around 2009, says 88% of online consumers are less likely to return to a site after a bad experience. It's old, about websites, and about returning, not paying. I removed it rather than restate it.
- **7% statistic.** Kept with its real source, a 2008 Aberdeen report on page loads.
- **Undo timer.** The 5-second undo became an undo that stays until dismissed, plus a Trash.
- **Confirmations.** Tiered by reversibility instead of "confirm anything destructive."
- **Loading.** NN/g's time thresholds replaced "a progress indicator for anything over a second."
- **Apple spinner trick.** Removed.
- **Character truncation.** Changed from 15 characters to width-based.
- **Motion.** Loosened slightly for state changes, tightened with reduced-motion support.
- **Utility copy vs marketing copy.** New section.
- **Cards.** OpenAI's "remove the border and see if anything breaks" test added.
- **AI features.** New section on streaming, stop, drafts and sources.
- **Landing page.** OpenAI's first-screen budget added.

---

## Sources

- Apple, Human Interface Guidelines: Accessibility. developer.apple.com/design/human-interface-guidelines/accessibility
- Apple, Human Interface Guidelines: Color. developer.apple.com/design/human-interface-guidelines/color
- Apple, "Get to know the new design system," WWDC25. developer.apple.com/videos/play/wwdc2025/356
- OpenAI, Apps SDK UI guidelines. developers.openai.com/apps-sdk/concepts/ui-guidelines
- OpenAI, Apps SDK UX principles. developers.openai.com/apps-sdk/concepts/ux-principles
- OpenAI, "Designing delightful frontends with GPT-5.4," March 2026. developers.openai.com/blog/designing-delightful-frontends-with-gpt-5-4
- OpenAI, Apps SDK UI design system. github.com/openai/apps-sdk-ui
- Nielsen Norman Group, "Liquid Glass Is Cracked, and Usability Suffers in iOS 26," October 2025. nngroup.com
- Nielsen Norman Group, "Skeleton Screens 101." nngroup.com/articles/skeleton-screens
- Nielsen Norman Group, "Progress Indicators Make a Slow System Less Insufferable." nngroup.com/articles/progress-indicators
- Nielsen Norman Group, "Confirmation Dialogs Can Prevent User Errors, If Not Overused." nngroup.com/articles/confirmation-dialog
- Nielsen Norman Group, "User Control and Freedom." nngroup.com/articles/user-control-and-freedom
- Nielsen Norman Group, "Infinite Scrolling: When to Use It, When to Avoid It." nngroup.com/articles/infinite-scrolling-tips
- Baymard Institute via Smashing Magazine, "Infinite Scrolling, Pagination or Load More Buttons?" 2016
- W3C, WCAG 2.2, Success Criteria 2.4.11 and 2.5.8
- WPO Stats, Aberdeen Group 2008 page-load study. wpostats.com
