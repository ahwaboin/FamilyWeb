package com.mycompany.family.vo;

import org.springframework.web.multipart.MultipartFile;

public class PersonVO {
	
	private int id;
	private String name;
	private String profile;
	private String birth;
	private String role;
	private String img;
	private MultipartFile uploadFile;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	@Override
	public String toString() {
		return "PersonVO [id=" + id + ", name=" + name + ", profile=" + profile + ", birth=" + birth + ", role=" + role
				+ ", img=" + img + "]";
	}

}
