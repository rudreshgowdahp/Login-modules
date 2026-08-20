package com.thinkworks.login.servlets;

import com.thinkworks.login.DTO.UserDTO;
import com.thinkworks.login.service.UserService;
import com.thinkworks.login.service.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet(urlPatterns = "/login")

public class LoginServlets extends HttpServlet {
    private UserService userService = new UserServiceImp();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("called");
        UserDTO userDTO = new UserDTO();
        userDTO.setEmail(req.getParameter("email"));
        userDTO.setPassword(req.getParameter("password"));
        UserDTO user = null;
        try {
            user = userService.validateLogin(userDTO.getEmail(),userDTO.getPassword());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        System.out.println(user);
        if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
            req.getRequestDispatcher("home.jsp").forward(req, resp);
            } else {
                req.setAttribute("message", "Invalid email or Password");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }

        }
    }
