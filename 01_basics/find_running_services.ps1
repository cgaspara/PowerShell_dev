
# This script compares the group memberships of two users in Active Directory and outputs any groups that the first user is a member of but the second user is not.

 
#Import the Active Directory module to access AD cmdlets
Import-Module ActiveDirectory

#Define the users to compare
$User1 = "jack.sparrow"
$User2 = "john.doe"

#Define the domain controller to query
$DC = "ad1.corp.contoso.com"

#Get the groups for each user from the specified domain controller
$user1Groups = Get-ADUser $User1 -Server $DC-Properties MemberOf | Select-Object -ExpandProperty MemberOf      
$user2Groups = Get-ADUser $User2 -Server $DC -Properties MemberOf | Select-Object -ExpandProperty MemberOf

#Comparing the groups of both users
$missingGroups = Compare-Object -ReferenceObject $user1Groups -DifferenceObject $user2Groups -PassThru | Where-Object { $_.SideIndicator -eq '<=' } | Select-Object -ExpandProperty InputObject

$missingGroups | Out-File "C:\missing_groups.txt"