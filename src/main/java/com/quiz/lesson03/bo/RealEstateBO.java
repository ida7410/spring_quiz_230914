package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.domain.RealEstate;
import com.quiz.lesson03.mapper.RealEstateMapper;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateMapper realEstateMapper;
	
	// 3-1-1
	// input: int id
	// output: RealEstate
	public RealEstate getRealEstateById(int id) {
		return realEstateMapper.selectRealEstateById(id);
	}
	
	// 3-1-2
	// input: int rentPrice
	// ouptut: List<RealEstate>
	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) {
		return realEstateMapper.selectRealEstateListByRentPrice(rentPrice);
	}
	
	// 3-1-3
	// input: int area, int price
	// ouptut: List<RealEstate>
	public List<RealEstate> getRealEstateListByAreaAndPrice(int area, int price) {
		return realEstateMapper.selectRealEstateListByAreaAndPrice(area, price);
	}
	
	
	// 3-2-1
	// input: RealEstate
	// ouput: 성공한 행의 개수 int
	public int addRealEstate(RealEstate realEstate) {
		return realEstateMapper.insertRealEstate(realEstate);
	}
	
	// 3-2-2
	// input: int realtorId, String address, int area, String type, int price, Integer rentPrice
	// ouput: 성공한 행의 개수 int
	public int addRealEstateAsField(
			int realtorId, 
			String address, int area, 
			String type, int price, Integer rentPrice) {
		return realEstateMapper.insertRealEstateAsField(realtorId, address, area, type, price, rentPrice);
	}
	

	// 3-3-1
	// input: int id, String type, int price
	// ouput: 성공한 행의 개수 int
	public int updateRealEstateById(int id, String type, int price) {
		return realEstateMapper.updateRealEstateById(id, type, price);
	}
	
}
