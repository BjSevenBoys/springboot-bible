package com.bible.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * test
 */
@Controller
public class IndexController {

	 @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model){
        //User user = userService.querUser();
    	//User user = new User();
        //model.addAttribute("user",user);
        return "index";
    }
}
