# React Hello World Minimal Implementation Plan

## Overview

Create a minimal but production-ready React "Hello World" application using Vite, React 19, and TypeScript, incorporating essential development tools (ESLint, Prettier, Vitest) and following 2026 best practices. This implementation focuses on simplicity while maintaining code quality standards.

## Current State Analysis

The workspace is currently empty with no existing React application. This is a greenfield implementation starting from scratch.

## Desired End State

A fully functional React "Hello World" application that:
- Runs on Vite with fast HMR
- Uses TypeScript for type safety
- Follows React 19 modern patterns (no manual React imports, modern JSX transform)
- Has working ESLint and Prettier configuration
- Includes Vitest test setup with at least one passing test
- Displays "Hello World, React + Vite 2026!" in the browser
- Can be built for production
- Uses basic CSS (no CSS frameworks)

### Verification:
- `npm run dev` starts development server at http://localhost:5173
- Browser shows "Hello World, React + Vite 2026!" message
- `npm run build` creates production bundle in `dist/`
- `npm run test` runs tests successfully
- `npm run lint` passes with no errors
- All TypeScript compilation succeeds

## What We're NOT Doing

- CSS frameworks (Tailwind, Bootstrap, etc.) - using basic CSS only
- State management libraries (Zustand, Redux) - not needed for Hello World
- Routing (React Router) - single page only
- UI component libraries (Material UI, shadcn/ui) - minimal approach
- API integration or data fetching
- Advanced React 19 features (Server Components, Server Actions)
- CI/CD pipeline setup
- Deployment configuration
- Docker containerization
- Pre-commit hooks (Husky)
- Error boundaries - too advanced for minimal Hello World

## Implementation Approach

Follow the Vite + React + TypeScript scaffolding approach, then layer in essential development tools. Each phase builds incrementally and includes automated verification to ensure correctness before proceeding.

---

## Phase 1: Project Scaffolding

### Overview
Initialize the Vite project with React TypeScript template and verify the baseline Vite application works correctly.

### Spec Coverage
Implements specifications: 1.1, 2.1, 2.2, 3.1, 3.2, 3.3

### Key Deliverables
1. Vite project scaffolded with react-ts template
2. Dependencies installed and node_modules populated
3. Development server runs successfully
4. Default Vite+React app displays in browser

### Changes Required

#### 1. Project Initialization
**Command**: `npm create vite@latest react-hello-world -- --template react-ts`
**Result**: Creates new directory `react-hello-world/` with Vite+React+TypeScript template

**Expected file structure:**
```
react-hello-world/
├── src/
│   ├── App.tsx
│   ├── App.css
│   ├── main.tsx
│   ├── index.css
│   └── vite-env.d.ts
├── public/
├── index.html
├── package.json
├── tsconfig.json
├── tsconfig.node.json
├── vite.config.ts
└── .gitignore
```

#### 2. Install Dependencies
**Command**: `cd react-hello-world && npm install`
**Result**: Installs all dependencies from package.json

### Success Criteria

#### Automated Verification:
- [ ] Project directory exists: `test -d react-hello-world`
- [ ] package.json exists: `test -f react-hello-world/package.json`
- [ ] node_modules installed: `test -d react-hello-world/node_modules`
- [ ] TypeScript config valid: `cd react-hello-world && npx tsc --noEmit`
- [ ] Vite config loads: `cd react-hello-world && npx vite --version`

#### Manual Verification:
- [ ] Run `npm run dev` and verify dev server starts on http://localhost:5173
- [ ] Open browser and confirm default Vite+React page loads
- [ ] Verify hot module replacement works by editing App.tsx and seeing instant updates

**Implementation Note**: After completing this phase and all automated verification passes, pause here for manual confirmation that the dev server and HMR work correctly before proceeding to the next phase.

---

## Phase 2: Development Tooling Setup

### Overview
Configure ESLint and Prettier for code quality, consistency, and to enforce React and TypeScript best practices.

### Spec Coverage
Implements specifications: 6.2, 6.3

### Key Deliverables
1. ESLint installed and configured with React and TypeScript plugins
2. Prettier installed and integrated with ESLint
3. npm scripts added for linting
4. All existing code passes linting

### Changes Required

#### 1. Install ESLint and Prettier
**File**: `react-hello-world/package.json` (via npm install)

