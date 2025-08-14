package com.mycompany.family.vo;

public class PicVO {
	private int picId;
	private int galleryId;
	private String title;
	private String img;
	@Override
	public String toString() {
		return "PicVO [picId=" + picId + ", galleryId=" + galleryId + ", title=" + title
				+ ", img=" + img + "]";
	}
	public int getPicId() {
		return picId;
	}
	public void setPicId(int picId) {
		this.picId = picId;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

}
