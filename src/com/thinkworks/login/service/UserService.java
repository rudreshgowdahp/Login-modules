package com.thinkworks.login.service;

import com.thinkworks.login.DTO.UserDTO;

public interface UserService {

    // Registration validation
    String validateAndSave(UserDTO userDTO);


}
