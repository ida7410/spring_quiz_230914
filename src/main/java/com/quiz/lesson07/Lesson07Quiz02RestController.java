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
	public RecruitmentEntity findById() {
		return recruitmentRepository.findById(8).orElse(null);
	}
	
	@GetMapping("/2")
	public List<RecruitmentEntity> findByCompanyId(
			@RequestParam("companyId") int companyId) {
		return recruitmentRepository.findByCompanyId(companyId);
	}
	
	@GetMapping("/3")
	public List<RecruitmentEntity> findByPositionAndType() {
		return recruitmentRepository.findByPositionAndType("웹 back-end 개발자", "정규직");
	}
	
	@GetMapping("/4")
	public List<RecruitmentEntity> findByTypeOrSalary() {
		return recruitmentRepository.findByTypeOrSalaryGreaterThanEqual("정규직", 9000);
	}
	
	@GetMapping("/5")
	public List<RecruitmentEntity> findTop3ByTypeByOrderBySalaryDesc() {
		return recruitmentRepository.findTop3ByTypeOrderBySalaryDesc("계약직");
	}
	
	@GetMapping("/6")
	public List<RecruitmentEntity> findByRegionAndSalaryBetween() {
		return recruitmentRepository.findByRegionAndSalaryBetween("성남시 분당구", 7000, 8500);
	}
}
