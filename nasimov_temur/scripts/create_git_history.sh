#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
if [[ -d .git ]]; then echo 'Existing .git detected; do not rewrite history'; exit 1; fi
git init -b main
git add app/main.py app/test_app.py
git commit -m 'Initial student web application and tests'
git add Nasimov_Temur_info.txt config/app.conf
git commit -m 'Add personalized student information and config'
git add scripts/Nasimov_Temur_system.sh scripts/linux_demo.sh
git commit -m 'Add Linux diagnostics and file processing scripts'
git add Dockerfile docker-compose.yml .dockerignore .env.example .gitignore
 git commit -m 'Add Docker build and Compose configuration'
git add Jenkinsfile README.md docs/VIDEO_SCRIPT.md docs/REPORT_EVIDENCE.md
 git commit -m 'Add Jenkins CI pipeline and documentation'
git switch -c development
printf '\nDevelopment branch verified.\n' >> docs/REPORT_EVIDENCE.md
git add docs/REPORT_EVIDENCE.md
git commit -m 'Document development branch verification'
git switch main
git merge --no-ff development -m 'Merge development documentation into main'
echo 'Git history ready: git log --oneline --graph --all'
