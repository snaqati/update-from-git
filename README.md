
![Logo](https://infoblox.b-cdn.net/wp-content/uploads/infoblox-logo-new.svg)


# Update From Git

An automated script to pull latest git data and copy it to a given destination


## Author

- [Shukran Naqati](https://www.github.com/snaqati)


## Usage

- To run the script use the following command from the script path ./updateFromGit.sh
- To pass the script inputs in cli use one of the below commands. For source you can use -s/--source, for destination -d/--destination, and for remove -r/--remove
  - ./updateFromGit.sh --source=/home/infoblox/Desktop/ClonedGitFolder/ --destination=/var/www/html --remove=no
  - ./updateFromGit.sh -s=/home/infoblox/Desktop/ClonedGitFolder/ -d=/var/www/html -r=yes
- If you run the script without passing any cli arguments or partial cli arguments it will ask you for the same during runtime. You can use tab to autocomplete the paths during runtime.
- On entering the required details, you will see a confirmation message with the details entered. If they are valid you can enter yes/y to proceed.
- On confirming the inputs the desired action is taken.




