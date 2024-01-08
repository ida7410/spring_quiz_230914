package com.quiz.lesson03.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.quiz.lesson03.domain.RealEstate;

@Mapper
public interface RealEstateMapper {
	
	// 3-1-1
	// input: int id
	// ouput: RealEstate
	public RealEstate selectRealEstateById(int id);
	
	// 3-1-2
	// input: int rentPrice
	// ouput: List<RealEstate>
	public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice);
	
	// 3-1-3
	// input: int area, int price
	// ouput: List<RealEstate>
	public List<RealEstate> selectRealEstateListByAreaAndPrice(
			// MyBatix 문법 상 parameter는 한 개만 xml로 보낼 수 있기 때문에 map에 담아서 보내야 함
			// @Param = parameters를 map으로 만들어주는 annotation
			@Param("area") int area, @Param("price") int price);
	
	
	// 3-2-1
	// input: RealEstate
	// ouput: int 성공한 행의 개수
	public int insertRealEstate(RealEstate realEstate);
	
	// 3-2-2
	// input: int realtorId, String address, int area, String type, int price, Integer rentPrice
	// ouput: int 성공한 행의 개수
	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId
			,@Param("address") String address
			,@Param("area") int area
			,@Param("type") String type
			,@Param("price") int price
			,@Param("rentPrice") Integer rentPrice);
	
	
	// 3-3-1
	// input: int id, String type, int price
	// ouput: 성공한 행의 개수 int
	public int updateRealEstateById(
			@Param("id") int id
			,@Param("type") String type
			,@Param("price") int price);
	
	
	// 3-4-1
	// input: int id
	// ouput: int 성공한 행의 개수
	public int deleteRealEstateById(int id);
	
}
