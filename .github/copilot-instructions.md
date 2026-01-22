# Copilot Project Instructions

All paths below are **relative to the repository root**.
Command definitions live in `.github/commands/` and should be treated as authoritative mode-specific guides.

## Modes and Command Phrases
** CRITICAL: MODE DETECTION REQUIRED  ** 

### Pattern Recognition
**IMMEDIATELY** when receiving a user message, check if it starts with one of these patterns:
- `<word>` (command with no arguments)
- `<word>: <parameters>` (command with arguments)

Examples of valid mode triggers:
- `research` → Check for `.github/commands/research.md`
- `research: authentication flow` → Check for `.github/commands/research.md`
- `plan` → Check for `.github/commands/plan.md`
- `plan: path/to/file.md` → Check for `.github/commands/plan.md`
- `implement` → Check for `.github/commands/implement.md`
- `implement: path/to/plan.md` → Check for `.github/commands/implement.md`

### Mode Detection Process
1. **FIRST**: Check if user message starts with a single word (with or without `: <args>`)
2. **SECOND**: Extract the command word (everything before the colon, or the entire message if no colon)
3. **THIRD**: Check if `.github/commands/<word>.md` exists
4. **IF FOUND**: Execute the "match found" procedure below
5. **IF NOT FOUND**: Treat as normal message (not a command)

### When a Match is Found
You MUST:
1. **STOP** and recognize this as a mode trigger
2. **ANNOUNCE** to the user: "**MODE: [UPPERCASE_COMMAND]** - I'm executing your request within the [command] mode as specified in `.github/commands/[command].md`."
3. **READ** the corresponding command file from `.github/commands/` end-to-end
4. **FOLLOW** that command file's procedure exactly, including all restrictions on argument handling
5. **DO NOT** proceed with general implementation or make assumptions

### If a Match is NOT Found
- Treat the message as a normal request (not a command mode)
- Proceed with general assistance

# Copilot Agent Usage 
### AGENT ANNOUNCEMENT (REQUIRED)
**MANDATORY**: When copilot is using an agent it must announce to the user the name of the agent that was invoked.

```
    AGENT NAME: <name of agent>
    DESCRIPTION OF WORK: <desription of workflow the agent is delegating to the subagent>
```

# Creation and Revision of Prompts, Commands, Actions and Instructions
                                                             
- Prompts: a request to the agent to perform some action
- Instructions: Instructions on how to use a particular tool or perform some action. 
- Commands: a special action that puts the agent into a particular mode of operation.
- Tools: scripts and other information used to support prompts and commands. 
These commands define specific behaviors and limitations of behavior for the agent.  

When revision of Prompts, Commands, Instructions and Agents, keep the following suggestions in mind:

- Keep documentation organized.
- For larger or more complex instructions on a single topic, first check to see if this topic large has a markdown file associated to it and add it there.
If no markdown file is created for this subject, then create the markdown file and place it in the relevant directory (commands, instructions, tools, agents, etc)
- ./.github/copilot-instructions should be mostly an outline referring to other documents for more information. Keep this file neat, concise and well organized.  
- Keep all markdowns narrow to a particular topic and as concise as possible.
- Avoid explicitly describing steps in a specific order, such as 1-9 if those are all the steps included. Instead, state to proceed through steps in numerical order which is
less prone to errors when prompts are further refactored in the future. 

### When Things Go Wrong
1. ***Acknowledge the issue immediately***: "I'm having trouble with X, let me try Y instead"
2. ***Don't retry the same failed approach***: Change strategy after 2 retries
3. ***Ask for help***: If uncertain about file state or approach, ask the user before proceeding

### Red Flags to Avoid
- Making >5 edit calls to the same file
- Repeating the same failed edit with minor variations
- Not checking results between operations
- Using tiny `old_str` matches that could appear multiple places
- Assuming previous edits succeeded without verification


