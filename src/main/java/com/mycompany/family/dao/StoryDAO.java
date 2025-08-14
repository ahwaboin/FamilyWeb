package com.mycompany.family.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.family.vo.StoryVO;

@Repository
public class StoryDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<StoryVO> getAll(){
		return mybatis.selectList("storyDAO.getAll");
	}
	
	public void insertStory(StoryVO storyVO){
		mybatis.insert("storyDAO.insertStory", storyVO);
	}
	
	public void updateStory(StoryVO storyVO){
		mybatis.update("storyDAO.updateStory",storyVO);
	}
	
	public void deleteStory(StoryVO storyVO){
		mybatis.delete("storyDAO.deleteStory", storyVO);
	}
}
