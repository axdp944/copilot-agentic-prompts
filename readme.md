
# Copilot Agentic Prompts

A baseline development environment for performing high-level agentic engineering using Copilot CLI. 

This project is designed around the Research, Plan, Implement strategy popularized by  Dexter Horthy of Humanlayer. 

For more information, see [HumanLayer](https://www.humanlayer.dev/) or [Research, Plan, Implement Strategy](https://github.com/humanlayer/advanced-context-engineering-for-coding-agents/blob/main/ace-fca.md)

---
# Setup

There are two approaches to setup. Containerized setup is recommended for the most reliable and secure experience. 
Choose one and follow the instructions before proceeding:

- [Containerized Setup](docs/containerized-setup.md)
- [Local Setup](docs/local-setup.md)

## Copilot Login

* `cd /project-dir`
* `copilot --model claude-sonnet-4.5` (Copilot should load in the CLI)
* `/login` to login to copilot by copying the URL into a web browser, paste code and login.
* ~~On successfully login, verify that your `copilot-instruction.md` file loaded successfully from \~/.copilot~~
NOTE: global ~/.copilot resources no longer appear to be working as of copilot v0.0.400, despite this working in v0.0.388
![copilot-cli-instructions-loaded-successfully.png](docs/images/copilot-cli-instructions-loaded-successfully.png)


You are now ready to interact with copilot CLI.

## Example commands:
The following are instructions for the user agent wrangler.

**User of Model Claude Sonnet 4.5 is strongly recommended**

### Research:

Sample topics for research:
```text
research: How to create a simple React "hello world" UI using modern best practices and tooling in 2026?
```
```text
research: research: how to add a .env file to this nodejs project
```

### Plan:
Agent will place researched tasks in  `thoughts/shared/research`
```text
plan: path/to/research-file.md 
```
### Implement:
Agents will place plans+trackers in `thoughts/shared/plans`
```text
implement: path/to/plan-file.md 
```
---
# Acknowledgements

With sincere gratitude to my good friend [gradientsky](https://github.com/gradientsky) who opened my eyes to this next exciting chapter in software development. 