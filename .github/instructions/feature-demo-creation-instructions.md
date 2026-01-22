
# Demo Creation Prompt - Understanding the task

---

## Context for the Agent

You are being asked to create a **demonstration of actual working functionality** in a software project, capturing real UI/UX functionality through video, GIF, or screenshot formats.

---

### Key Principles

1. **Authenticity First**: Only demo features that actually work in the codebase
2. **No Mockups: Never create fake html/CSS/JS demos - use the real application
3. **Real User Interactions**: Capture actual user workflows, not simulated ones
4. **Production Quality**: Use built/compiled versions when possible
5. **Multiple Formats**: Provide video (MP4), animated (GIF), and screenshots (PNG)

---

## Information You Need To Father

Before starting the demo, you MUST determine:

### 1. Application Architecture
- [ ] What type of application is it? (web app, desktop app, CLI tool, mobile app, etc.)
- [ ] What framework/technology? (React, Vue, Angular, Next.js, Electronic, etc.)
- [ ] How is it built? (npm/pnpm build, webpack, vite, turbo, etc)
- [ ] How is it served? (dev server, static files, SSR, etc.)

### 2. Current Implementation Status
- [ ] What features are actually implemented? (Check plan/tracker documents)
- [ ] What is the current phase of development?
- [ ] Which components exist and are testable?
- [ ] Are there any known blockers or broken features?

### 3. Build and Run Requirements
- [ ] What commands built the application?
- [ ] What commands run the application?
- [ ] What ports does it use?
- [ ] Are there dependencies between services? (e.g. API + frontend)
- [ ] Can it run without a database/backend? (frontend-only demo possible?)

### 4. Demo Capture Strategy
- [ ] Can dev server be started? (preferred for hot reload)
- [ ] Can production build be served? (fallback if dev server issues)
- [ ] What tool will capture the demo? (Puppeteer, Playwright, manual recording)
- [ ] What user journey makes sense to demonstrate?
- [ ] What is the most impressive/interesting UX feature?

---

## Step-by-step Process

### Phase 1: Research (DO NOT SKIP)

1. **Read the README.md** Understand what the project does
2. **Read implementation plans** Know what's suppoed to be built
3. **Read the tracker** Know wha's ACTUALLY build and tested
4. **Check package.json files** - Understand build/dev commands
5. **Review directory struction** - Locate frontend/backend code
6. **Check test results** - Verify features are working

### Phase 2: Verify Functionality

1. **Attempt to build** - Run build commands to ensure no errors
2. **Attempt to start dev server** - Check if application runs
3. **Identify blockers** - Note any platform issues (native modules, etc.)
4. **Choose the fallback strategy** - If dev server ails, use production build
5. **Verify in browser** - Manually navigate to ensure pages load

### Phase 3: Choose Demo Feature

Select the most interesting **implemented and working** UX feature:

- **Visual/Interactive**: Drag-and-drop, animation, real-time updates
- **User-Centric**: Workflows that solve a problem
- **Impressive**: Feature that showcase technical capability
- **Complete**: Eng-to-end functionality, not partial implementation

**Anti-patterns to avoid:** 
- ❌ Demoing a feature that's not implemented
- ❌ Demoing broken functionality
- ❌ Creating fake demo pages to "show what it would look like"
- ❌ Using Lorem Ipsum or placeholder content

### Phase 4: Capture the Demo

#### Automated Browser Capture (Preferred)

Tools: Playwright or Puppeteer

**Steps:**
1. Start the application server (dev or production)
2. Write a capture script that:
    - Launches the browser
    - Navigates through the user journey
    - Takes screenshots at key moments
    - Optionally performs interactions (clicks, drags, form fills, etc.)
    - Saves scrneeshots to a directory

**Example Flow:**
```javascript
// Pseudocode
await page.goto("http://localhost:3000")
await page.screenshot({path: '01-landing.png'})

await page.click('a[href="/workflows"]')
await page.waitForNavigation()
await page.screenshot({path: '02-workflows.png'})

await page.goto('http://localhost:3000/workflows/new')
await page.screenshot({path: '03-editor.png'})
```

### Phase 5: Create Media Formats:

Ussing FFmeg (or similar)

1. **Animated GIF**
    ```bash
    ffmeg -framerate 0.5 -i 'screenshots/*.png' \
    -vf "scale=1200:-1:flags=lanczos,palettegen" \
    output.gif   
    ```
2. **MP4 Video** - Better quality, smaller size
    ```bash
    ffmeg -framerate 0.5 -i 'screenshots/*.png' \
    -c:v libx264 -pix_fmt yuv420p \ "scale=1200:-1:flags=lanczos,palettegen" \
    output.mp4   
    ```

3. **Keep original screenshots** - Full resolution reference

### Phase 6 Document the Demo

Create a comprehensive README that includes:

1. **What is being demonstrated** - Feature name and description
2. **Why is matters** - User benefits, problem solved
3. **Technical details** - Technologies used, implementation notes
4. **How demo was created** Reproducible process
5. **Current status** - What's done, what's pending
6. **How to view** - Instructions for each format (GIF, MP4, screenshots)

