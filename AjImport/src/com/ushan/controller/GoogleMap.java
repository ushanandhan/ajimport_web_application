package com.ushan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GoogleMap {

	@RequestMapping("/googleMap.htm")
	public String redirect(){
		return "googleMap";
	}
}
