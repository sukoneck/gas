function gas { echo $(($(echo $(echo $(($(curl https://cloudflare-eth.com -s -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":"'$RANDOM'"}' | jq ."result" -r)))))/1000000000)); }