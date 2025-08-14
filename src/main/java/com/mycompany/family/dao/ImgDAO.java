package com.mycompany.family.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.family.vo.ImgVO;

@Repository("imgDAO")
public class ImgDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<ImgVO> getAll(){
		return mybatis.selectList("imgDAO.getAll");
	}

}