```bash
npm install -D eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint-plugin-react eslint-plugin-react-hooks eslint-config-prettier eslint-plugin-prettier prettier
```

#### 2. ESLint Configuration
**File**: `react-hello-world/.eslintrc.json` (create new)

```json
{
  "env": {
    "browser": true,
    "es2021": true
  },
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:react/jsx-runtime",
    "plugin:@typescript-eslint/recommended",
    "plugin:react-hooks/recommended",
    "prettier"
  ],
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "ecmaFeatures": {
      "jsx": true
    },
    "ecmaVersion": "latest",
    "sourceType": "module"
  },
  "plugins": ["react", "@typescript-eslint", "prettier"],
  "rules": {
    "prettier/prettier": "error",
    "react/react-in-jsx-scope": "off"
  },
  "settings": {
    "react": {
      "version": "detect"
    }
  }
}
```

#### 3. Prettier Configuration
**File**: `react-hello-world/.prettierrc.json` (create new)

```json
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": false,
  "printWidth": 80,
  "tabWidth": 2
}
```

#### 4. Add ESLint Ignore
**File**: `react-hello-world/.eslintignore` (create new)

```
dist
node_modules
*.config.js
*.config.ts
```

#### 5. Add Lint Scripts
**File**: `react-hello-world/package.json`
**Changes**: Add scripts section entries

```json
{
  "scripts": {
    "lint": "eslint . --ext ts,tsx --report-unused-disable-directives --max-warnings 0",
    "lint:fix": "eslint . --ext ts,tsx --fix",
    "format": "prettier --write \"src/**/*.{ts,tsx,css}\""
  }
}
```

### Success Criteria

#### Automated Verification:
- [ ] ESLint config file exists: `test -f react-hello-world/.eslintrc.json`
- [ ] Prettier config file exists: `test -f react-hello-world/.prettierrc.json`
- [ ] ESLint runs without errors: `cd react-hello-world && npm run lint`
- [ ] Prettier can format files: `cd react-hello-world && npm run format`

#### Manual Verification:
- [ ] Open any .tsx file and verify VS Code shows ESLint errors/warnings
- [ ] Verify Prettier formats files on save (if editor is configured)
- [ ] Intentionally add a linting error and confirm `npm run lint` catches it

**Implementation Note**: After completing this phase and all automated verification passes, pause here for manual confirmation that linting and formatting work correctly before proceeding to the next phase.

---

## Phase 3: Hello World Implementation

### Overview
Replace the default Vite template code with a minimal Hello World implementation using basic CSS styling.

### Spec Coverage
Implements specifications: 5.1, 5.2, 5.3, 7.2

### Key Deliverables
1. App.tsx simplified to Hello World component
2. Basic CSS styling for centered layout
3. Clean, minimal code following React 19 patterns
4. No unused template files

### Changes Required

#### 1. Update App Component
**File**: `react-hello-world/src/App.tsx`

```tsx
function App() {
  return (
    <div className="app">
      <h1>Hello World, React + Vite 2026!</h1>
      <p>A minimal React application built with modern best practices.</p>
    </div>
  );
}

export default App;
```

#### 2. Update App Styles
**File**: `react-hello-world/src/App.css`

```css
.app {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  text-align: center;
  padding: 2rem;
}

h1 {
  font-size: 3rem;
  margin-bottom: 1rem;
  color: #2c3e50;
}

p {
  font-size: 1.2rem;
  color: #7f8c8d;
}
```

#### 3. Update Global Styles
**File**: `react-hello-world/src/index.css`

