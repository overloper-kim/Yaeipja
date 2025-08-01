package net.aisw.wit.yaeipja.repo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.aisw.wit.yaeipja.dto.CommunityDTO;

@Mapper
public interface CommunityMapper {
	// 게시글 목록 조회
	List<CommunityDTO> getCommunityList();

	// 게시글 상세 조회
	CommunityDTO getCommunityById(int id);

	// 게시글 작성
	int insertCommunity(CommunityDTO community);

	// 게시글 수정
	int updateCommunity(CommunityDTO community);

	// 게시글 삭제
	int deleteCommunity(int id);

	// 조회수 증가
	int increaseViewCount(int id);
}