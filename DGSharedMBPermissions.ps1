
<#
.SYNOPSIS
Assigns layered permissions to a Shared Mailbox using Distribution Groups.

.DESCRIPTION
This script assigns Read-Only, Send As, and Full Access rights to a shared mailbox using three separate distribution groups.

.EXAMPLE
.\DGSharedMBPermissions.ps1
#>

# Define mailbox and DLs
$Mailbox     = "marketing@domain.com"
$ReadDL      = "MarketingReadOnly"
$SendAsDL    = "MarketingSendAs"
$FullAccessDL = "MarketingFullAccess"

# Grant Read-Only access (Inbox folder only)
Add-MailboxFolderPermission -Identity "$Mailbox:\Inbox" -User $ReadDL -AccessRights Reviewer

# Grant Send As permission
Add-RecipientPermission -Identity $Mailbox -Trustee $SendAsDL -AccessRights SendAs -Confirm:$false

# Grant Full Access permission
Add-MailboxPermission -Identity $Mailbox -User $FullAccessDL -AccessRights FullAccess -InheritanceType All -AutoMapping $false
