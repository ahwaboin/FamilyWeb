package com.mycompany.family.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.family.vo.GalleryVO;
import com.mycompany.family.vo.PicVO;

@Repository
public class PicDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<PicVO> getAll(GalleryVO galleryVO){
		return mybatis.selectList("picDAO.getAll",galleryVO);
	}
	
	public void insertPic(PicVO picVO){
		mybatis.insert("picDAO.insertPic", picVO);
	}
	
	public void deletePic(PicVO picVO){
		mybatis.delete("picDAO.deletePic", picVO);
	}
	
	public void deletePicAll(GalleryVO galleryVO){
		mybatis.delete("picDAO.deletePicAll",galleryVO);
	}

}
