package com.ltw.online_store.Service;

public interface SecurityService {
    String getLoggedInUserName();

    void autoLogin(String userName, String passWord);
}
