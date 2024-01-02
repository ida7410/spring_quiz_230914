package com.quiz.test.temp.lesson06.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.test.temp.lesson06.domain.Bookmark;

@Repository
public interface BookmarkMapper {
	
	public List<Bookmark> selectBookmarkList();
	
	public int insertBookmark(@Param("name") String name, @Param("url") String url);
	
}
