# This script can be used to remove users from an AD group & add them to a new one

$User = Read-Host -Prompt ("Select the user you are wanting to remove from an AD group")
$ADGroup = Read-Host -Prompt ("Select the AD group you want to remove them from")
$NewADGroup = Read-Host -Prompt ("Select the new AD group you want the user to be added to")
Write-Host "The account you've selected is:" $user -ForegroundColor Green
Write-Host "The group you've selected is:" $ADGroup -ForegroundColor Green
Write-Host "The group you've selected is:" $NewADGroup -ForegroundColor Green


if ($User) {
    Get-ADUser -Identity $User
} else {
    Write-Warning -Message "This account does not exist or has been deleted"
}

if ($ADGroup) {
    Remove-ADGroupMember -Identity $ADGroup -Members $User
} else {
    Write-Warning -Message "This account does not exist or has been deleted"
}

if ($NewADGroup) {
    Add-ADGroupMember -Identity $NewADGroup -Members $User
}