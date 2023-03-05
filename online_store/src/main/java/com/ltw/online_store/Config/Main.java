package com.ltw.online_store.Config;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        while(true) {
            Scanner input = new Scanner(System.in);
            String password = input.next();
            if(check(password)==1){
                System.out.println("YES");
            }
            else {
                System.out.println("NO");
            }
        }

    }
    public static int check(String passWord){
        int check=0;
        if(passWord.length()<6||passWord.length()>16){
            check=0;
        }
        else {
            int count1=0;
            int count2=0;
            int count3=0;

            for (int i = 0; i <passWord.length() ; i++) {
                char c=passWord.charAt(i);
                if(Character.isDigit(c)){
                    count1=1;
                } else if (c=='$'||c=='#'||c=='@') {
                    count2=1;
                }
                else {
                    count3=1;
                }
            }
            int sum=count1+count2+count3;
            if (sum==3){
                check=1;
            }
            else {
                check=0;
            }

        }
        return check;

    }
}