---

## File Naming Converntion

Follow this pattern: '<YYYY-MM-DD>-<feature-description>.<ext>'

**Examples:**

- `2026-01-14-workflow-builder-demo.mp4`
- `2026-01-14-drag-and-drop-canvas.gif`
- `2026-01-14-real-time-execution.png`

**Directory structure:**

```
demos/
├── 2026-01-14-workflow-builder.gif
├── 2026-01-14-workflow-builder.mp4
├── screenshots/
│   ├── 01-landing.png 
│   ├── 02-feature.png
│   ├── 03-result.png
├── README.md (or INDEX.md)
└── [feature-name]-demo-guide.md
```

---

## Common Pitfalls and Solutions

### Pitfall 1: "The application won't start"
**Solutions:**
- Check for platform-specific antive modules (netter=sqllite3, esbuild, etc.)
- Try the production build instead of dev server
- Server status files with simple HTTP server
- Document the blocker and demo what IS working

### Pitfall 2: "I can't find the feature"
**Solutions:**
- Re-read the tracker to confirm the feature is implemented
- Check test files to see what's covered
- Look at component files to understand structure
- Ask user to clarify which feature to demo

### Pitfall 3: "The demo shows errors or broken UI"
**Solutions:**
- DON'T include broken functionality in demo
- Choose a different feature that works
- Demo a smaller scope that is fully functional
- Document what's broken in the associated plan and tracker as a bug to address in a future iteration. 

### Pitfall 4: "The capture tool isn't working"
**Solutions:**
- Verify Puppeteer/Playright is installed correctly
- Check that browser can access the application URL
- Use manual screenshots as a fallback
- Document the process for future automation

### Pitfall5: "The demo is boring/not impressive"
**Solutions:**
- Focus on interactive features (drag-drop, animations)
- Show a complete user workflow (start to finish)
- Highlight what makes this feature uniqu
- Compare before/after or manual vs. automated

---

## Questions to Ask Yourself

Before finalizing the demo, verify:

- [ ] Does this demo show REAL functional from the actual codebase?
- [ ] Would a stakeholder understand what problem this solves?
- [ ] Is the demo visually clear and professional?
- [ ] Are all demo files properly named and organized?
- [ ] Is the documentation complete and helpful?
- [ ] Can someone reproduce this demo process?
- [ ] Does this accurately represent the implementation status?

---

## Output Deliverables

A complete demo includes:

1. ✅ **Video files(s)**: MP4 and/or GIF showing the feature in action
2. ✅ **Screenshots**: Individual PNG files at key moments (full resolution)
3. ✅ **Documentation**: Markdown file(s) explaining the demo
4. ✅ **Reproducibility**: Scripts or instruction to recreate the demo 
5. ✅ **Context**: Links to implementation plans, tracker, source code

---

## Success Criteria 

A successful demo: 

- ✅ Is suitable for showing to stakeholders in a sprint review
- ✅ Shows real, working functionality
- ✅ Captures an interesting UX feature
- ✅ Includes multiple formats (video, gif, screenshots)
- ✅ Is well-documented
- ✅ Follows naming conventions
- ✅ Is reproducible
- ✅ Accurately represent implementation status


## Anti-patterns to avoid:
- ❌ Creating a mock HTML pages to "show what it would look like"
- ❌ Demoing a features that aren't implemented
- ❌ Using fake data or Lorum Ipsum extensively
- ❌ Showing broken or error-filled UI
- ❌ Capturing dev tools, console errors, or debug output
- ❌ Making the demo too long (>2 minutes)
- ❌ Poor video quality or tiny resolution
- ❌ Missing documentation



## Notes for the Agent

- **When in doubt, ask the user** which features to demo
- **Verify functionality before demoing** - run tests, check code
- **Be honest about limitations** if something doesn't work, say so
- **Focus on what IS working**  - don't try to fake it
- **Document your process** - help future agents learn from your approach or mistakes
- **Quality over quantity** - one great demo beats five mediocre ones

---

## Final Checklist

Before submitting the demo: 

- [ ] I have verified this feature is actually implemented
- [ ] I have successfully run the application
- [ ] I have capture real user interactions, not mockups
- [ ] I have created both GIF and MP4 formats
- [ ] I have included high-resolution screenshots
- [ ] I have written comprehensive documentation
- [ ] I have followed the file naming convention
- [ ] I have organized files in the demos/ directory
- [ ] I have tested that all media files are viewable
- [ ] I am confident this represents production-quality work

---

## Additional Context

This prompt is part of an "integrative development process where:
- Agents implement features based on detailed plans"
- Progress is tracked in a tracker document
- Demos are created to showcase completed work
- Demos serve as validation that features work as intended
- Demos are used for stakeholder communication and documentation

This demo is a **deliverable**, not just documentation. It should be:
- Professional enough for a sprint review
- Technical enough for developers to understand
- User-focused enough for non-technical stakeholders
- Honest about what's working and what's not.