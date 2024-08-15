# Makefile

.PHONY: all

# Default target
all: rename_branches

clean_all:
	git checkout main
	-git branch -D merge-1
	-git branch -D merge-2
	-git branch -D rebase-1
	-git branch -D rebase-2
	-git branch -D master
	-git push origin -d merge-1
	-git push origin -d merge-2
	-git push origin -d rebase-1
	-git push origin -d rebase-2
	-git push origin -d master



# Function to rename branches
rename_branches:
	@if [ -z "$(branch_name)" ]; then \
		echo "Error: branch_name is not set."; \
		echo "Usage: make branch_name=<target_branch_name>"; \
		exit 1; \
	fi
	git checkout main
	# Deleting existing branches if they exist
	-git branch -D $(branch_name)-1
	-git branch -D $(branch_name)-2
	# Creating new branches from b-1 and b-2
	git branch --copy b-1 $(branch_name)-1
	git branch --copy b-2 $(branch_name)-2

prepare_merge:
	make branch_name=merge

prepare_rebase:
	make branch_name=rebase
