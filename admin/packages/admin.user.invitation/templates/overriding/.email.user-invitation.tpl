Hello <{$invitation->INVITEE_NAME}>,

You have been invited by <{$inviter->FIRST_NAME}> <{$inviter->LAST_NAME}> (<{$inviter->EMAIL}>) to join <{$smarty.const.ORGANIZATION_NAME_SHORT}>.

To accept this invitation, please click on the link below:

<a href="<{$activation}>"><{$activation}></a>

Note: please sign up using the email address <{$invitation->INVITEE_EMAIL}> so that the invitation can take effect.

Thank you,
Support Team