```css
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

#### 4. Main Entry Point (verify, likely no changes needed)
**File**: `react-hello-world/src/main.tsx`

Should already contain:
```tsx
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
```

#### 5. Remove Unused Assets
**Files to delete**:
- `react-hello-world/src/assets/react.svg` (if exists)
- Any other default template assets not used

### Success Criteria

#### Automated Verification:
- [ ] TypeScript compiles: `cd react-hello-world && npx tsc --noEmit`
- [ ] Linting passes: `cd react-hello-world && npm run lint`
- [ ] Build succeeds: `cd react-hello-world && npm run build`
- [ ] Build output exists: `test -d react-hello-world/dist`

#### Manual Verification:
- [ ] Run `npm run dev` and verify "Hello World, React + Vite 2026!" displays prominently
- [ ] Verify text is centered both horizontally and vertically
- [ ] Verify subtitle text appears below heading
- [ ] Edit App.tsx text and confirm HMR updates instantly
- [ ] Run `npm run preview` to test production build and verify it works identically

**Implementation Note**: After completing this phase and all automated verification passes, pause here for manual confirmation that the Hello World app displays correctly and HMR works before proceeding to the next phase.

---

## Phase 4: Testing Setup

### Overview
Add Vitest testing framework with React Testing Library and create a basic test for the App component.

### Spec Coverage
Implements specifications: 12.1, 12.2

### Key Deliverables
1. Vitest and React Testing Library installed
2. Vitest configuration file created
3. Test script added to package.json
4. At least one passing test for App component

### Changes Required

#### 1. Install Testing Dependencies
**Command**:
```bash
npm install -D vitest @testing-library/react @testing-library/jest-dom @testing-library/user-event jsdom
```

#### 2. Vitest Configuration
**File**: `react-hello-world/vite.config.ts`

Update to include test configuration:
```typescript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: './src/test/setup.ts',
  },
})
```

#### 3. Test Setup File
**File**: `react-hello-world/src/test/setup.ts` (create new)

```typescript
import { expect, afterEach } from 'vitest';
import { cleanup } from '@testing-library/react';
import '@testing-library/jest-dom/vitest';

// Cleanup after each test
afterEach(() => {
  cleanup();
});
```

#### 4. App Component Test
**File**: `react-hello-world/src/App.test.tsx` (create new)

```tsx
import { describe, it, expect } from 'vitest';
import { render, screen } from '@testing-library/react';
import App from './App';

describe('App', () => {
  it('renders hello world heading', () => {
    render(<App />);
    const heading = screen.getByText(/Hello World, React \+ Vite 2026!/i);
    expect(heading).toBeInTheDocument();
  });

  it('renders subtitle text', () => {
    render(<App />);
    const subtitle = screen.getByText(/A minimal React application/i);
    expect(subtitle).toBeInTheDocument();
  });
});
```

#### 5. Add Test Script
**File**: `react-hello-world/package.json`

Add to scripts section:
```json
{
  "scripts": {
    "test": "vitest run",
    "test:watch": "vitest",
    "test:ui": "vitest --ui",
    "test:coverage": "vitest run --coverage"
  }
}
```

#### 6. Update TypeScript Config for Tests
**File**: `react-hello-world/tsconfig.json`

Ensure test files are included:
```json
{
  "compilerOptions": {
    "types": ["vitest/globals", "@testing-library/jest-dom"]
  },
  "include": ["src"]
}
```

### Success Criteria

#### Automated Verification:
- [ ] Test setup file exists: `test -f react-hello-world/src/test/setup.ts`
- [ ] Test file exists: `test -f react-hello-world/src/App.test.tsx`
- [ ] Vitest runs: `cd react-hello-world && npm run test`
- [ ] All tests pass: `cd react-hello-world && npm run test 2>&1 | grep -q "2 passed"`
- [ ] TypeScript compilation includes tests: `cd react-hello-world && npx tsc --noEmit`

#### Manual Verification:
- [ ] Run `npm run test:watch` and verify it enters watch mode
- [ ] Make a change to App.tsx and verify tests re-run automatically in watch mode
- [ ] Intentionally break a test and verify it fails with clear error message
- [ ] Fix the test and verify it passes again

**Implementation Note**: After completing this phase and all automated verification passes, pause here for manual confirmation that tests run and work correctly before proceeding to the next phase.

---

## Phase 5: Documentation and Production Readiness

### Overview
Add essential documentation and verify production build works correctly.

### Spec Coverage
Implements specifications: 15.1, 15.2, 15.3

### Key Deliverables
1. README.md with setup and usage instructions
2. Production build verified and tested
3. All npm scripts documented
4. Project ready for deployment or handoff

### Changes Required

#### 1. Create README
**File**: `react-hello-world/README.md` (create new)

```markdown
# React Hello World - Minimal 2026

A minimal "Hello World" React application built with modern best practices using Vite, React 19, and TypeScript.

## Features

