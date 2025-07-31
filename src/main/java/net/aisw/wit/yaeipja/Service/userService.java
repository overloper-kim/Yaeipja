package net.aisw.wit.yaeipja.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.aisw.wit.yaeipja.dto.userDTO;
import net.aisw.wit.yaeipja.repo.userMapper;

@Service
public class userService {
	@Autowired
	public userMapper userMapper;
	
	public int getUserID(userDTO userVO) {
		return userMapper.getID(userVO);
	}
	
}
