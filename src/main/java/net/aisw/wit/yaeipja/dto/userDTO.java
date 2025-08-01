package net.aisw.wit.yaeipja.dto;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class UserDTO {
	private String id;
	private String pw;
	private String nickname;
	private String birth_date;
	private String phone;
	private String address;
	private String sex;
	private String height;
	private String weight;
}
