#
# ██╗  ██╗ █████╗ ███████╗██╗  ██╗███╗   ███╗██╗███╗   ██╗███████╗██████╗ 
# ██║  ██║██╔══██╗██╔════╝██║  ██║████╗ ████║██║████╗  ██║██╔════╝██╔══██╗
# ███████║███████║███████╗███████║██╔████╔██║██║██╔██╗ ██║█████╗  ██████╔╝
# ██╔══██║██╔══██║╚════██║██╔══██║██║╚██╔╝██║██║██║╚██╗██║██╔══╝  ██╔══██╗
# ██║  ██║██║  ██║███████║██║  ██║██║ ╚═╝ ██║██║██║ ╚████║███████╗██║  ██║
# ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
#  v.0.1                                         +-++-+ +-++-++-++-++-++-+
#                                                |b||y| |R||e||m||c||o||d|
#                                                +-++-+ +-++-++-++-++-++-+
# Hashminer is a opensource powershell script that start or close your
# miner based on the Hashspeed of the blockexplorer of your favorite coin.
# 
#---------------------------------------------------------------------------------------------------
# HOW TO USE
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# It's simple
# 1. Save this script as a ps1 file in notepad or any similar program. 
#    For example: hashminer.ps1
# 2. Copy this file for best performance to the location of your 
#    miner.exe and start.bat file.   
# 3. Start the script with powershell.
# 4. Answer the questions.
# 5. It will then start or close automatically your miner based on the 
#    hashspeed of the blockexplorer.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#---------------------------------------------------------------------------------------------------
#
#---------------------------------------------------------------------------------------------------
# Questions
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
# Q: Which coins does Hashminer support?
# A: At the moment only ROI Coin and PWR Coin. But in theory it can 
#    run with any coin which has a blockexporer where you can see the
#    network hashspeed
#
# Q: I want to change a setting how do I do that?
# A: There are 3 options. Change the settings in de config.txt file,
#    delete the config file and make a new one or when asked to load the
#    config file answer 'n' and answer all the questions to make a new
#    config file with the correct settings.
#   
# For any other questions about Hashminer you can ask them on the
# discord channel ROIcoin https://discord.gg/hNdGky4 
# I will only answer questions about Hashminer for ROI Coin or PWR Coin. 
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
$Hashminerascii = "
██╗  ██╗ █████╗ ███████╗██╗  ██╗███╗   ███╗██╗███╗   ██╗███████╗██████╗ 
██║  ██║██╔══██╗██╔════╝██║  ██║████╗ ████║██║████╗  ██║██╔════╝██╔══██╗
███████║███████║███████╗███████║██╔████╔██║██║██╔██╗ ██║█████╗  ██████╔╝
██╔══██║██╔══██║╚════██║██╔══██║██║╚██╔╝██║██║██║╚██╗██║██╔══╝  ██╔══██╗
██║  ██║██║  ██║███████║██║  ██║██║ ╚═╝ ██║██║██║ ╚████║███████╗██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
 v.0.1                                         +-++-+ +-++-++-++-++-++-+
                                               |b||y| |R||e||m||c||o||d|
                                               +-++-+ +-++-++-++-++-++-+
