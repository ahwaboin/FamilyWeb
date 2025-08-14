package com.mycompany.family;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.family.dao.UserDAO;
import com.mycompany.family.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	// @Autowired
	// UserDAO userDAO;
	// @Autowired
	// PasswordEncoder encoder;
	// @Autowired
	// JdbcUserDetailsManager jdbcUserMngr;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		// 최초 관리자 만들기
		// UserVO user=new UserVO();
		// user.setUsername("admin");
		// user.setPassword("admin");
		// String encodedPassword = encoder.encode(user.getPassword());
		// List<GrantedAuthority> authorities =
		// AuthorityUtils.createAuthorityList("ROLE_ADMIN");
		// UserDetails userD= new User(user.getUsername(), encodedPassword,
		// authorities);
		// jdbcUserMngr.createUser(userD);

		return "home.jsp";
	}

}
