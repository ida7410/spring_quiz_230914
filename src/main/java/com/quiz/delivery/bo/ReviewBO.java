package com.quiz.delivery.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.delivery.domain.Review;
import com.quiz.delivery.mapper.ReviewMapper;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	public List<Review> getReviewListByIdAndName(int storeId) {
		return reviewMapper.selectReviewListByIdAndName(storeId);
	}
	
}
