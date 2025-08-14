package com.mycompany.family.vo;

import org.springframework.web.multipart.MultipartFile;

public class GalleryVO {
	
	private int galleryId;
	private String title;
	private String content;
	private String day;
	private String mainImg;
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getGalleryId() {
		return galleryId;
	}
	public void setGalleryId(int galleryId) {
		this.galleryId = galleryId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getMainImg() {
		return mainImg;
	}
	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}
	@Override
	public String toString() {
		return "GalleryVO [galleryId=" + galleryId + ", title=" + title + ", content=" + content + ", day=" + day
				+ ", mainImg=" + mainImg + "]";
	}
}
