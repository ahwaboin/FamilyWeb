package com.mycompany.family;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.family.dao.StoryDAO;
import com.mycompany.family.vo.StoryVO;


@Controller
public class StoryController {
	@Autowired
	StoryDAO storyDAO;
	
	@RequestMapping("/story")
	public String story(Model model){
		model.addAttribute("storys", storyDAO.getAll());
		return "/story.jsp";
	}
	
	@RequestMapping("admin/adminStory")
	public String adminStory(Model model){
//		System.out.println(storyDAO.getAll().get(0).toString());
		model.addAttribute("storys", storyDAO.getAll());
		return "./adminStory.jsp";
	}
	
	@RequestMapping("admin/insertStory")
	public String insertStory(StoryVO storyVO,MultipartHttpServletRequest request){
		MultipartFile uploadFile=storyVO.getUploadFile();
		if(!uploadFile.isEmpty()){
			String fileName=uploadFile.getOriginalFilename();
			String path=request.getSession().getServletContext().getRealPath(
					"/resources/images");
			try {
				uploadFile.transferTo(new File(path+"\\"+fileName));
				storyVO.setImg(fileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		storyDAO.insertStory(storyVO);
		return "redirect:./adminStory";
	}
	
	@RequestMapping("admin/updateStory")
	public String updateStory(StoryVO storyVO,MultipartHttpServletRequest request){
		MultipartFile uploadFile=storyVO.getUploadFile();
		if(!uploadFile.isEmpty()){
			String fileName=uploadFile.getOriginalFilename();
			String path=request.getSession().getServletContext().getRealPath(
					"/resources/images");
			File file =new File(path+"\\"+storyVO.getImg());
			if(file.exists())
				file.delete();
			try {
				uploadFile.transferTo(new File(path+"\\"+fileName));
				storyVO.setImg(fileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//		System.out.println(storyVO);
		storyDAO.updateStory(storyVO);
		return "redirect:./adminStory";
	}
	
	@RequestMapping("admin/deleteStory")
	public String deleteStory(StoryVO storyVO){
		storyDAO.deleteStory(storyVO);
		return "redirect:./adminStory";
	}
}
