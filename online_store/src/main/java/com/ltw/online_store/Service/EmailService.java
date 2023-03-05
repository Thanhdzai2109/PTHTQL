package com.ltw.online_store.Service;

public interface EmailService {
    void sendSimpleMessage(String to, String subject, String text);
}
