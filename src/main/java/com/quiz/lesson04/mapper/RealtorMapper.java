package com.quiz.lesson04.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.quiz.lesson04.domain.Realtor;

@Mapper
public interface RealtorMapper {
	
	public int insertRealtor(Realtor realtor);
	
	public Realtor selectLatestRealtor();
	
}
