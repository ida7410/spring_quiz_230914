package com.quiz.weather_history.mapper;

import java.util.Date;
import java.util.List;

import com.quiz.weather_history.domain.Weather;

public interface WeatherHistoryMapper {
	
	public List<Weather> selectWeatherList();
	
	public int insertWeather(String date, String weather, String temperature, 
			String fineDust, double precipitaion, double wind);
	
}
