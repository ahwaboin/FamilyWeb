package com.mycompany.family;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

import com.mycompany.family.dao.UserDAO;
import com.mycompany.family.vo.UserVO;

public class TestMain {
	public static void main(String[] args) {
		AbstractApplicationContext container=
				new GenericXmlApplicationContext("root-context.xml");
		
		//admin test
//		Admin admin=new Admin();
//		AdminDAO adminDAO=(AdminDAO) container.getBean("adminDAO");
//		List<Admin> list=adminDAO.getAll(admin);
//		for(int i=0;i<list.size();i++){
//			System.out.println(list.get(i).toString());
//		}
		
		//user test
		String username = "admin";
        String password = "admin";
         
        PasswordEncoder encoder = (PasswordEncoder) container.getBean("passwordEncoder");
        String encodedPassword = encoder.encode(password);
        System.out.println("Encrypted password: " + encodedPassword);
         
        JdbcUserDetailsManager jdbcUserMngr = (JdbcUserDetailsManager) container.getBean("jdbcUserDetailsManager");
        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_ADMIN");
        UserDetails userJoe = new User(username, encodedPassword, authorities);
        jdbcUserMngr.createUser(userJoe);
         
        UserDetails userJoeLoaded = jdbcUserMngr.loadUserByUsername(username);
        System.out.println(userJoeLoaded);
        System.out.println("Password matches? " + encoder.matches(password, encodedPassword));
        System.out.println(userJoeLoaded.getPassword());
		
		//User getAll test
		UserDAO userDAO=(UserDAO) container.getBean("userDAO");
		List<UserVO> list=userDAO.getAll();
		
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).toString());
		}
		
		container.close();
	}

}
