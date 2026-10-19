# Video demonstration outline (10–20 minutes, own screen and own voice)

00:00–01:00: Introduce your full name, group, ID and course.
01:00–04:00: Show project tree and Linux commands, logs, permissions and bash script.
04:00–06:30: Show git log (5+ real commits), .gitignore, branches/merge and GitHub URL.
06:30–10:00: Show Dockerfile; docker build; compose up; browser /info and /health; logs; stop/start.
10:00–15:00: Show Jenkins job source GitHub, Jenkinsfile 5 stages, Console Output SUCCESS.
15:00–17:00: Explain Linux -> Git -> GitHub -> Jenkins -> Docker -> SUCCESS.

Explain: r=read, w=write, x=execute; chmod 600 means only owner read/write;
Docker image is a template, container is its running instance;
Git stores change history, GitHub hosts it, Jenkins automates steps.
When any Jenkins stage fails, later normal stages will not run and build fails.
