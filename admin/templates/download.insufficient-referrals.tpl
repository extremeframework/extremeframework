<{include file="header.tpl"}>
</head>
<body>

<{include file="headerbar.tpl"}>

<{module class="MenuModule" menucode="client-area" level=2 template="menu.paypal-style.tpl"}>

<div id="container">
<div id="main-body" class="main-content">

<h2>Restricted Download</h2>

<p>You need to have at least <{$required_referral_count}> referrals to unlock this download.</p>
<p>Your current referral count is <{$current_referral_count}></p>
<p>To increase the referral count, please copy and invite other people to the link below:</p>
<p><a href="<{$referral_link}>"><{$referral_link}></a></p>
<{share url="<{$referral_link}>"}>
<div style="clear:both"></div>

<div class="content-inner">

<{include file="footer.tpl"}>