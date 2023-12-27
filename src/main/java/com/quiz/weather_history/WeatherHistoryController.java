package com.quiz.weather_history;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.weather_history.bo.WeatherHistoryBO;
import com.quiz.weather_history.domain.Weather;

@RequestMapping("/weather-history")
@Controller
public class WeatherHistoryController {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@GetMapping("/weather-list-view")
	public String weatherListView(Model model) {
		List<Weather> weatherList = weatherHistoryBO.getWeatherList();
		model.addAttribute("weatherList", weatherList);
		
		return "weather_history/weatherList";
	}
	
	@GetMapping("/add-weather-view")
	public String addWeatherView() {
		return "weather_history/addWeather";
	}
	
	@PostMapping("/add-weather")
	public String addWeather(
			@RequestParam("date") String date,
			@RequestParam("weather") String weather,
			@RequestParam("temperature") String temperature,
			@RequestParam("fineDust") String fineDust,
			@RequestParam("precipitation") double precipitaion,
			@RequestParam("wind") double wind) {
		
//		weatherHistoryBO.addWeather(date, weather, temperature, fineDust, precipitaion, wind);
		
		return "weather_history/weatherList";
	}
	
	
}