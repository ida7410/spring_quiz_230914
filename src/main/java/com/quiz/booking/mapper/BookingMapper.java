package com.quiz.booking.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.quiz.booking.domain.Booking;

@Mapper
public interface BookingMapper {
	
	public List<Booking> selectBookingList();
	
	public Booking selectLatestBookingByNamePhoneNumber(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
	
	public void insertBooking(
			@Param("name") String name,
			@Param("date") Date date,
			@Param("day") int day,
			@Param("headcount") int headcount,
			@Param("phoneNumber") String phoneNumber);
	
	public int deleteBookingById(int id);
	
}
