



## Modes and Command Phrases
** CRITICAL: MODE DETECTION REQUIRED  ** 

When a user message starts with a single word followed by a colon such as `research:`, match value with the value of `command` in markdown files under .github/commands
When a match is found, you MUST:
1. **STOP** and recognize this as a mode trigger
2. **READ** the corresponding command file from `.github/commands`
3. **FOLLOW** that commands file's procedure exactly, including all restrictions.
4. **ANNOUNCE** to the user that you are executing the request within the mode specified.  
5. **DO NOT** proceed with general implementation or make assumptions.

If a match is NOT found, you MUST:
1. **ANNOUNCE** and you were unable to find the corresponding command.
2. **STOP** do not proceed any further.   

# Sub Agent Usage
    
### SUB AGENT ANNOUNCEMENT (REQUIRED)
When you are using sub-agents you must announce to the user the subagent you have invoked.

```
    SUB AGENT: <name of subagent>
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





