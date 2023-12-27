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
	
	public void addWeather(String date, String weather, String temperature, 
			String fineDust, double precipitaion, double wind) {
		weatherHistoryMapper.insertWeather(date, weather, temperature, fineDust, precipitaion, wind);
	}
	
}
