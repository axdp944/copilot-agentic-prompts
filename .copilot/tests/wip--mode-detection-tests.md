# Mode Detection Test Suite

**Purpose**: Verify that Copilot correctly detects command mode triggers according to `.github/copilot-instructions.md`.

**Last Updated**: 2026-01-21

## How to Execute Tests

1. Start a new Copilot conversation (to avoid context contamination)
2. For each test case, send the exact input shown
3. Observe the response and check the expected behavior
4. Mark ✅ (pass) or ❌ (fail) in the Result column
5. Document any deviations in the Notes column

## Test Results Tracking

**Test Run Date**: ___________  
**Tester**: ___________  
**Copilot Version**: ___________

---

## Section 1: Valid Commands Without Arguments

These should trigger mode detection and read the corresponding command file.

| # | Input | Expected Behavior | Result | Notes |
|---|-------|-------------------|--------|-------|
| 1.1 | `plan` | ✓ Announce "**MODE: PLAN**"<br>✓ Read `.github/commands/plan.md`<br>✓ Follow plan.md procedure | ☐ | |
| 1.2 | `research` | ✓ Announce "**MODE: RESEARCH**"<br>✓ Read `.github/commands/research.md`<br>✓ Follow research.md procedure | ☐ | |
| 1.3 | `implement` | ✓ Announce "**MODE: IMPLEMENT**"<br>✓ Read `.github/commands/implement.md`<br>✓ Follow implement.md procedure | ☐ | |

---

## Section 2: Valid Commands With Arguments

These should trigger mode detection and pass arguments to the command procedure.

| # | Input | Expected Behavior | Result | Notes |
|---|-------|-------------------|--------|-------|
| 2.1 | `plan: thoughts/shared/research/2026-01-21-react-hello-world.md` | ✓ Announce "**MODE: PLAN**"<br>✓ Read plan.md<br>✓ Recognize file path as parameter<br>✓ Read the parameter file according to plan.md | ☐ | |
| 2.2 | `research: React authentication patterns` | ✓ Announce "**MODE: RESEARCH**"<br>✓ Read research.md<br>✓ Process "React authentication patterns" as topic | ☐ | |
| 2.3 | `implement: thoughts/shared/plans/some-plan.md` | ✓ Announce "**MODE: IMPLEMENT**"<br>✓ Read implement.md<br>✓ Process plan file path as parameter | ☐ | |
| 2.4 | `plan: path/with spaces/file.md` | ✓ Detect mode correctly<br>✓ Handle path with spaces | ☐ | |
| 2.5 | `research: multi word topic with no file` | ✓ Detect mode correctly<br>✓ Handle multi-word parameter | ☐ | |

---

## Section 3: Edge Cases - Spacing and Formatting

| # | Input | Expected Behavior | Result | Notes |
|---|-------|-------------------|--------|-------|
| 3.1 | `plan:no-space-after-colon.md` | ✓ Should still detect plan mode<br>✓ Parameter is "no-space-after-colon.md" | ☐ | |
| 3.2 | `plan:    extra-spaces.md` | ✓ Should detect plan mode<br>✓ Should handle extra spaces | ☐ | |
| 3.3 | `  plan: file.md` (leading spaces) | ✗ Should NOT detect mode<br>✓ Treat as normal request | ☐ | |
| 3.4 | `plan : file.md` (space before colon) | ✗ Should NOT detect mode (not single word)<br>✓ Treat as normal request | ☐ | |

---

## Section 4: Invalid Commands

These should NOT trigger mode detection because no matching command file exists.

| # | Input | Expected Behavior | Result | Notes |
|---|-------|-------------------|--------|-------|
| 4.1 | `invalidmode: something` | ✗ No mode announcement<br>✓ Treat as normal request | ☐ | |
| 4.2 | `execute: do something` | ✗ No mode announcement (no execute.md)<br>✓ Treat as normal request | ☐ | |
| 4.3 | `test: run tests` | ✗ No mode announcement (no test.md)<br>✓ Treat as normal request | ☐ | |

---

## Section 5: Case Sensitivity

| # | Input | Expected Behavior | Result | Notes |
|---|-------|-------------------|--------|-------|
| 5.1 | `Plan: file.md` (capitalized) | Behavior depends on file system:<br>- If `.github/commands/Plan.md` exists: detect<br>- If only `plan.md` exists: depends on OS | ☐ | |
| 5.2 | `PLAN: file.md` (all caps) | Same as above | ☐ | |
| 5.3 | `pLaN: file.md` (mixed case) | Same as above | ☐ | |

**Note**: Case sensitivity depends on whether the file system is case-sensitive (Linux) or case-insensitive (macOS/Windows).

---

## Section 6: Multi-line and Complex Inputs

| # | Input | Expected Behavior | Result | Notes |
|---|-------|-------------------|--------|-------|
| 6.1 | `plan: file.md`<br>(with text on next line) | ✓ Detect plan mode<br>✓ Parameter is "file.md"<br>✓ Additional text processed per plan.md | ☐ | |
| 6.2 | `Please plan: this for me` | ✗ Should NOT detect mode (doesn't start with command)<br>✓ Treat as normal request | ☐ | |
| 6.3 | `plan something without colon` | ✓ Detect plan mode<br>✓ "something without colon" NOT treated as parameter (no colon)<br>✓ Command file determines how to handle | ☐ | |

---

## Section 7: Special Characters in Parameters

| # | Input | Expected Behavior | Result | Notes |
|---|-------|-------------------|--------|-------|
| 7.1 | `plan: file-with-dashes.md` | ✓ Detect plan mode<br>✓ Handle dashes in filename | ☐ | |
| 7.2 | `research: topic with "quotes"` | ✓ Detect research mode<br>✓ Handle quotes in parameter | ☐ | |
| 7.3 | `plan: path/to/file (with parens).md` | ✓ Detect plan mode<br>✓ Handle parentheses | ☐ | |

---

## Section 8: Regression Tests (Known Past Failures)

| # | Input | Expected Behavior | Result | Notes |
|---|-------|-------------------|--------|-------|
| 8.1 | `plan: thoughts/shared/research/2026-01-21-react-hello-world.md` | ✓ Detect plan mode (THIS WAS THE ORIGINAL FAILURE)<br>✓ Read plan.md<br>✓ Read the research file as parameter | ☐ | Original bug from 2026-01-21 |

---

## Test Execution Notes

### Common Failure Patterns to Watch For

1. **Silent failure**: Copilot proceeds without announcing mode
2. **Parameter confusion**: Copilot detects mode but doesn't read parameter file
3. **Premature action**: Copilot takes action before reading command file
4. **Wrong mode**: Copilot announces wrong mode name

### What to Document

- Exact response from Copilot
- Whether it announced the mode correctly
- Whether it read the command file
- Whether it followed the command procedure
- Any unexpected behavior

### Success Criteria for Full Suite

- All Section 1 tests (valid commands) MUST pass
- All Section 2 tests (commands with args) MUST pass
- At least 80% of edge case tests should behave as expected
- Section 8 (regression test) MUST pass

---

## Changelog

- **2026-01-21**: Initial test suite creation after mode detection failure
  - Added regression test for `plan: <file>` pattern
  - Covered edge cases around spacing and formatting
  - Added special character handling tests
