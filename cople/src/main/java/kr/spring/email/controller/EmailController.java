package kr.spring.email.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmailController {
	@Autowired
	JavaMailSenderImpl mailSender;

	//이메일 인증
	@PostMapping("/member/EmailAuth")
	@ResponseBody
	public Map<String,Integer> emailAuth(String email) {
		

		log.info("선수입장 : ");

		Map<String,Integer> mapJson = new HashMap<String,Integer>();
		
		//난수의 범위 111111 ~ 999999 (6자리 난수)
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		
		//이메일 보낼 양식
		String setFrom = "cople0126@gmail.com"; //2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증 코드는 " + checkNum + " 입니다." +
						 "<br>" +
						 "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage(); //Spring에서 제공하는 mail API
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            mailSender.send(message);
            
            mapJson.put("code", checkNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		log.info("랜덤숫자 : " + checkNum);
		
		return mapJson;
	}
}
