# Local Setup Instructions

Follow these instructions if you do not plan on running copilot cli in a Docker container.

1. Create an environment variable named `COPILOT_INSTRUCTIONS` with a directory location pointing to the base directory of this project.
   * Example: /home/johndoe/workspace/copilot-agentic-prompts 
2. Under your target directory will you plan to run `copilot`:
    * Copy the file named [copilot-instructions.md](../copilot-instructions.md) to the `.github` directory within the base directory where you will be running copilot cli. 
    * Open terminal session and run `copilot`