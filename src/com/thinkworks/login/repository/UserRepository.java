package com.thinkworks.login.repository;

import com.thinkworks.login.DTO.UserDTO;

import java.sql.SQLException;

public interface UserRepository {
    boolean save(UserDTO userDTO) throws ClassNotFoundException, SQLException;

    UserDTO  findAll() throws SQLException;

    UserDTO findById( int id) throws SQLException;

    UserDTO findByEmail(String email) throws SQLException, ClassNotFoundException;
}
