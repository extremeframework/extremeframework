<?php $root_url = Installer::get_root_url(); ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta name="viewport" content="width=device-width" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Setup Configuration File</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300italic&subset=latin,vietnamese" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" media="all" href="<?php echo $root_url; ?>/lib/bootstrap/css/bootstrap.css?v=3.2.0" />
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo $root_url; ?>/css/apps4clouds.css" />
    <link rel="stylesheet" type="text/css" media="all" href="<?php echo $root_url; ?>/css/personalized.css" />
    <script type="text/javascript" src="<?php echo $root_url; ?>/js/jquery.min.js?v=1.11.1"></script>
    <script type="text/javascript" src="<?php echo $root_url; ?>/lib/bootstrap/js/bootstrap.min.js?v=3.2.0"></script>
</head>
<body>

<style>
body {
    background-color: #226F7C;
    font-size: 15px;
}

button {
    padding: 5px 10px 5px 10px;
    background: rgb(75, 168, 83);
    color: #fff!important;
    border: 1px solid rgb(233, 233, 233);
}

button:hover {
    background: #16781e;
}

.header {
    padding: 5px;
    font-size: 26px;
    color: white;
    margin-bottom: 10px;
}

.footer {
    margin-top: 20px;
}

.footer p {
    padding: 5px;
    color: white;
    text-align: center;
}

.install {
    margin: auto;
}

.form {
    background-color: white;
    width: 410px;
    float: left;
}

.install-guide {
    margin: 20px 10px 10px 10px;
    text-align: left;
    line-height: 20px;
}

.install-header {
    margin: 0px 10px 10px 10px;
    padding-top: 10px;
}

.install-header h3 {
    padding: 0px;
    margin: 0px;
}

.install-steps {
    width: 200px;
    float: left;
    background-color: white;
    margin-right: 20px;
}

@media (max-width: 480px) {
    .install-steps {
        display: none;
    }
    .form {
        width: 100%;
    }
    .table>tbody>tr>td {
        float: left;
        width:100%!important;
        padding: 0px;
    }
    .table tr td:nth-child(2) {
        margin-bottom: 10px;
    }
}

.install-steps ul {
    list-style: none;
    margin: 0px;
    padding: 5px 10px;
}

.install-steps li {
    line-height: 28px;
}

.install-steps li.current {
    font-weight: bold;
}

.install-message {
    margin: 10px 10px;
    color: orange;
}

.install-content {
    padding: 0 10px 0px 10px;
    min-height: 300px;
}

.install-content p {
    text-align: left;
}

.install-footer {
    margin: 10px 0 0;
    background-color: #E5E5E5;
    padding: 5px;
    border-top: 1px solid rgb(214, 214, 214);
}

.btn-next {

}

.table td {
    border: none!important;
}

.install-content input {
    height: 24px;
    padding: 3px;
    width: 200px;
}

.c {
    padding: 5px;
    background-color: rgb(75, 168, 83);
    color: white;
}

.m {
    font-weight: bold;
}

.missing {
    color: red;
}
</style>

<div class="container">

    <div class="header">
        <?php _e('System Installation'); ?>
    </div>

    <div class="install">
        <div class="install-steps">
            <ul>
                <li <?php echo $step == '' || $step == 0? 'class="current"' : ''; ?>><?php _e('Language'); ?></li>
                <li <?php echo $step == 1? 'class="current"' : ''; ?>><?php _e('Welcome'); ?></li>
                <li <?php echo $step == 2? 'class="current"' : ''; ?>><?php _e('System'); ?></li>
                <li <?php echo $step == 3? 'class="current"' : ''; ?>><?php _e('Database Settings'); ?></li>
                <li <?php echo $step == 4? 'class="current"' : ''; ?>><?php _e('Database Installation'); ?></li>
                <?php if (ENFORCE_LICENSE_CHECK) : ?>
                    <li <?php echo $step == 5? 'class="current"' : ''; ?>><?php _e('License'); ?></li>
                <?php endif; ?>
                <li <?php echo $step == 6? 'class="current"' : ''; ?>><?php _e('User'); ?></li>
                <li <?php echo $step == 7? 'class="current"' : ''; ?>><?php _e('Configuration'); ?></li>
                <li <?php echo $step == 8? 'class="current"' : ''; ?>><?php _e('Completed'); ?></li>
            </ul>
            <div style="clear:both"></div>
        </div>
