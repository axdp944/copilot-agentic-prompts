# Mode Detection Test Execution Prompt

**Purpose**: This prompt instructs the AI to execute the mode detection test suite defined in `.github/tests/mode-detection-tests.md`.

**Usage**: Copy and send this entire prompt section to Copilot in a fresh session.

---

## PROMPT START

You are being asked to execute a test suite to verify that mode detection is working correctly.

### Context

This repository uses command modes that are triggered when a user message starts with a pattern like:
- `<command>` (e.g., `plan`, `research`, `implement`)
- `<command>: <parameters>` (e.g., `plan: file.md`)

When these patterns are detected, you should:
1. Check if `.github/commands/<command>.md` exists
2. Announce the mode (e.g., "**MODE: PLAN**")
3. Read the command file
4. Follow its procedures

The mode detection rules are defined in `.github/copilot-instructions.md` (lines 6-32).

### Your Task

Execute the test suite defined in `.github/tests/mode-detection-tests.md`:

1. **Read the test suite file completely**: `.github/tests/mode-detection-tests.md`
2. **Execute each test case** in Sections 1-8:
   - For each test input, **simulate what you would do** if you received that input
   - Be honest about whether you would detect the mode correctly
   - Explain your reasoning for each test
3. **Document results** in a summary table
4. **Identify any failures** and explain why they failed
5. **Provide recommendations** if any tests fail

### Output Format

Please provide your results in this format:

```markdown
## Mode Detection Test Results

**Test Date**: [current date]
**Sections Tested**: 1-8
**Total Tests**: [count]
**Passed**: [count]
**Failed**: [count]

### Summary by Section

#### Section 1: Valid Commands Without Arguments
- Test 1.1 (plan): [PASS/FAIL] - [brief explanation]
- Test 1.2 (research): [PASS/FAIL] - [brief explanation]
- Test 1.3 (implement): [PASS/FAIL] - [brief explanation]

[Continue for all sections...]

### Failed Tests Detail

[For each failed test, provide:]
- **Test ID**: [e.g., 2.1]
- **Input**: [the test input]
- **Expected**: [expected behavior]
- **Actual**: [what you would actually do]
- **Root Cause**: [why it failed]
- **Recommendation**: [how to fix]

### Regression Test Status

**Test 8.1** (Original Bug): [PASS/FAIL]
- Input: `plan: thoughts/shared/research/2026-01-21-react-hello-world.md`
- Status: [detailed explanation of whether this works now]

### Overall Assessment

[Provide overall assessment:]
- Are the mode detection instructions clear and unambiguous?
- Are there any edge cases not covered by the tests?
- Do you have any suggestions for improving mode detection?
- Are there any ambiguities in the instructions that could cause failures?

### Recommendations

[If any tests failed, provide specific recommendations for fixing the instructions]
```

### Important Notes

- **Be honest**: Don't say a test passes if you're not certain you would detect it correctly
- **Explain reasoning**: For each test, briefly explain how you would interpret the input
- **No actual execution**: You don't need to actually trigger the modes, just analyze what you would do
- **Self-awareness**: If you realize you would make a mistake, document it
- **Focus on Section 8**: The regression test (8.1) is critical - it must pass

### Additional Verification

After completing the test suite analysis, please also:

1. **Read** `.github/copilot-instructions.md` lines 6-32 (mode detection section)
2. **Assess** whether the instructions are clear enough to prevent failures
3. **Suggest improvements** if you find any ambiguities or potential failure points

---

## PROMPT END

**Note for maintainers**: This prompt is designed to be self-contained and can be executed in any fresh Copilot session without requiring context from previous conversations.
