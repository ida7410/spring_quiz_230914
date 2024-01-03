package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.domain.Bookmark;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {

	@Autowired
	private BookmarkBO bookmarkBO;
	
	@GetMapping("/add-bookmark-view")
	public String addBookmarkView() {
		return "lesson06/addBookmark";
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
		
		return "lesson06/bookmarkList";
	}
	
	@ResponseBody
	@GetMapping("/is-duplicated-url")
	public Map<String,Object> isDuplicatedUrl(
			@RequestParam("url") String url) {
		
		boolean is_duplicated = bookmarkBO.isDuplicatedByUrl(url);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("is_duplicated", is_duplicated);
		
		return result;
	}
	
	@ResponseBody
	@DeleteMapping("/delete-bookmark")
	public Map<String, Object> deleteBookmark(
			@RequestParam("id") int id) {
		
		int deletedRowCount = bookmarkBO.deleteBookmarkById(id);
		
		Map<String, Object> result = new HashMap<>();
		if (deletedRowCount > 0) {
			result.put("code", 200);
			result.put("result", "성공");
		}
		else {			
			result.put("code", 500);
			result.put("error_message", "삭제하는 데 실패했습니다.");
		}
		
		return result;
	}
}
