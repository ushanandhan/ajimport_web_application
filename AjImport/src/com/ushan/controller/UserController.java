package com.ushan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	@RequestMapping("/userRegistrationController.htm")
	public String redirect()
	{
		return "userRegistrationController";
	}
}
