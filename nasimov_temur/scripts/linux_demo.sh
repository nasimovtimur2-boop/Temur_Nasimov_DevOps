#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
echo '-- pwd / ls / cd --'; pwd; ls -la; cd app; pwd; cd ..
echo '-- mkdir / touch / cp / mv / rm --'
mkdir -p backup/demo
 touch backup/demo/example.txt
cp backup/demo/example.txt backup/demo/copied.txt
mv backup/demo/copied.txt backup/demo/renamed.txt
rm backup/demo/renamed.txt
echo '-- cat / head / tail --'
cat Nasimov_Temur_info.txt
head -n 2 logs/application.log
tail -n 5 logs/application.log
echo '-- find / grep / counts --'
find . -name application.log
grep 'ERROR' logs/application.log
grep 'WARNING' logs/application.log
grep -c 'ERROR' logs/application.log
echo '-- chmod / ls -l --'
printf 'private\n' > private.txt
printf 'public\n' > public.txt
chmod 600 private.txt
chmod 644 public.txt
ls -l private.txt public.txt
echo '-- process management --'
ps -ef | head -n 5
printf '\nRun top manually: top (press q to exit)\n'
