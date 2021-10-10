# edit your profile (I like nano)
nano ~/.bashrc

# slap this in before things start to export at the end
function gas { echo $(($(echo $(echo $(($(curl https://cloudflare-eth.com -s -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":"'$RANDOM'"}' | jq ."result" -r)))))/1000000000)); }

# save and exit, then reload your profile
source ~/.bashrc
