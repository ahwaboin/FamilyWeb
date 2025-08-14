package com.mycompany.family.vo;

import org.springframework.web.multipart.MultipartFile;

public class ImgVO {
	
	private String name;
	private MultipartFile uploadFile;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	
	
}
