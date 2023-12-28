package com.quiz.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.delivery.bo.ReviewBO;
import com.quiz.delivery.domain.Review;
import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.domain.Store;

@RequestMapping("/delivery")
@Controller
public class DeliveryController {
	
	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	@GetMapping("/store-list-view")
	public String storeListView(Model model) {
		
		List<Store> stores = storeBO.getStoreList();
		model.addAttribute("stores", stores);
		
		return "delivery/storeList";
	}
	
	@GetMapping("/review-list-view")
	public String reviewListView(
			@RequestParam("storeId") int storeId,
			@RequestParam("storeName") String storeName,
			Model model) {
		
		List<Review> reviews = reviewBO.getReviewListByIdAndName(storeId);
		model.addAttribute("reviews", reviews);
		model.addAttribute("storeName", storeName);
		
		return "delivery/reviewList";
	}
	
}
