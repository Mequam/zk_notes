---
id: 9v28d6ckpnt9v3vzja0kg4
title: git
desc: ''
updated: 1735940913
created: 1735940913
---
# git

## About

version control software, git is all about determining what
version of a file you are dealing with, and changing to and from
those versions, this file serves as a place for me to store
notes on git commands for fast lookup in the future

---

## Commands

### reflog

```bash
git reflog
```
this is like a series of bread crumbs where your HEAD has been, this is
different from git log as git log will show history of the commmit, the
ref log is the history of where HEAD has been, like a back button on
a website

this history is not part of the repo, it is not pushed or pulled on your local
machine, but it is useful for navigating back around to the last location you were at

I have more research to do here on the actions of the reflog when aimed at non HEAD branches,
but I THINK that it would behave similarly and show the history of commits that the branch has
pointed to locally

still doesn't beet my git tree in .zsh :p

### Merge

```bash
git merge <ref>
```
attempts to combine the given reference into the current HEAD

there are several different strategies that git merge <ref> can use, they key two non default
ones are

- ours
- theirs

where we specify in a merge conflict to take changes from that party

these are specified with

```bash
git merge -s <startegy> <ref>
```

### checkout

look at stuff

```bash
git checkout <ref>
```

can be used to create a new branch with

```bash
git checkout -b new_branch_name
```

### branch

```bash
git branch
```

lists and creates branches


the following shows remote branches

```bash
git branch -r
```


---

## Generating SSH Keys

for github access it is useful to generate ssh keys
see [ssh](ssh.md) for more information

