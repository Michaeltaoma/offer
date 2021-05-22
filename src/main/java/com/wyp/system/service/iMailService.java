package com.wyp.system.service;

public interface iMailService {

    /**
     * 发送邮件
     *
     * @param to
     * @param subject
     * @param content
     */
    void sendMail(String to, String subject, String content);

}
