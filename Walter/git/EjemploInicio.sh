#!/bin/bash

git init
git config user.name "MarcosGar"
git config user.email "zanock@proton.me"

touch a1.txt
git add a1.txt
git commit -m "foto1"

touch a2.txt
git add a2.txt
git commit -m "foto2"

touch a3.txt
git add a3.txt
git commit -m "foto3"

touch a4.txt
git add a4.txt
git commit -m "foto4"

touch a5.txt
git add a5.txt
git commit -m "foto5"

touch a6.txt
git add a6.txt
git commit -m "foto6"

git log --oneline