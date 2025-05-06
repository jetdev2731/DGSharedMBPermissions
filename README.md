# JetToolbox2 - DGSharedMBPermissions

This PowerShell module automates the assignment of permissions between Distribution Groups and Shared Mailboxes. It's ideal for scenarios like marketing mailboxes that require tiered access:

- Read-only users
- Send As users
- Full Access users

## Features

- Assign permissions to Shared Mailboxes by DL
- Automatically grant `SendAs`, `ReadOnly`, or `FullAccess`
- Reusable for large-scale or recurring deployments

## Prerequisites

- Exchange Online PowerShell Module
- Admin privileges to set permissions

## Sample Usage

```powershell
# Variables
$Mailbox = "marketing@domain.com"
$ReadDL = "MarketingReadOnly"
$SendAsDL = "MarketingSendAs"
$FullAccessDL = "MarketingFullAccess"

# Grant Read-Only (via folder-level access)
Add-MailboxFolderPermission -Identity "$Mailbox:\Inbox" -User $ReadDL -AccessRights Reviewer

# Grant Send As
Add-RecipientPermission -Identity $Mailbox -Trustee $SendAsDL -AccessRights SendAs

# Grant Full Access
Add-MailboxPermission -Identity $Mailbox -User $FullAccessDL -AccessRights FullAccess -InheritanceType All
# DGSharedMBPermissions
Manage complex permissions by linking Distribution Groups to Shared Mailboxes. This module supports layered access like Send As, Full Access, and Read-Only—ideal for Marketing or Departmental mailboxes.
