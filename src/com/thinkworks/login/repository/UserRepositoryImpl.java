package com.thinkworks.login.repository;

import com.thinkworks.login.DTO.UserDTO;

import java.sql.*;

public class UserRepositoryImpl implements UserRepository{

    @Override
    public UserDTO findAll() throws SQLException {
        System.out.println("findAll() called");
        String name = "root";
        String password = "Rudra@9019";
        String url = "jdbc:mysql://localhost:3306/thinkworks";
        Connection connection = DriverManager.getConnection(url,name,password);
        String sql = "select * from userdetails";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        System.out.println(resultSet);

        while (resultSet.next()){

            System.out.println(resultSet.getInt(1));
            System.out.println(resultSet.getString("name"));
            System.out.println(resultSet.getString(3));
            System.out.println(resultSet.getString("password"));
        }

        return null;
    }

    @Override
    public boolean save(UserDTO userDTO) throws ClassNotFoundException, SQLException {
       Class.forName("com.mysql.cj.jdbc.Driver");
        String name = "root";
        String password = "Rudra@9019";
        String url = "jdbc:mysql://localhost:3306/thinkworks";
        Connection connection = DriverManager.getConnection(url, name, password);
        Statement statement = connection.createStatement();
        String sql = "insert into userdetails values(0,'" + userDTO.getName()+"','" + userDTO.getEmail()+"','" + userDTO.getPhoneNumber()+" ','" + userDTO.getPassword()+" ')";
        statement.execute(sql);
      return false;
    }
}
