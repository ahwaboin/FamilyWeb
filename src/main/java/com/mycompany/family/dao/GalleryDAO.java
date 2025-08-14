package com.mycompany.family.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.family.vo.GalleryVO;

@Repository
public class GalleryDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<GalleryVO> getAll(){
		return mybatis.selectList("galleryDAO.getAll");
	}
	
	public void insertGallery(GalleryVO galleryVO){
		mybatis.insert("galleryDAO.insertGallery",galleryVO);
	}
	
	public void deleteGallery(GalleryVO galleryVO){
		mybatis.insert("galleryDAO.deleteGallery",galleryVO);
	}
	
	public void updateGallery(GalleryVO galleryVO){
		mybatis.update("galleryDAO.updateGallery",galleryVO);
	}
	
	public GalleryVO getGallery(GalleryVO galleryVO){
		return mybatis.selectOne("galleryDAO.getGallery",galleryVO);
	}
}
