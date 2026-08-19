package com.thinkworks.login.repository;

import com.thinkworks.login.DTO.UserDTO;

import java.sql.*;

public class UserRepositoryImpl implements UserRepository{
    @Override
    public UserDTO findByEmail(String email) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("findByEmail() called");
        String name = "root";
        String password = "Rudra@9019";
        String url = "jdbc:mysql://localhost:3306/thinkworks";
        Connection connection = DriverManager.getConnection(url,name,password);
        String sql = "SELECT email, password FROM userdetails WHERE email = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,email);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()){
            UserDTO user = new UserDTO();
            user.setEmail(resultSet.getString("email"));
            user.setPassword(resultSet.getString("password"));
            System.out.println(user);
            return user;
        }


        return null;
    }

    @Override
    public UserDTO findById(int id) throws SQLException {
        System.out.println("findById() called");
        String name = "root";
        String password = "Rudra@9019";
        String url = "jdbc:mysql://localhost:3306/thinkworks";
        Connection connection = DriverManager.getConnection(url,name,password);
        String sql = "select * from userdetails where id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            UserDTO userDTO = new UserDTO();
            userDTO.setName(resultSet.getString(2));
            userDTO.setEmail(resultSet.getString(3));
            userDTO.setPhoneNumber(resultSet.getString(4));
            userDTO.setPassword(resultSet.getString(5));
            return userDTO;
        }
        return null;
    }

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
        String sql = "insert into userdetcails values(0,'" + userDTO.getName()+"','" + userDTO.getEmail()+"','" + userDTO.getPhoneNumber()+" ','" + userDTO.getPassword()+" ')";
        statement.execute(sql);
      return false;
    }
}
