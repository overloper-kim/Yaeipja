package net.aisw.wit.yaeipja.dto;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class CommunityDTO {
	private int id;
	private String title;
	private String content;
	private String author;
	private String created_at;
	private String updated_at;
	private int view_count;
	private int like_count;
}