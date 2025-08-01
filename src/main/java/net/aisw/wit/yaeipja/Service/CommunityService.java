package net.aisw.wit.yaeipja.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.aisw.wit.yaeipja.dto.CommunityDTO;
import net.aisw.wit.yaeipja.repo.CommunityMapper;

@Service
public class CommunityService {
	@Autowired
	public CommunityMapper communityMapper;

	// 게시글 목록 조회
	public List<CommunityDTO> getCommunityList() {
		return communityMapper.getCommunityList();
	}

	// 게시글 상세 조회
	public CommunityDTO getCommunityById(int id) {
		// 조회수 증가
		communityMapper.increaseViewCount(id);
		return communityMapper.getCommunityById(id);
	}

	// 게시글 작성
	public int insertCommunity(CommunityDTO community) {
		return communityMapper.insertCommunity(community);
	}

	// 게시글 수정
	public int updateCommunity(CommunityDTO community) {
		return communityMapper.updateCommunity(community);
	}

	// 게시글 삭제
	public int deleteCommunity(int id) {
		return communityMapper.deleteCommunity(id);
	}
}