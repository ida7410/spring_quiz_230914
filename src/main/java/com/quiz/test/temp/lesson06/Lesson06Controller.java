package com.quiz.test.temp.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.test.temp.lesson06.bo.BookmarkBO;
import com.quiz.test.temp.lesson06.domain.Bookmark;

@RequestMapping("/temp/lesson06")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private BookmarkBO bookmarkBO;
	
	@GetMapping("/add-bookmark-view")
	public String addBookmarkView() {
		return "temp/lesson06/addBookmark";
	}
	
	// AJAX 통신 요청 => always return json string
	@ResponseBody
	@PostMapping("/add-bookmark")
	public Map<String, Object> addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		bookmarkBO.addBookmark(name, url);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("result", "success");
		/*
		 * {
		 * 	  "code":200
		 * 	  ,"result":"성공"
		 * }
		 */
		
		return result;
	}
	
	@GetMapping("/bookmark-list-view")
	public String bookmarkListView(Model model) {
		List<Bookmark> bookmarks = bookmarkBO.getBookmarkList();
		model.addAttribute("bookmarks", bookmarks);
		
		return "temp/lesson06/bookmarkList";
	}
	
	@ResponseBody
	@GetMapping("/is-duplicated-url")
	public Map<Stirng,Object> isDuplicatedUrl() {
		
	}
	
}
