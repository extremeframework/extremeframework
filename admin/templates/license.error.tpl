<{include file="header.tpl"}>

</head>
<body class="module">

<{include file="top.tpl"}>

<style>
#main-body h1.heading {
    margin: 10px 20px 0 10px;
}
.message {
    margin: 0px 10px 10px 11px;
}
.form-row {
    vertical-align: top;
}
.license button,
.license input {
    color: black;
    margin-bottom: 5px;
}
.license a {
    color: orange;
}
.license .online {
    margin-top: 15px;
    padding: 10px;
    border: 1px solid black;
    margin-bottom: 20px;
}
.license .online .m {
    background-color: white;
    color: black;
    padding: 5px;
}
</style>

<div class="license">
    <h1 class="heading"><span class="h">License Notice</span></h1>

    <{if $message}>
        <div class="message"><{$message}></div>
    <{/if}>

    <div class="section">
        <p>To activate the software please enter a license key to the box below and activate it.</p>

        <form id="licenseform" action="<{$smarty.const.APPLICATION_URL}>/license/notice" method="post">
            <table>
                <tbody>
                    <tr>
                		<td class="form-row">
                            <div class="form-field form-field-label">
                    		    <label>License key</label>
                            </div>
                        </td>
                        <td class="form-row">
                            <div  class="form-field form-field-value">
                                <input type="text" name="license_key" value="<{$license_key}>" size="32"/>
                                <button type="submit">Activate</button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>

        <div class="online">
            <p><strong>Online license creation</strong></p>
            <p>If you do not own a key you can create a key online <a href="<{$smarty.const.LICENSE_ONLINE_CREATION_URL}>" target="blank">here</a></p>
            <p>When you are asked to enter a machine code, please use the code:  <span class="m"><{$machine_code}></span></p>
        </div>
    </div>
</div>

<{include file="footer.tpl"}>