package net.aisw.wit.yaeipja.repo;

import org.apache.ibatis.annotations.Mapper;

import net.aisw.wit.yaeipja.dto.userDTO;

@Mapper
public interface userMapper {
	int getID(userDTO userVO);
}
