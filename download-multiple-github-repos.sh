# Replace "repo1" "repo2" "repo3" with the repos name you want to clone
# Replace the "/username/" for the username of the repos

for repo in repo1 repo2 repo3; do git clone https://github.com/username/$repo.git; done 