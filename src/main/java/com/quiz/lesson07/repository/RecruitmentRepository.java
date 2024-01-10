package com.quiz.lesson07.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.quiz.lesson07.entity.RecruitmentEntity;

public interface RecruitmentRepository extends JpaRepository<RecruitmentEntity, Integer> {
	
	public List<RecruitmentEntity> findByCompanyId(int companyId);
	public List<RecruitmentEntity> findByPositionAndType(String position, String type);
	public List<RecruitmentEntity> findByTypeOrSalaryGreaterThanEqual(String type, int salary);
	public List<RecruitmentEntity> findTop3ByTypeOrderBySalaryDesc(String type);
	public List<RecruitmentEntity> findByRegionAndSalaryBetween(String region, int salaryStart, int salaryEnd);
	
	// findByDeadlineAfterAndSalaryGreaterThanEqualAndTypeOrderBySalaryDesc
	@Query(value = "select * from `recruitment` "
			+ "where `deadline` > :deadline "
			+ "and `salary` >= :salary "
			+ "and `type` = :type "
			+ "order by `salary` desc"
			, nativeQuery = true)
	public List<RecruitmentEntity> findByDeadlineSalaryTypec(
			@Param("deadline") String deadline, 
			@Param("salary") int salary, 
			@Param("type") String type);
}
