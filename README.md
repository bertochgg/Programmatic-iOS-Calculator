iOS internship

Branching strategy for internship

Inside your project, create a branch named like [ldap]/main, where [ldap] - your username in Grid Dynamics system. 

This will be your main branch with all your changes.

Before each new task, you must create a new branch from [ldap]/main and name it like [ldap]/[task_description].

After the task on which you worked is completed, you must create a Merge Request from the branch [ldap]/[task_description] to [ldap]/main.

Mentors review your changes.

When review is over and you have received approval from the mentor, you have to merge the branch [ldap]/[task_description] to [ldap]/main.

How to update your fork from upstream

First in your forked repo add this repository as an upstream (upstream is just an alias):

git remote add upstream https://gitlab.griddynamics.net/ios-internship/ios-calculator

Then on your main branch run:

git fetch upstream (get all updates from the upstream)
git rebase upstream/main
git push

Then you main branch will be up-to-date with upstream

To update a specific branch:

Checkout your branch
git fetch upstream
git rebase upstream/main or git merge upstream/main
git push

# iOS Calculator: First Milestone Project

# UI / UX Spec, Product specification, Behaviour and etc:

### https://apps.apple.com/ua/app/calculator/id1069511488

### Please, open project issues - to have a plan for app building and implementation process. 
