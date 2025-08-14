package com.mycompany.family.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.family.vo.UserVO;

@Repository("userDAO")
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<UserVO> getAll(){
		return mybatis.selectList("userDAO.getAll");
	}

	public void updateUser(UserVO userVO){
		mybatis.update("userDAO.updateUser", userVO);
	}
	
	public void deleteUser(UserVO userVO){
		mybatis.delete("userDAO.deleteUser", userVO);
	}
}
