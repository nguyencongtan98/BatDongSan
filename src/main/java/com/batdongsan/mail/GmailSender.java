package com.batdongsan.mail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class GmailSender {

    public static void main(String[] args) throws MessagingException, UnsupportedEncodingException {
        // Email ID cua nguoi nhan can duoc de cap den.
        String to = "nctan98@gmail.com";

        // Email ID cua nguoi gui can duoc de cap den
        String from = "tancoder01@gmail.com";

        // Gia su ban dang gui email tu localhost
        String host = "localhost";

        // Lay cac system properties
        Properties properties = System.getProperties();

        // Thiet lap mail server
        properties.setProperty("mail.smtp.host", host);

        // Lay doi tuong Session mac dinh.
        Session session = Session.getDefaultInstance(properties);

        try{
            // Tao mot doi tuong MimeMessage mac dinh.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field.
            message.setFrom(new InternetAddress(from));

            // Set To: header field.
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Day la dong Subject!");

            // Bay gio thiet lap message thuc su
            message.setText("Day la message thuc su");

            // Send message
            Transport.send(message);
            System.out.println("Gui message thanh cong....");
        }catch (MessagingException mex) {
            mex.printStackTrace();
        }

    }

    public static void sendEmail(String to, String subject, String body, boolean bodyIsHTML)
            throws MessagingException, UnsupportedEncodingException {
        //1 - Get an email session
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtps");
        props.put("mail.smtps.host", "smtp.gmail.com");
        props.put("mail.smtps.port", 25);
        props.put("mail.smtps.auth", "true");
        props.put("mail.smtps.quitwait", "true");
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);

        //2 - Create a message
        Message message = new MimeMessage(session);
        message.setSubject(subject);
        if (bodyIsHTML) {
            message.setContent(body, "text/html");
        } else {
            message.setText(body);
        }

        // 3 - address the message
        Address fromAddress = new InternetAddress("conos.team@gmail.com", "Cong Tan");
        Address toAddress = new InternetAddress(to);
        message.setFrom(fromAddress);
        message.setRecipient(Message.RecipientType.TO, toAddress);

        // 4 - send the message
        Transport transport = session.getTransport();
        transport.connect("conos.team@gmail.com", "axoninsight123");
        transport.sendMessage(message, message.getAllRecipients());
        System.out.println("Done");
        transport.close();
    }
}
