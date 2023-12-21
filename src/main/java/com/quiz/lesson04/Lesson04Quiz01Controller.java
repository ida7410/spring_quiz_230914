package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.domain.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	@GetMapping("/add-seller-view")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	@PostMapping("/add-seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value = "profileImgUrl", required = false) String profileImgUrl,
			@RequestParam("temperature") double temperature) {
		
		// DB insert
		sellerBO.addSeller(nickname, profileImgUrl, temperature);
		
		return "lesson04/afterAddSeller";
	}
	
	@GetMapping("seller-info-view")
	public String sellerInfo(
			@RequestParam(value = "id", required = false) Integer id,
			Model model) {
		
		Seller seller = null;
		if (id == null) {
			seller = sellerBO.getLatestSeller();
			model.addAttribute("title", "최근 추가된 판매자 정보");			
		}
		else {
			seller = sellerBO.getSellerById(id);
			model.addAttribute("title", "판매자 정보");			
		}
		model.addAttribute("result", seller);
		
		return "lesson04/latestSellerInfo";
	}
	
}
