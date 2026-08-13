package com.thinkworks.login.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
@Data
@AllArgsConstructor
@NoArgsConstructor

public class UserDTO  extends HttpServlet {
    private String loginId;
    private String name;
    private String email;
    private String phoneNumber;
    private String password;
    private String confirmPassword;

}
