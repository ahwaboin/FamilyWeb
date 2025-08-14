package com.mycompany.family;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.family.dao.UserDAO;
import com.mycompany.family.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	UserDAO userDAO;
	@Autowired
	PasswordEncoder encoder;
	@Autowired
	JdbcUserDetailsManager jdbcUserMngr;
	
	@RequestMapping("/admin/adminUser")
	public String adminUser(Model model){
		model.addAttribute("users", userDAO.getAll());
		return "./adminUser.jsp";
	}
	
	@RequestMapping("/admin/insertUser")
	public String insertUser(UserVO userVO){
//		System.out.println(userVO.getPassword());
		String encodedPassword = encoder.encode(userVO.getPassword());
		List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_ADMIN");
		UserDetails user= new User(userVO.getUsername(), encodedPassword, authorities);
		jdbcUserMngr.createUser(user);
		return "redirect:/admin/adminUser";
	}
	
	@RequestMapping("/admin/updateUser")
	public String updateUser(UserVO userVO){
		String encodedPassword = encoder.encode(userVO.getPassword());
		userVO.setPassword(encodedPassword);
		userDAO.updateUser(userVO);
		return "redirect:/admin/adminUser";
	}
	
	@RequestMapping("/admin/deleteUser")
	public String deleteUser(UserVO userVO){
		userDAO.deleteUser(userVO);
		return "redirect:/admin/adminUser";
	}

}
