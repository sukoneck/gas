# what is gas
Create a function in your bash profile that grabs the current Ethereum gas price. 

# how is gas
- Have jq (looking at you, mac) https://github.com/stedolan/jq
- Follow the steps in `instructions.sh` to configure
- Now you can get the current gas price anytime by using `gas`

# more gas (todo)
Make `instructions.sh` a hands-off config by, primarily, writing logic to insert the function before the exports at the end of the profile. Probably use something like `cat ~/.bashrc | grep "export"` or `sed -n '/export/=' ./.bashrc`. Then test/port to osx. 
