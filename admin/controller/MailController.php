<?php
/**
 * Copyright (c) 2011-2015 VIETMAI Solutions Corporation
 *
 * Released under the MIT license (http://opensource.org/licenses/MIT)
 */
//require_once("PHPMailer/PHPMailerAutoload.php");
require_once 'SwiftMailer/lib/swift_required.php';

global $GLOBAL_MailController_Debug;
$GLOBAL_MailController_Debug = false;

class MailController
{
//    function mail($to, $subject, $body, $headers = '') {
//        if (MAILER_USE_SMTP) {
//            $mail = new PHPMailer();
//
//            $mail->IsSMTP();
//            $mail->Host = MAILER_SMTP_HOST;
//            $mail->Port = MAILER_SMTP_PORT;
//            $mail->SMTPAuth = true;
//            $mail->SMTPSecure = "ssl";
//            $mail->Username = MAILER_SMTP_USERNAME;
//            $mail->Password = MAILER_SMTP_PASSWORD;
//
//            $mail->From = SUPPORT_EMAIL;
//            $mail->FromName = SUPPORT_NAME;
//            $mail->AddAddress($to);
//            $mail->WordWrap = 50;
//            $mail->IsHTML(true);
//            $mail->Subject = $subject;
//            $mail->Body = $body;
//
//            $result = $mail->Send();
//        } else {
//            $result = mail($to, $subject, $body, $headers);
//        }
//
//        return $result;
//    }

    public static function mail($to, $subject, $body, $headers = '') {
        global $GLOBAL_MailController_Debug;

        // Checking
        if (!preg_match('/^([.0-9a-z_-]+)@(([0-9a-z-]+\.)+[0-9a-z]{2,4})$/i', SUPPORT_EMAIL)) {
            MessageHelper::setAppMessage("Please check your system configuration. The parameter 'SUPPORT_EMAIL' should be a valid email address.");

            return false;
        }

        if (!preg_match('/^([.0-9a-z_-]+)@(([0-9a-z-]+\.)+[0-9a-z]{2,4})$/i', $to)) {
            MessageHelper::setAppMessage("Invalid email recipient: $to");

            return false;
        }

        try {
            // Transport
            if (MAILER_USE_SMTP) {
                $transport = Swift_SmtpTransport::newInstance(MAILER_SMTP_HOST, MAILER_SMTP_PORT, MAILER_SMTP_ENCRYPTION);
                $transport->setUsername(MAILER_SMTP_USERNAME);
                $transport->setPassword(MAILER_SMTP_PASSWORD);
            } else {
                $transport = Swift_MailTransport::newInstance();
            }

            if ($GLOBAL_MailController_Debug) {
                // To use the ArrayLogger
                $logger = new Swift_Plugins_Loggers_ArrayLogger();
                $transport->registerPlugin(new Swift_Plugins_LoggerPlugin($logger));

                // Or to use the Echo Logger
                $logger = new Swift_Plugins_Loggers_EchoLogger();
                $transport->registerPlugin(new Swift_Plugins_LoggerPlugin($logger));
            }

            // Message
            $message = Swift_Message::newInstance();
            $message->setTo($to);
            $message->setSubject($subject);
            $message->setBody($body, 'text/html');

            if (preg_match('/From:\s+([^<]*)<([^>]+)>?/ism', $headers, $match)) {
                $from_name = $match[1];
                $from_email = $match[2];

                $message->setFrom($from_email, $from_name);
            } else {
                $message->setFrom(SUPPORT_EMAIL, SUPPORT_NAME);
            }

            // Send
            $mailer = Swift_Mailer::newInstance($transport);
            $result = $mailer->send($message, $failed_recipients);
        } catch (Swift_TransportException $e) {
            MessageHelper::setAppMessage($e->getMessage());

            return false;
        }

        return $result;
    }

    function testAction() {
        global $GLOBAL_MailController_Debug;

        $GLOBAL_MailController_Debug = true;

        $this->mail('vtq@vietmaisolutions.com', 'Hello', 'Testing...');
    }

    function queue($subject, $from, $to, $body, $cc = '', $bcc = '') {
        $model = new AdminMailModel();

        $model->SUBJECT = $subject;
        $model->FROM = $from;
        $model->TO = $to;
        $model->CONTENT = $body;
        $model->CC = $cc;
        $model->BCC = $bcc;
        $model->DATE_CREATED = date('Y-m-d H:i:s');

        $model->insert();
    }

    function cronAction() {
        set_time_limit(0);

        $model = new AdminMailModel();

        $model->whereAdd("DATE_SENT IS NULL");

        $model->find();

        while ($model->fetch()) {
            $headers  = 'MIME-Version: 1.0' . "\r\n";
            $headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
            $headers .= 'From: ' . $model->FROM . "\r\n";

            if ($this->mail($model->TO, $model->SUBJECT, $model->CONTENT, $headers)) {
                $model->DATE_SENT = date('Y-m-d H:i:s');
                $model->update();
            }
        }
    }
}
