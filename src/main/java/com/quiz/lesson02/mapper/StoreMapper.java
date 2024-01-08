package com.quiz.lesson02.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.quiz.lesson02.domain.Store;

@Mapper
public interface StoreMapper {
	
	// input: x
	// output: List<Store> to BO
	public List<Store> selectStoreList();
	
}
