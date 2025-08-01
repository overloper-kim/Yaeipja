package net.aisw.wit.yaeipja.repo;

import org.apache.ibatis.annotations.Mapper;

import net.aisw.wit.yaeipja.dto.UserDTO;

@Mapper
public interface UserMapper {
	int getID(UserDTO userVO);
	int loginUser(UserDTO userVo);
	int insertUser(UserDTO userVo);
}
