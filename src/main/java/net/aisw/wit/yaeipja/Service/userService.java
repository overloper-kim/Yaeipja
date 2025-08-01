 package net.aisw.wit.yaeipja.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.aisw.wit.yaeipja.dto.UserDTO;
import net.aisw.wit.yaeipja.repo.UserMapper;

@Service
public class UserService {
	@Autowired
	public UserMapper userMapper;

	public int getUserID(UserDTO userVO) {
		return userMapper.getID(userVO);
	}

	public int login(UserDTO userVO) {
		return userMapper.loginUser(userVO);
	}

	public int signup(UserDTO userVO) {
		return userMapper.insertUser(userVO);
	}
}
