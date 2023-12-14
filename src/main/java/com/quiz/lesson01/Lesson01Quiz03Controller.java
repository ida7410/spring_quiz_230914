package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// jsp 파일로 보낼 때는 Controller만 사용 !!!ResponseBody 없음!!!
@Controller
public class Lesson01Quiz03Controller {
	
	@RequestMapping("/lesson01/quiz03/1")
	public String quiz03() {
		// ResponseBody가 아닌 단독으로 사용되는 @Controller + return String
		// => ViewResolver가 동작, return 된 String의 jsp 경로를 찾고 화면이 구성됨 => HTML 응답
		
		return "lesson01/quiz03";
	}
	
}
