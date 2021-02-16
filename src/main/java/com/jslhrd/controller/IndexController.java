package com.jslhrd.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/")
@AllArgsConstructor
public class IndexController {
	private static final Logger logger = 
			LoggerFactory.getLogger(IndexController.class);
	
	@GetMapping("index")
	public String index() {
		logger.info("index......");
		return "/Contents/index";
	}
}
