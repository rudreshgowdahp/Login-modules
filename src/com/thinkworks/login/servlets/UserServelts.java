package com.thinkworks.login.servlets;

import com.thinkworks.login.DTO.UserDTO;
import com.thinkworks.login.service.UserService;
import com.thinkworks.login.service.UserServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = "/CreateLogin")

public class UserServelts extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDTO userDTO = new UserDTO();
        userDTO.setName(req.getParameter("name"));
        userDTO.setEmail(req.getParameter("email"));
        userDTO.setPhoneNumber(req.getParameter("phoneNumber"));
        userDTO.setPassword(req.getParameter("password"));
        userDTO.setConfirmPassword(req.getParameter("confirmPassword"));

        System.out.println(userDTO.toString());


        UserService userService = new UserServiceImp();
        String result = userService.validateAndSave(userDTO);


        if (result.equals("Registration Successful")) {

            req.setAttribute("name", userDTO.getName());

            RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
            dispatcher.forward(req, resp);
        }
         else if (!result.equals("Registration Successful")) {

            req.setAttribute("message",result);

            RequestDispatcher dispatcher = req.getRequestDispatcher("register.jsp");
            dispatcher.forward(req, resp);

        }else{
            req.setAttribute("name",userDTO.getName());
            req.setAttribute("email",userDTO.getEmail());
            req.setAttribute("phoneNumber",userDTO.getPhoneNumber());
            req.setAttribute("password",userDTO.getPassword());
            req.setAttribute("confirmPassword",userDTO.getConfirmPassword());
        }

            RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
            dispatcher.forward(req, resp);
        }
    }



