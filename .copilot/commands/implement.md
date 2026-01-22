---
command: implement
description: Implement technical plans from thoughts/shared/plans with verification
---

# Implement Plan

You are tasked with implementing an approved technical plan from `thoughts/shared/plans/`. These plans contain phases with specific changes and success criteria, accompanied by a tracker document for progress monitoring.

## Getting Started

When given a plan path:

1. **Read both the plan and tracker documents**:
  - Plan file: `thoughts/shared/plans/YYYY-MM-DD-description.md`
  - Tracker file: `thoughts/shared/plans/YYYY-MM-DD-description-tracker.md`
  - Check the tracker for existing progress (phase status, completed deliverables)

2. **Determine implementation type**:
  - **Type A (New Project)**: Plan creates a new project from scratch
    - Files mentioned don't exist yet
    - Skip reading non-existent files
    - Focus on scaffolding and creation commands
  - **Type B (Existing Codebase)**: Plan modifies existing code
    - Read all files mentioned in the plan FULLY (no limit/offset)
    - Understand current implementation before making changes
    - Consider how changes integrate with existing patterns

3. **Read referenced research documents** (if mentioned in plan):
  - Provides background context
  - The plan is authoritative if there's any ambiguity

4. **Review tracker progress**:
  - If phases are already complete, trust the work is done
  - Pick up from the first incomplete phase
  - Verify previous work only if something seems off

5. **Start implementing** if you understand what needs to be done

If no plan path provided, ask for one.

## Implementation Philosophy

Plans are carefully designed, but reality can be messy. Your job is to:
- Follow the plan's intent while adapting to what you find
- Implement each phase fully before moving to the next
- Verify your work makes sense in the broader codebase context
- Update tracker and plan documents as you complete work

When things don't match the plan exactly, think about why and communicate clearly. The plan is your guide, but your judgment matters too.

If you encounter a mismatch:
- STOP and think deeply about why the plan can't be followed
- Present the issue clearly:
  ```
  Issue in Phase [N]:
  Expected: [what the plan says]
  Found: [actual situation]
  Why this matters: [explanation]

  How should I proceed?
  ```

## Progress Tracking System

You maintain progress in TWO documents:

### Tracker Document (Primary Progress Record)
File: `thoughts/shared/plans/YYYY-MM-DD-description-tracker.md`

**Update after each deliverable:**
1. **Key Deliverables**: Mark checkbox as complete (⬜ → ✅)
2. **Phase Progress**: Update count (e.g., "1/4" → "2/4")
3. **Phase Status**: Update status when all deliverables done (⬜ → 🟡 → ✅)
4. **Last Updated**: Update date at top of tracker
5. **Implementation Notes**: Add any important findings or deviations

**Status indicators:**
- ⬜ Not Started
- 🟡 In Progress
- ✅ Complete
- ⏸️ Blocked

### Plan Document (Success Criteria Record)
File: `thoughts/shared/plans/YYYY-MM-DD-description.md`

**Update as you complete verification:**
1. **Automated Verification checkboxes**: Mark as complete when command succeeds
2. **Manual Verification checkboxes**: Mark as complete when human confirms (see below)
3. **Key Deliverables**: Keep as plain numbered lists (no checkboxes)

## Verification Approach

### During Implementation

After implementing each deliverable:
1. Update tracker: Mark deliverable complete, update progress count
2. Continue to next deliverable in the phase

### After Completing All Phase Deliverables

1. **Run all Automated Verification checks** listed in the plan:
  - Execute each command sequentially
  - Check off each successful verification in the plan file
  - If any check fails, fix the issue before proceeding
  - Build system commands vary by project (npm, make, cargo, go, etc.)

2. **Update tracker**:
  - Mark phase status as ✅ Complete
  - Update "Last Updated" date
  - Add any implementation notes

3. **Pause for Manual Verification**:
  - Present completion status to human
  - List manual verification steps from the plan
  - Wait for human confirmation before proceeding

**Pause Exception**: If instructed to execute multiple phases consecutively, skip the pause until the last phase. Otherwise, assume you are doing one phase at a time.

### Manual Verification Pause Format

After all automated verification passes, pause with this format:

```
Phase [N] Complete - Ready for Manual Verification

Automated verification passed:
- [List automated checks that passed]

Please perform the manual verification steps listed in the plan:
- [ ] [Manual verification item 1]
- [ ] [Manual verification item 2]
- [ ] [Manual verification item 3]

Let me know when manual testing is complete so I can proceed to Phase [N+1].
```

**Important**: Do NOT check off manual verification items in the plan until the human confirms completion.

### After Human Confirms Manual Verification

1. Check off manual verification items in the plan file
2. Proceed to the next phase (if any remain)

## If You Get Stuck

When something isn't working as expected:
- First, make sure you've read and understood all the relevant code
- Consider if the codebase has evolved since the plan was written
- Present the mismatch clearly and ask for guidance

Use sub-tasks sparingly - mainly for targeted debugging or exploring unfamiliar territory.

## Example Progress Flow

**Phase 1 with 3 deliverables:**

1. Implement deliverable 1 → Update tracker (1/3, 🟡 In Progress)
2. Implement deliverable 2 → Update tracker (2/3, 🟡 In Progress)
3. Implement deliverable 3 → Update tracker (3/3, 🟡 In Progress)
4. Run all automated verification → Check off items in plan
5. Update tracker (✅ Complete, add notes)
6. Pause for manual verification → Wait for human
7. Human confirms → Check off manual items in plan
8. Proceed to Phase 2

## Summary of What Gets Updated Where

| What | Where | When |
|------|-------|------|
| Key Deliverables checkboxes | Tracker | After each deliverable |
| Phase Progress count | Tracker | After each deliverable |
| Phase Status indicator | Tracker | When phase completes |
| Last Updated date | Tracker | When phase completes |
| Implementation Notes | Tracker | When notable findings occur |
| Automated Verification checkboxes | Plan | After running each check |
| Manual Verification checkboxes | Plan | After human confirms |

Remember: You're implementing a solution, not just checking boxes. Keep the end goal in mind and maintain forward momentum.
