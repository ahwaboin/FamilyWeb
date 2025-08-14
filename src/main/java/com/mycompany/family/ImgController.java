package com.mycompany.family;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.family.vo.ImgVO;

@Controller
public class ImgController {
	
	@RequestMapping("/admin/updateImg")
	public String updateImg(ImgVO imgVO,MultipartHttpServletRequest request) throws IllegalStateException, IOException{
		MultipartFile uploadFile=imgVO.getUploadFile();
		if(!uploadFile.isEmpty()){
			String fileName=imgVO.getName();
			String path=request.getSession().getServletContext().getRealPath(
					"/resources/backImg");
//			System.out.println(path+"\\"+fileName);
			uploadFile.transferTo(new File(path+"\\"+fileName));
		}
		return "redirect:/admin/adminImg.jsp";
	}
}
