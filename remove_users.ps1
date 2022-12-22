# This script will help with automating the removal of groups on Active Directory

$User = Read-Host -Prompt ("Select the user you are wanting to remove from an AD group")
$ADGroup = Read-Host -Prompt ("Select the AD group you want to remove them from")
Write-Host "The account you've selected is:" $user -ForegroundColor Green
Write-Host "The group you've selected is:" $ADGroup -ForegroundColor Green


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