- ⚡️ Vite for lightning-fast development
- ⚛️ React 19 with modern JSX transform
- 📘 TypeScript for type safety
- ✨ ESLint + Prettier for code quality
- 🧪 Vitest + React Testing Library for testing
- 🎨 Basic CSS styling (no frameworks)

## Prerequisites

- Node.js v20 or higher
- npm or yarn

## Getting Started

### Install Dependencies

\`\`\`bash
npm install
\`\`\`

### Development Server

\`\`\`bash
npm run dev
\`\`\`

Open [http://localhost:5173](http://localhost:5173) in your browser.

### Production Build

\`\`\`bash
npm run build
\`\`\`

Preview the production build:

\`\`\`bash
npm run preview
\`\`\`

## Available Scripts

- `npm run dev` - Start development server with HMR
- `npm run build` - Build for production
- `npm run preview` - Preview production build locally
- `npm run test` - Run tests once
- `npm run test:watch` - Run tests in watch mode
- `npm run lint` - Run ESLint
- `npm run lint:fix` - Fix ESLint errors automatically
- `npm run format` - Format code with Prettier

## Project Structure

\`\`\`
react-hello-world/
├── src/
│   ├── test/
│   │   └── setup.ts       # Vitest setup
│   ├── App.tsx            # Main App component
│   ├── App.css            # App styles
│   ├── App.test.tsx       # App tests
│   ├── main.tsx           # Entry point
│   ├── index.css          # Global styles
│   └── vite-env.d.ts      # Vite types
├── public/                # Static assets
├── dist/                  # Production build (generated)
├── .eslintrc.json         # ESLint config
├── .prettierrc.json       # Prettier config
├── tsconfig.json          # TypeScript config
├── vite.config.ts         # Vite config
└── package.json
\`\`\`

## Tech Stack

- **Build Tool**: Vite 5.x
- **Framework**: React 19.x
- **Language**: TypeScript 5.x
- **Testing**: Vitest + React Testing Library
- **Linting**: ESLint + Prettier
- **Styling**: Basic CSS (no frameworks)

## Learning Resources

- [Vite Documentation](https://vite.dev/)
- [React Documentation](https://react.dev/)
- [TypeScript Documentation](https://www.typescriptlang.org/)
- [Vitest Documentation](https://vitest.dev/)

## License

MIT
\`\`\`

#### 2. Verify Production Build
**Command sequence**:
```bash
cd react-hello-world
npm run build
npm run preview
```

**Expected**:
- Build completes without errors
- `dist/` directory created with optimized assets
- Preview server runs and app works identically to dev mode

### Success Criteria

#### Automated Verification:
- [ ] README exists: `test -f react-hello-world/README.md`
- [ ] Production build succeeds: `cd react-hello-world && npm run build`
- [ ] Build artifacts exist: `test -d react-hello-world/dist && test -f react-hello-world/dist/index.html`
- [ ] All tests pass: `cd react-hello-world && npm run test`
- [ ] Linting passes: `cd react-hello-world && npm run lint`
- [ ] TypeScript compiles: `cd react-hello-world && npx tsc --noEmit`

#### Manual Verification:
- [ ] Run `npm run preview` and verify production build displays correctly
- [ ] Verify all links in README are correct
- [ ] Verify all documented npm scripts work as described
- [ ] Test complete workflow: clone project → install → dev → test → build → preview

**Implementation Note**: After completing this phase and all automated verification passes, the project is complete and ready for deployment or handoff.

---

## Testing Strategy

### Unit Tests
- Test App component renders correct text content
- Verify component structure and accessibility

### Test Co-location
- Keep test files next to components: `App.test.tsx` alongside `App.tsx`
- Follow Vitest naming convention: `*.test.tsx`

### Manual Testing Steps
1. Start dev server and verify Hello World displays
2. Edit component and verify HMR updates instantly
3. Build for production and verify preview works
4. Run all npm scripts to ensure they work correctly

## Performance Considerations

- Vite provides optimal dev server performance with native ESM
- Production build uses Rollup for tree-shaking and optimization
- React 19's compiler handles automatic memoization
- No performance optimizations needed for minimal Hello World app

## References

- Research specification: `thoughts/shared/research/2026-01-21-react-hello-world-modern-setup.md`
- Vite documentation: https://vite.dev/guide/
- React 19 documentation: https://react.dev/blog/2024/12/05/react-19
- Vitest documentation: https://vitest.dev/
