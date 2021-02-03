package com.example.demo.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component

@ConfigurationProperties(prefix="custom")
//@PropertySource("classpath:custom.properties")
//@ConfigurationProperties
public class CustomProperty {

	public String welcome;
	public String goodbye;
	public String getWelcome() {
		return welcome;
	}
	public void setWelcome(String welcome) {
		this.welcome = welcome;
	}
	public String getGoodbye() {
		return goodbye;
	}
	public void setGoodbye(String goodbye) {
		this.goodbye = goodbye;
	}
	
	
	
	
	
	
}
