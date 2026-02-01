# Copilot Project Instructions

This is the repository level instructional context for copilot cli.

# ⚠️ CRITICAL - MANDATORY BOOTSTRAP SEQUENCE - READ THIS FIRST ⚠️

## YOU MUST STOP AND EXECUTE THESE STEPS BEFORE RESPONDING TO ANY USER REQUEST

**VIOLATION OF THESE INSTRUCTIONS WILL RESULT IN SYSTEM FAILURE**

This is NOT optional guidance. This is a REQUIRED initialization sequence that MUST execute before ANY other action.

# ⚠️ CRITICAL - MANDATORY BOOTSTRAP SEQUENCE - READ THIS FIRST ⚠️

## YOU MUST STOP AND EXECUTE THESE STEPS BEFORE RESPONDING TO ANY USER REQUEST

**VIOLATION OF THESE INSTRUCTIONS WILL RESULT IN SYSTEM FAILURE**

This is NOT optional guidance. This is a REQUIRED initialization sequence that MUST execute before ANY other action.

### MANDATORY STEP-BY-STEP BOOTSTRAP PROCESS:

**STEP 1 - HALT**: Do NOT respond to the user's request yet. Do NOT start any research, coding, or analysis.

**STEP 2 - CHECK ENVIRONMENT (MANDATORY)**: Execute PowerShell command to check for `COPILOT_INSTRUCTIONS` environment variable:
```powershell
[System.Environment]::GetEnvironmentVariable('COPILOT_INSTRUCTIONS', 'User')
```
- On Windows, you MUST use `[System.Environment]::GetEnvironmentVariable('COPILOT_INSTRUCTIONS', 'User')` to access user-level environment variables
- Note: `$env:COPILOT_INSTRUCTIONS` does NOT work reliably on Windows for newly set user variables
- This variable MUST be set and contain the path to your global base instructions directory
- **IF NOT SET**: STOP IMMEDIATELY and use ask_user tool to request assistance. DO NOT PROCEED.

**STEP 3 - VERIFY DIRECTORY (MANDATORY)**: The directory path from STEP 2 MUST exist:
- Check if the directory exists and is accessible
- **IF DIRECTORY DOES NOT EXIST**: STOP IMMEDIATELY and use ask_user tool to report the path and request assistance. DO NOT PROCEED.

**STEP 4 - LOAD BASE INSTRUCTIONS (MANDATORY)**: Load `copilot-instructions.md` from the directory:
- The file `copilot-instructions.md` MUST exist in the directory
- Read and load the entire file content
- **IF FILE DOES NOT EXIST**: STOP IMMEDIATELY and use ask_user tool to report the missing file and request assistance. DO NOT PROCEED.

**STEP 5 - LOAD AGENTS (OPTIONAL)**: If an `agents/` subdirectory exists:
- Load all files in `agents/` subdirectory
- These provide custom agent definitions
- If `agents/` doesn't exist, this is acceptable - proceed to STEP 6

**STEP 6 - CONFIRM LOADING (MANDATORY)**: Only after successfully loading base instructions:
- Report: "✅ Base instructions loaded from [path]. Ready to proceed."
- Show a brief summary of what was loaded (copilot-instructions.md + number of agents found)

**STEP 7 - PROCEED**: Only after STEP 6 confirmation, proceed with the user's actual request.

### FAILURE HANDLING - DO NOT PROCEED WITHOUT BASE INSTRUCTIONS:

**ANY FAILURE IN STEPS 2-4 MUST HALT ALL OPERATIONS:**
- Environment variable not set → use ask_user tool, explain the issue, wait for resolution
- Directory does not exist → use ask_user tool, show the path, wait for resolution
- copilot-instructions.md missing → use ask_user tool, show the directory, wait for resolution

**NEVER proceed with the user's request if base instructions cannot be loaded.**
**NEVER assume or use fallback behavior.**
**NEVER continue without explicit user guidance when bootstrap fails.**

### WHY THIS IS CRITICAL:

- Unlike ClaudeCode, Copilot CLI doesn't auto-load global context
- Without this bootstrap, you operate with incomplete instructions
- Custom agents and base context will be missing
- You will fail silently without required capabilities
- **The COPILOT_INSTRUCTIONS directory is the ONLY source of truth for base instructions**
- **This repository's .github/copilot-instructions.md is ONLY a bootstrap loader - not the actual instructions**

### FAILURE MODE EXAMPLE:

❌ WRONG: User says "research: react-router" → You immediately start research → Missing base context → FAILURE
✅ CORRECT: User says "research: react-router" → Check environment variable → Load base instructions → Verify loaded → Start research

## DO NOT SKIP THIS. THIS IS NOT A SUGGESTION. THIS IS A REQUIREMENT.

## IF YOU CANNOT LOAD BASE INSTRUCTIONS, YOU MUST NOT PROCEED UNDER ANY CIRCUMSTANCES.

 

