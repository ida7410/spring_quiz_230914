package com.quiz.weather_history.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.quiz.weather_history.domain.Weather;

public interface WeatherHistoryMapper {
	
	public List<Weather> selectWeatherList();
	
	public int insertWeather(
			@Param("date") Date date, 
			@Param("weather") String weather, 
			@Param("temperatures") double temperatures, 
			@Param("microDust") String microDust, 
			@Param("precipitation") double precipitation, 
			@Param("windSpeed") double windSpeed);
	
}
