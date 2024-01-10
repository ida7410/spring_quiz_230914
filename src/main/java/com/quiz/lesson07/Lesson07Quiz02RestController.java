package com.quiz.lesson07;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.entity.RecruitmentEntity;
import com.quiz.lesson07.repository.RecruitmentRepository;

@RestController
@RequestMapping("/lesson07/quiz02")
public class Lesson07Quiz02RestController {
	
	@Autowired
	private RecruitmentRepository recruitmentRepository;
	
	@GetMapping("/1")
	public RecruitmentEntity quiz02_1() {
		return recruitmentRepository.findById(8).orElse(null);
	}
	
	@GetMapping("/2")
	public List<RecruitmentEntity> quiz02_2(
			@RequestParam("companyId") int companyId) {
		return recruitmentRepository.findByCompanyId(companyId);
	}
	
	@GetMapping("/3")
	public List<RecruitmentEntity> quiz02_3() {
		return recruitmentRepository.findByPositionAndType("웹 back-end 개발자", "정규직");
	}
	
	@GetMapping("/4")
	public List<RecruitmentEntity> quiz02_4() {
		return recruitmentRepository.findByTypeOrSalaryGreaterThanEqual("정규직", 9000);
	}
	
	@GetMapping("/5")
	public List<RecruitmentEntity> quiz02_5() {
		return recruitmentRepository.findTop3ByTypeOrderBySalaryDesc("계약직");
	}
	
	@GetMapping("/6")
	public List<RecruitmentEntity> quiz02_6() {
		return recruitmentRepository.findByRegionAndSalaryBetween("성남시 분당구", 7000, 8500);
	}
	
	@GetMapping("/7")
	public List<RecruitmentEntity> quiz02_7() {
		return recruitmentRepository.findByDeadlineSalaryTypec("2026-04-10", 8100, "정규직");
	}
}
