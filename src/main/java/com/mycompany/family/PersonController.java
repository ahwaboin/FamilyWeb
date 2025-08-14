package com.mycompany.family;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.family.dao.PersonDAO;
import com.mycompany.family.vo.PersonVO;

@Controller
public class PersonController {
	@Autowired
	PersonDAO personDAO;
	
	@RequestMapping("admin/adminFamily")
	public String adminFamily(Model model){
		model.addAttribute("family", personDAO.getAll());
		return "adminFamily.jsp";
	}
	
	@RequestMapping("admin/updatePerson")
	public String updatePerson(PersonVO personVO,MultipartHttpServletRequest request) throws IllegalStateException, IOException{
//		System.out.println(personVO.getImg());
		MultipartFile uploadFile=personVO.getUploadFile();
		if(!uploadFile.isEmpty()){
			String fileName=uploadFile.getOriginalFilename();
			String path=request.getSession().getServletContext().getRealPath(
					"/resources/images");
//			System.out.println(path+"\\"+fileName);
			File file =new File(path+"\\"+personVO.getImg());
			if(file.exists())
				file.delete();
			uploadFile.transferTo(new File(path+"\\"+fileName));
			personVO.setImg(fileName);
		}
//		System.out.println(personVO.getImg());
		personDAO.updatePerson(personVO);
		return "redirect:./adminFamily";
	}
	
	@RequestMapping("admin/insertPerson")
	public String insertPerson(PersonVO personVO,MultipartHttpServletRequest request){
		MultipartFile uploadFile=personVO.getUploadFile();
		if(!uploadFile.isEmpty()){
			String fileName=uploadFile.getOriginalFilename();
			String path=request.getSession().getServletContext().getRealPath(
					"/resources/images");
			try {
				uploadFile.transferTo(new File(path+"\\"+fileName));
				personVO.setImg(fileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		personDAO.insertPerson(personVO);
//		System.out.println(personVO.toString());
		return "redirect:./adminFamily";
	}
	
	@RequestMapping("admin/deletePerson")
	public String deletePerson(PersonVO personVO){
		personDAO.deletePerson(personVO);
		return "redirect:./adminFamily";
	}
	
	//about page
	@RequestMapping("/about")
	public String about(Model model){
		//가족 구분 처리를 여기서
		List<PersonVO> personList=personDAO.getAll();
		List<PersonVO> childList=new ArrayList<PersonVO>();
		for(int i=0;i<personList.size();i++){
//			System.out.println(personList.get(i).getProfile());
			personList.get(i).getProfile().replace("\r\n", "<br>");
			if(personList.get(i).getRole().equals("father")){
				model.addAttribute("father", personList.get(i));
			}
			else if(personList.get(i).getRole().equals("mother"))
				model.addAttribute("mother", personList.get(i));
			else if(personList.get(i).getRole().equals("child"))
				childList.add(personList.get(i));
		}
		model.addAttribute("children", childList);
		return "about.jsp";
	}
}
