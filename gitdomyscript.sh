#!/bin/bash
read -p "Insert ssh git source: " ans_git &&
git clone "$ans_git" &&
folder_git=$(echo "$ans_git" | grep -Po "(?<=/)[\w\-]*(?=(\.git$))") && 
cd $folder_git && 
python3.9 -m venv env && 
source env/bin/activate && 
pip install -U pip && 
pip install -r requirements.txt  --use-pep517&&
exit 0