"
#---------------------------------------------------------------------------------------------------
#FUNCTIONS
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# CHECK IF THERE IS A CONFIG FILE
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Get-configfilecheck{
    if (Test-Path ("config.txt"))
    {
    Clear-Host
    Write-Host $Hashminerascii
    Write-Host Config file found. Do you want to load the config? `(y/n`)
    Write-Host
        $ANSWERconfigfileload = Read-Host Answer
        if ($ANSWERconfigfileload -eq 'y') {
            $config = Get-Content config.txt
            foreach ($Data in $config)
            { 
            $workingdirectory, $blockexplorerget, $minenetworkhashget, $minerprocessnameget, $batnameget = $Data -split ','
            }
            $workingdirectory = $workingdirectory -replace ' ',''
            $blockexplorerget = $blockexplorerget -replace ' ',''
            $minenetworkhashget = $minenetworkhashget -replace ' ',''
            $minerprocessnameget = $minerprocessnameget -replace ' ',''
            $batnameget = $batnameget -replace ' ',''
            Clear-Host
            Write-Host $Hashminerascii
            Get-script
         }
    Clear-Host
    Write-Host $Hashminerascii 
    }
    Clear-Host
    Write-Host $Hashminerascii
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PROMPT FOR USER INPUT TO ENTER THE WORKING DIRECTORY
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Get-workingdirectory {
    $workingdirectory = Read-Host -Prompt "Enter the directory where the miner.exe and start miner.bat file are. `nExample: C:\miner"
    Clear-Host
    Write-Host $Hashminerascii                                          
    Write-Host You entered: $workingdirectory `nIs this correct? `(y/n`)
    Write-Host
    $ANSWERworkingdirectory = Read-Host Answer
    if ($ANSWERworkingdirectory -ne 'y') {
        $workingdirectory = $null
        Clear-Host
        Write-Host $Hashminerascii  
        Get-workingdirectory
    }
    cd "$workingdirectory"
    Clear-Host
    Return $workingdirectory
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PROMPT FOR USER INPUT TO ENTER THE BLOCKEXPLORER
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Get-blockexplorer {
    Write-Host $Hashminerascii 
    $blockexplorer = Read-Host -Prompt "Place from the blockexplorer to get current network hashspeed.`nIf nothing is specified then the next url is used: `nhttps://blockexplorer.pwr-coin.com/api/getnetworkhashps"
    if ([string]::IsNullOrWhiteSpace($blockexplorer))
    {
    $blockexplorer = "https://blockexplorer.pwr-coin.com/api/getnetworkhashps"
    }
    Clear-Host
    Write-Host $Hashminerascii                                          
    Write-Host You entered: $blockexplorer `nIs this correct? `(y/n`)
    Write-Host
    $ANSWERblockexplorer = Read-Host Answer
    if ($ANSWERblockexplorer -ne 'y') {
        $blockexplorer = $null
        Clear-Host
        Get-blockexplorer
    }
    Clear-Host
    Return $blockexplorer
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Test the url of the blockexplorer
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Get-blockexplorertest {
    Write-Host $Hashminerascii
    $response = Invoke-WebRequest -Uri $blockexplorerget
    $networkhash = $response.ParsedHtml.body | select -expand innerText
    $networkhash = $networkhash -replace "\.", ""
    $networkhash = [int]::Parse($networkhash)
    Write-Host The current hashspeed is: $networkhash                                          
    Write-Host Do you see the hashspeed? `(y/n`)
    Write-Host
    $ANSWERblockexplorertest = Read-Host Answer
    if ($ANSWERblockexplorertest -ne 'y') {
        $blockexplorer = $null
        Clear-Host
        Write-Host $Hashminerascii
        Write-Host The url of the blockexplorer is wrong. Do you want to change it? `(y/n`)
        Write-Host
        $ANSWERblockexplorertestchange = Read-Host Answer
            if($ANSWERblockexplorertestchange -ne 'y') {
                exit
            }
            else
            {
            $blockexplorer = $null
            Clear-Host
            Get-blockexplorer
            }
    }
    Clear-Host
    Return $blockexplorer
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PROMPT FOR USER INPUT TO ENTER MAX NETWORK HASH SPEED
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Get-minenetworkhash {
    $response = Invoke-WebRequest -Uri $blockexplorerget
    $networkhash = $response.ParsedHtml.body | select -expand innerText
    $networkhash = $networkhash -replace "\.", ""
    $networkhash = [int]::Parse($networkhash)
    Write-Host $Hashminerascii  
    $minenetworkhash = Read-Host -Prompt "The current hashspeed is: $networkhash `nInput your max networkhashspeed to start mining. "
    Clear-Host
    Write-Host $Hashminerascii  
    Write-Host You entered: $minenetworkhash `nIs this correct? `(y/n`)
    Write-Host
    $ANSWERminenetworkhash = Read-Host Answer
    if ($ANSWERminenetworkhash -ne 'y') {
        $minenetworkhash = $null
        Clear-Host
        Get-minenetworkhash
    }
    Clear-Host
    Return $minenetworkhash
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PROMPT FOR USER INPUT TO ENTER MINER PROCESS FILE NAME
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Get-minerprocessname {
    Write-Host $Hashminerascii  
    $minerprocessname = Read-Host -Prompt "Input your miner process file name. `nExample: hodlminer-avx"
    Clear-Host
    Write-Host $Hashminerascii  
    Write-Host You entered: $minerprocessname `nIs this correct? `(y/n`)
    Write-Host
    $ANSWERminerprocessname = Read-Host Answer
    if ($ANSWERminerprocessname -ne 'y') {
        $minerprocessname = $null
        Clear-Host
        Get-minerprocessname
    }
    Clear-Host
    Return $minerprocessname
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# PROMPT FOR USER INPUT TO ENTER BATFILE NAME
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Get-batname {
    Write-Host $Hashminerascii  
    $batname = Read-Host -Prompt "Input your batfile name to start the miner. `nExample: erc-start.bat"
    Clear-Host
    Write-Host $Hashminerascii  
    Write-Host You entered: $batname `nIs this correct? `(y/n`)
    Write-Host
    $ANSWERbatname = Read-Host Answer
    if ($ANSWERbatname -ne 'y') {
        $batname = $null
        Clear-Host
        Get-batname
    }
    Clear-Host
    Return $batname
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Test the given variables
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Get-minertest {
    Write-Host $Hashminerascii  
    start $batnameget
    Write-Host Did the miner start? `(y/n`)
    Write-Host
    $ANSWERminertest = Read-Host Answer
    if ($ANSWERminertest -ne 'y') {
        Clear-Host
        Write-Host $Hashminerascii 
        Write-Host Check settings
        Write-Host "Start bat file: $batnameget"
        Write-Host "If these settings are correct then there is probably an error in the `nstart bat file. Correct the error and start this program again."
        pause
        exit
    }
    Clear-Host
    Write-Host $Hashminerascii 
    $miner = Get-Process $minerprocessnameget -ErrorAction SilentlyContinue
    $miner | stop-process -Force
    Write-Host Did the miner stop? `(y/n`)
    Write-Host
    $ANSWERminerteststop = Read-Host Answer
        if ($ANSWERminerteststop -ne 'y') {
        Clear-Host
        Write-Host $Hashminerascii 
        Write-Host Check settings
        Write-Host "Miner process name: $minerprocessnameget"
        Write-Host "Check the name of the process when the miner is running. `nWhen you know the name restart this program again"
        pause
        exit
        }
    Clear-Host
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Make a config file
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Get-configfile {
    Clear-Host
    Write-Host $Hashminerascii  
    Write-Host Do you want to make a config file? `nSo next time you dont have to enter all this.`(y/n`)                                        
    Write-Host
    $ANSWERconfigfile = Read-Host Answer
    if ($ANSWERconfigfile -ne 'y') {
        Clear-Host
        Write-Host $Hashminerascii
        Get-script  
    }
    Set-Content -Path $workingdirectory\config.txt -Value "$workingdirectory, $blockexplorerget, $minenetworkhashget, $minerprocessnameget, $batnameget"
    Clear-Host
    Write-Host $Hashminerascii
    Get-script
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#THE SCRIPT, DO NOT CHANGE ANYTHING HERE
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Get-script {
while($($keeprunning -lt $stop)){
    $response = Invoke-WebRequest -Uri $blockexplorerget
    $networkhash = $response.ParsedHtml.body | select -expand innerText
    $networkhash = $networkhash -replace "\.", ""
    $networkhash = [int]::Parse($networkhash)
    $miner = Get-Process $minerprocessnameget -ErrorAction SilentlyContinue
    while($($networkhash -le $minenetworkhashget)){
     $miner = Get-Process $minerprocessnameget -ErrorAction SilentlyContinue
       if($miner){
          Write-Host "Miner runs. Current Networkhash is low enough" -ForegroundColor Green
          Write-Host "Current networkhash = $networkhash and max mining hash speed = $minenetworkhashget" -ForegroundColor Green
       }
       else{
          start $batnameget
       }
     Start-Sleep -Seconds (10)
     $response = Invoke-WebRequest -Uri $blockexplorerget
     $networkhash = $response.ParsedHtml.body | select -expand innerText
     $networkhash = $networkhash -replace "\.", ""
     $networkhash = [int]::Parse($networkhash)
     }
    if($miner){
      $miner | stop-process -Force
     }
    Write-Host "Miner not running. Current Networkhash is to high" -ForegroundColor Red
    Write-Host "Max mining hash speed = $minenetworkhashget and current networkhash = $networkhash" -ForegroundColor Red
    Start-Sleep -Seconds (10)
}
}
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Write-Host $Hashminerascii  
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
# GET USER INFO
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$configfilecheck = Get-configfilecheck
$workingdirectory = Get-workingdirectory
$blockexplorerget = Get-blockexplorer
$blockexplorertest = Get-blockexplorertest
$minenetworkhashget = Get-minenetworkhash
$minerprocessnameget = Get-minerprocessname
$batnameget = Get-batname
$minertest = Get-minertest
$configfile = Get-configfile
$script = Get-script
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
#CONVERT $minenetworkhashget FROM ARRAY TO INT
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$minenetworkhashget = [int]::Parse($minenetworkhashget)
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#SOME VARIABLES TO KEEP THE SCRIPT CHECKING AND RUNNING
$keeprunning = "0"
$stop = "1"
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Write-Host $Hashminerascii  
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#--------------------------------------------------------------------------------------------------- 
