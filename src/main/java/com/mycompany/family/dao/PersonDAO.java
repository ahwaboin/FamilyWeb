package com.mycompany.family.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.family.vo.PersonVO;

@Repository
public class PersonDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<PersonVO> getAll(){
		return mybatis.selectList("personDAO.getAll");
	}
	
	public void updatePerson(PersonVO personVO){
		mybatis.update("personDAO.updatePerson",personVO);
	}
	
	public void insertPerson(PersonVO personVO){
		mybatis.insert("personDAO.insertPerson", personVO);
	}
	
	public void deletePerson(PersonVO personVO){
		mybatis.delete("personDAO.deletePerson", personVO);
	}
	

}
