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

	// 회원가입 처리
	public int signup(UserDTO user) {
		return userMapper.insertUser(user);
	}
}
