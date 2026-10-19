#!/usr/bin/env bash
set -euo pipefail
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INFO_FILE="$PROJECT_ROOT/Nasimov_Temur_info.txt"
echo '=============================='
echo 'Student Information'
echo '=============================='
if [[ -f "$INFO_FILE" ]]; then
  cat "$INFO_FILE"
  echo 'Student information file exists.'
else
  echo 'Student information file does not exist.'
fi
echo '=============================='
echo 'System Information'
echo '=============================='
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -s)"
echo 'Disk Usage:'
df -h .
echo 'Memory Usage:'
if command -v free >/dev/null 2>&1; then free -h; else vm_stat 2>/dev/null || echo 'Memory utility unavailable'; fi
