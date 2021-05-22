package com.wyp.system.service.impl;

import com.wyp.system.service.iMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements iMailService {

    /**
     * springboot 提供的一个发送邮件的简单抽象, 直接注入即可
     */
    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.from}")
    private String from;

    /**
     * 发送邮件
     *
     * @param to      收件人
     * @param subject 主题
     * @param content 内容
     */
    @Override
    public void sendMail(String to, String subject, String content) {
        // 创建一个邮箱消息对象
        SimpleMailMessage message = new SimpleMailMessage();
        // 配置邮箱发送人
        message.setFrom(from);
        // 邮箱的收件人
        message.setTo(to);
        // 邮箱的主题
        message.setSubject(subject);
        // 邮箱的内容
        message.setText(content);
        mailSender.send(message);
        System.err.println(">>>>>>>>>>>>>>>>>: 邮箱发送成功");
    }
}
