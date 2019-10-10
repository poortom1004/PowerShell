$group = "PROBRES\\MAINT - SERVER - PROD10W1"
$Collection = "MAINT - SERVER - PROD10W1"

function New-ADGroupQuery{
[cmdletbinding()]
param(
    [parameter(Mandatory = $true)]
    [string]$GroupName,
    [parameter(Mandatory = $true)]
    [string]$CollectionName
    )
$Query = @"
select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System where SMS_R_System.SystemGroupName = "$groupName"
"@
Add-CMDeviceCollectionQueryMembershiprule -CollectionName $CollectionName -RuleName "All devices that are a member of AD Group $($GroupName)" -QueryExpression $Query
}

New-ADGroupQuery -GroupName $group -CollectionName $Collection