package com.hicamper.test.etc.mail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@RequestMapping(value = "/mail")
@Controller
public class MailController {
 
  @Autowired
  private JavaMailSender mailSender;
  
  // host password 메일링
  @RequestMapping(value = "/hostpw_send")
  public String hostPw_send(Model model, HttpServletRequest request, @RequestParam Map map) {
   
    String setfrom = "highcamper";         
    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
    String title   = request.getParameter("title");      // 제목
    String content = request.getParameter("content");    // 내용    
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper 
                        = new MimeMessageHelper(message, true, "UTF-8");
 
      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동 x
      messageHelper.setTo(tomail);     // 받는사람 이메일
      messageHelper.setSubject(title); // 메일제목은 생략이 가능
      messageHelper.setText(content);  // 메일 내용
      mailSender.send(message);
      
      System.out.println("mail send success");
      
    } catch(Exception e){
      System.out.println(e);
      System.out.println("mail send fail");
      return "common/host/hsearch_pw";
    }
    
    return "common/host/after_mailing";
  }
  
  //user password 메일링
  @RequestMapping(value = "/userpw_send")
  public String UserPw_send(Model model, HttpServletRequest request, @RequestParam Map map) {
  
	  String setfrom = "highcamper";         
	  String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	  String title   = request.getParameter("title");      // 제목
	  String content = request.getParameter("content");    // 내용    
   
	  try {
     
		  MimeMessage message = mailSender.createMimeMessage();
		  MimeMessageHelper messageHelper 
                       = new MimeMessageHelper(message, true, "UTF-8");

		  messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동 x
		  messageHelper.setTo(tomail);     // 받는사람 이메일
		  messageHelper.setSubject(title); // 메일제목은 생략이 가능
		  messageHelper.setText(content);  // 메일 내용
		  mailSender.send(message);
		  
	  } catch(Exception e) {		  
		  return "common/user/usearch_pw";
	  }
   
	  return "common/user/after_mailing";
  	}
  
} 