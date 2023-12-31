package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.domain.Seller;
import com.quiz.lesson04.mapper.SellerMapper;

@Service
public class SellerBO {
	
	@Autowired
	private SellerMapper sellerMapper;
	
	public void addSeller(String nickname, String profileImgUrl, double temperature) {
		sellerMapper.insertSeller(nickname, profileImgUrl, temperature);
	}
	
	public Seller getLatestSeller() {
		return sellerMapper.selectLatestSeller();
	}
	
	public Seller getSellerById(int id) {
		return sellerMapper.selectSellerById(id);
	}
}
