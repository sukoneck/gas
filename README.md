# What is gas
A user-focused cli tool(s) that grabs the current Ethereum gas price. There is a strong bias towards one-liners and ezpz config; mostly for funsies. 

# How to gas
## macOS and the nixies
Create a bash profile function. 

1. Have jq (looking at you, mac) https://github.com/stedolan/jq

2. Edit your profile (I like nano):
    ```Shell
    nano ~/.bashrc
    ```

3. Slap this in before things start to export at the end:
    ```Shell
    function gas { echo $(($(echo $(echo $(($(curl https://cloudflare-eth.com -s -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":"'$RANDOM'"}' | jq ."result" -r)))))/1000000000)); }
    ```

4. Save and exit, then reload your profile
    ```Shell
    source ~/.bashrc
    ```

5. Now you can get the current gas price anytime by using `gas`

`NOTE: This has only been tested on Ubuntu. `

## Windows
Create an environment variable that calls a script.

1. Change this to the folder containing gas.ps1: 
    ```PowerShell
    $Path = "C:\path\to\folder"`
    ```

2. Run this as Administrator then reload terminal: 
    ```PowerShell
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $((Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path + ";" + $Path)
    ``` 

3. Now you can get the current gas price anytime by using `gas` or use `gassy` to get a constant drip of current price. 

`NOTE: This has only been tested on Win10. `

# More gas (todo)
Make `gas.sh` a hands-off config by, primarily, writing logic to insert the function before the exports at the end of the profile. Probably use something like `cat ~/.bashrc | grep "export"` or `sed -n '/export/=' ./.bashrc`. Then test/port to macOS. 