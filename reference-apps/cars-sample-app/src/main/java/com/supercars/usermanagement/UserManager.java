/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.supercars.usermanagement;

import javax.servlet.http.HttpSession;

/**
 *
 * @author tom.batchelor
 */
public class UserManager {

    private static User bob = new User("bob@test.com", "password");
    private static User geoff = new User("geoff@cars.com", "password");
    private static User bill = new User("bill@yahoo.co.uk", "password");
    private static User dave = new User("dave@internet.org", "password");

    private static User[] users = {bob, geoff, bill, dave};

    private static final String USER_ATTRIBUTE = "user";

    public static boolean login(User user, HttpSession session) {
        if (user == null || user.getUsername() == null || user.getPassword() == null) {
            return false;
        }

        String username = user.getUsername();
        String password = user.getPassword();
        for (User u : users) {
            if (u.getUsername().equals(username)) {
                if (u.getPassword().equals(password)) {
                    session.setAttribute(USER_ATTRIBUTE, u.clone());
                    return true;
                }
            }
        }

        return false;
    }

    public static boolean logout(HttpSession session) {
        session.setAttribute(USER_ATTRIBUTE, null);
        return true;
    }

    public static User getUserForSession(HttpSession session) {
        User user = (User) session.getAttribute(USER_ATTRIBUTE);
        if (user == null) {
            user = new User();
        } else {
            user = user.clone();
            user.setPassword(null);
        }

        return user;
    }
}
