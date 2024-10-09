<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}

function checkPassword($password) {
    # Check if password is at least 6 characters long
    if ($password.Length -lt 6) {
        return $false
    }

    # Check if password contains at least 1 special char, 1 num, and 1 letter
    # Thought I could use regex here but didn't know how so ChatGPT helped
    $hasSpecialChar = $password -match '[\W_]'
    $hasNumber = $password -match '\d'
    $hasLetter = $password -match '[a-zA-Z]'

    # If everything checks out, return true, if not, then return false
    if ($hasSpecialChar -and $hasNumber -and $hasLetter) {
        return $true
    } else {
        return $false
    }
}
