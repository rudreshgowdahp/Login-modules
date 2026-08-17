package com.thinkworks.login.servlets;

import com.thinkworks.login.DTO.UserDTO;
import com.thinkworks.login.service.UserServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet (urlPatterns = "/fetchById")
public class FetchByServlets  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserServiceImp userServiceImp = new UserServiceImp();
       int id = Integer.parseInt(req.getParameter("id"));
        UserDTO userDTO = null;
        try {
            userDTO = userServiceImp.fetchByid(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("dto",userDTO);

        System.out.println("working");
        RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
        dispatcher.forward(req, resp);
    }
}
