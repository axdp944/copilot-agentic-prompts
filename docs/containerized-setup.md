# Containerized Setup Instructions

### docker-compose configuration:
open `docker-compose.yaml`

#### Mount .copilot to root home directory
- under `volumes` mount this project's `.copilot` directory to `/root/.copilot` 

**Example:**

**Windows**
- C:\Users\<Your User>\Desktop\workspace\agentic-prompts\.copilot:/root/.copilot

**OSX/Linux**
- /home/<your user>/workspace/agentic-prompts/.copilot:~/.copilot

### Mount target project directory to docker container volume

Mount your target projects directory to a volume on your container 

**Example:**

**Windows**
- C:\Users\<Your User>\Desktop\workspace\sample-react-app:/project-dir
-
**OSX/Linux**
- /home/<your user>/workspace/sample-react-app:/project-dir

---

### docker-compose build:

Run the following commands:

* `docker-compose build`
* `docker-compose up`

Shell into container:
* `docker-compose exec ai-env-cp bash`

