package com.mycompany.family;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.family.dao.GalleryDAO;
import com.mycompany.family.dao.PicDAO;
import com.mycompany.family.vo.GalleryVO;
import com.mycompany.family.vo.PicVO;

@Controller
public class GalleryController {
	@Autowired
	GalleryDAO galleryDAO;
	@Autowired
	PicDAO picDAO;
	
	@RequestMapping("/gallery")
	public String gallery(Model model){
		model.addAttribute("gallery", galleryDAO.getAll());
		return "/gallery.jsp";
	}
	
	@RequestMapping("/galleryOne")
	public String galleryOne(Model model,GalleryVO galleryVO){
//		System.out.println(galleryVO.toString());
		model.addAttribute("gall", galleryVO);
		model.addAttribute("pics", picDAO.getAll(galleryVO));
		return "/galleryOne.jsp";
	}
	
	@RequestMapping("admin/adminGallery")
	public String adminGallery(Model model){
		model.addAttribute("gallery",galleryDAO.getAll());
		return "./adminGallery.jsp";
	}
	
	@RequestMapping("admin/insertGallery")
	public String insertGallery(GalleryVO galleryVO,MultipartHttpServletRequest request){
		MultipartFile uploadFile=galleryVO.getUploadFile();
		if(!uploadFile.isEmpty()){
			String fileName=uploadFile.getOriginalFilename();
			String path=request.getSession().getServletContext().getRealPath(
					"/resources/images");
			try {
				uploadFile.transferTo(new File(path+"\\"+fileName));
				galleryVO.setMainImg(fileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		galleryDAO.insertGallery(galleryVO);
		return "./adminGallery";
	}
	
	
	@RequestMapping("admin/updateGallery")
	public String updateGallery(GalleryVO galleryVO,MultipartHttpServletRequest request){
//		System.out.println(galleryVO.toString());
		MultipartFile uploadFile=galleryVO.getUploadFile();
		if(!uploadFile.isEmpty()){
			String fileName=uploadFile.getOriginalFilename();
			String path=request.getSession().getServletContext().getRealPath(
					"/resources/images");
			File file =new File(path+"\\"+galleryVO.getMainImg());
			if(file.exists())
				file.delete();
			try {
				uploadFile.transferTo(new File(path+"\\"+fileName));
				galleryVO.setMainImg(fileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//		System.out.println(galleryVO.toString());
		galleryDAO.updateGallery(galleryVO);
		return "./updateGalleryPage";
	}
	
	//Picture와 연관된
	
	//갤러리와 갤러리속 사진들 가져옴
	@RequestMapping("admin/updateGalleryPage")
	public String updateGalleryPage(Model model,GalleryVO galleryVO){
//		System.out.println(galleryVO.toString());
		model.addAttribute("pics", picDAO.getAll(galleryVO));
		model.addAttribute("gall", galleryDAO.getGallery(galleryVO));
		return "./updateGallery.jsp";
	}
	
	//갤러리 삭제시 갤러리속 사진도 삭제
	@RequestMapping("admin/deleteGallery")
	public String deleteGallery(GalleryVO galleryVO,
			HttpServletRequest request){
		//사진파일들도 삭제
		List<PicVO> picList=picDAO.getAll(galleryVO);
		Iterator<PicVO> itr=picList.iterator();
		String path=request.getSession().getServletContext().getRealPath(
				"/resources/images");
		
		//메인 이미지 삭제
//		System.out.println(galleryVO.getMainImg());
		File file =new File(path+"\\"+galleryVO.getMainImg());
		if(file.exists())
			file.delete();
		while(itr.hasNext()){
			String fileName=itr.next().getImg();
//			System.out.println(fileName);
			File picFile =new File(path+"\\"+fileName);
			if(picFile.exists())
				picFile.delete();
		}
		
		picDAO.deletePicAll(galleryVO);
		galleryDAO.deleteGallery(galleryVO);
		return "./adminGallery";
	}
	
	//갤러리속 사진 추가
	@RequestMapping("admin/insertPic")
	public String insertPic(MultipartHttpServletRequest request,
			PicVO picVO,
			GalleryVO galleryVO,
			RedirectAttributes redirectAttributes){
		
		String path=request.getSession().getServletContext().getRealPath(
				"/resources/images");
		List<MultipartFile> fileList=request.getFiles("uploadFiles");
		Iterator<MultipartFile> itr=fileList.iterator();
			for(int i=0;i<fileList.size();i++){
				if(!fileList.get(i).getOriginalFilename().isEmpty()){
//					System.out.println(fileList.get(i).getOriginalFilename());
					String fileName=fileList.get(i).getOriginalFilename();
					try {
						itr.next().transferTo(new File(path+"\\"+fileName));
						picVO.setImg(fileName);
						picDAO.insertPic(picVO);
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
		galleryVO.setGalleryId(picVO.getGalleryId());
		redirectAttributes.addFlashAttribute(galleryVO);
		return "redirect:./updateGalleryPage";
	}
	
	@RequestMapping("admin/deletePic")
	public String deletePic(PicVO picVO,
			RedirectAttributes redirectAttributes,
			GalleryVO galleryVO){
		
		picDAO.deletePic(picVO);
		
		galleryVO.setGalleryId(picVO.getGalleryId());
		redirectAttributes.addFlashAttribute(galleryVO);
		return "redirect:./updateGalleryPage";
	}
}
