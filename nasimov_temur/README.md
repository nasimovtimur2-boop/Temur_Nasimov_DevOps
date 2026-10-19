# DevOps Fundamentals — Nasimov Temur

**Lab:** Linux → Git → GitHub → Docker → Jenkins.  
**Course:** DevOps · **Group:** IT 2 2312 · **Student ID:** 31915.

## 0. Requirements
Linux (Ubuntu recommended), bash, git, Python 3, Docker Engine/Compose plugin, Jenkins with Pipeline/Git plugins and Docker CLI access, GitHub account. Docker Desktop is fine on macOS for local Docker work, but Linux process tools such as `free` differ. Execute Linux-related requirements in Ubuntu or a Linux VM.

## 1. Student Information and Setup
This package is personalized for **Temur Nasimov**, group **IT 2 2312**, student ID **31915** (inferred from the provided university email; verify before submitting), email **31915@iitu.edu.kz**.

```bash
cp .env.example .env
chmod +x scripts/*.sh
```
Never commit your real `.env` or secrets.

## 2. Linux tasks
```bash
bash scripts/linux_demo.sh
bash scripts/Nasimov_Temur_system.sh
find . -name application.log
grep ERROR logs/application.log
grep WARNING logs/application.log
grep -c ERROR logs/application.log
tail -n 5 logs/application.log
ls -l private.txt public.txt
ps aux | head
top   # press q to exit
```
`private.txt`: 600 (only owner read/write). `public.txt`: 644 (owner read/write, other users read). `r` read, `w` write, `x` execute. `ps` snapshot, `top` live view; PID is process ID.

## 3. Git and GitHub
Configure your own actual Git name/email **before** running the history script:
```bash
git config --global user.name "Temur Nasimov"
git config --global user.email "31915@iitu.edu.kz"
bash scripts/create_git_history.sh
git log --oneline --graph --all
git status
```
Script creates 6 meaningful commits and a real merged development branch. Run it only once in a fresh, uninitialized repository. If `.git` already exists, create commits manually instead.

Create **public** GitHub repository `nasimov-temur-devops` yourself, then:
```bash
git remote add origin https://github.com/YOUR_USERNAME/nasimov-temur-devops.git
git remote -v
git push -u origin main
```

## 4. Python app and Docker
```bash
cd app && python3 -m unittest discover -v && cd ..
docker build -t nasimov-temur-devops .
docker images
docker run -d --name nasimov-temur-demo -p 8080:8080 --env-file .env nasimov-temur-devops
docker ps
docker ps -a
docker logs nasimov-temur-demo
curl http://localhost:8080/health
curl http://localhost:8080/info
docker stop nasimov-temur-demo
docker start nasimov-temur-demo
docker rm -f nasimov-temur-demo
```
Compose alternative:
```bash
docker compose up -d --build
curl http://localhost:8080/info
docker compose logs
docker compose down
```
Do not run the standalone container and Compose on port 8080 at the same time.

**Docker image** is a built template; **container** is its runtime instance. Environment variables allow configuration without rebuilding. Do not bake secrets in images.

## 5. Jenkins
Create a Pipeline job **exactly** `Nasimov_Temur_DevOps`. Set Definition to **Pipeline script from SCM**; SCM Git; repository URL `https://github.com/YOUR_USERNAME/nasimov-temur-devops.git`; branch `*/main`; script path `Jenkinsfile`. The Jenkins executor must have Python 3 and a usable Docker CLI/daemon; its service account must be allowed to run Docker (security-sensitive permission; configure it deliberately). **Do not assume this works automatically in a containerized Jenkins installation.**

Run `Build Now`, then check Console Output and stages Checkout → Build → Test → Docker Build → Docker Run. Expected `Finished: SUCCESS` only after actually running successfully. Jenkins launches a separately named container `nasimov-temur-jenkins` without a host port, so it can coexist with Compose. If rerunning, the pipeline replaces only its Jenkins container.

## 6. Submission
1. GitHub link.
2. PDF report (starter template provided separately; add authentic screenshots).
3. One continuous 10–20 minute video with your screen and own voice; use `docs/VIDEO_SCRIPT.md`.

**Note:** Files are prepared, but Git history, GitHub pushes, Jenkins builds, screenshots and recording are not done until you run them yourself.
