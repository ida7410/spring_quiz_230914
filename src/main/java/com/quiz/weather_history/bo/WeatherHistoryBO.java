package com.quiz.weather_history.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.weather_history.domain.Weather;
import com.quiz.weather_history.mapper.WeatherHistoryMapper;

@Service
public class WeatherHistoryBO {
	
	@Autowired
	private WeatherHistoryMapper weatherHistoryMapper;
	
	public List<Weather> getWeatherList() {
		return weatherHistoryMapper.selectWeatherList();
	}
	
	public void addWeather(Date date, String weather, double temperatures, 
			String microDust, double precipitation, double windSpeed) {
		weatherHistoryMapper.insertWeather(date, weather, temperatures, microDust, precipitation, windSpeed);
	}
	
}
