package eltag;

import java.util.HashMap;
import java.util.Map;

//EL을 사용하여 객체이 메서드 호출하는 예제
//호출에 사용할 클래스 - 섭씨/화씨를 변환하는 클래스
public class Thermometer {
	private Map<String, Double> locationCelsiusMap 
	= new HashMap<String, Double>();
	
	public void setCelsius(String location, Double value) {
		locationCelsiusMap.put(location, value);
	}
	
	public Double getCelsius(String location) {
		return locationCelsiusMap.get(location);
	}
	
	public Double getFahrenheit(String location) {
		Double celsius = getCelsius(location);
		if(celsius == null) {
			return null;
		}
		return celsius.doubleValue() * 1.8 + 32.0;
	}
	
	public String getInfo() {
		return "온도계 변환기 1.0";
	}
}









