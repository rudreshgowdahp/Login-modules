package com.thinkworks.login.service;

import com.thinkworks.login.DTO.UserDTO;
import com.thinkworks.login.repository.UserRepository;
import com.thinkworks.login.repository.UserRepositoryImpl;

import java.sql.SQLException;

public class UserServiceImp implements UserService {

    @Override
    public String validateAndSave(UserDTO userDTO) throws SQLException, ClassNotFoundException {

        // Login id Validation
        if (userDTO.getLoginId() == null || userDTO.getLoginId().trim().isEmpty()) {
            return " Login Id is required";
        }
        String loginId = userDTO.getLoginId().trim();

        if (loginId.length() < 5 || loginId.length() > 20) {
            return "Login ID should be between 5 and 20 characters";
        }

        if (!loginId.matches("^[A-Za-z0-9]+$")) {
            return "Login ID should contain only letters and numbers";
        }

        // Name Validation
        if (userDTO.getName() == null || userDTO.getName().trim().isEmpty()) {
            return "Name is required";
        }

        if (userDTO.getName().length() < 3 || userDTO.getName().length() > 30) {
            return "Name should be between 3 and 30 characters";
        }

        // Email Validation
        if (userDTO.getEmail() == null || userDTO.getEmail().trim().isEmpty()) {
            return "Email is required";
        }

        if (!userDTO.getEmail().contains("@") ||
                !userDTO.getEmail().contains(".")) {
            return "Invalid email";
        }

        // Phone Number Validation
        if (userDTO.getPhoneNumber() == null || userDTO.getPhoneNumber().trim().isEmpty()) {
            return "Phone number is required";
        }

        if (userDTO.getPhoneNumber().length() != 10) {
            return "Phone number must contain 10 digits";
        }

        if (!(userDTO.getPhoneNumber().startsWith("6") ||
                userDTO.getPhoneNumber().startsWith("7") ||
                userDTO.getPhoneNumber().startsWith("8") ||
                userDTO.getPhoneNumber().startsWith("9"))) {
            return "Phone number should start with 6, 7, 8 or 9";
        }

        // Password Validation
        if (userDTO.getPassword() == null || userDTO.getPassword().isEmpty()) {
            return "Password is required";
        }

        if (userDTO.getPassword().length() < 6) {
            return "Password should contain at least 6 characters";
        }

        // Confirm Password Validation
        if (userDTO.getConfirmPassword() == null ||
                userDTO.getConfirmPassword().isEmpty()) {
            return "Confirm Password is required";
        }

        if (!userDTO.getPassword().equals(userDTO.getConfirmPassword())) {
            return "Password and Confirm Password do not match";
        }
        UserRepository userRepository = new UserRepositoryImpl();
        userRepository.save(userDTO);
        userRepository.findAll();

        return "Registration Successful";
    }


}