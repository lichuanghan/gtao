package com.gtao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 通用的页面跳转Controller
 * 
 * @author zhijun
 *
 */
@RequestMapping("page")
@Controller
public class PageController {

    @RequestMapping(value = "{pageName}", method = RequestMethod.GET)
    public ModelAndView toPage(@PathVariable("pageName") String pageName) {
    	ModelAndView m = new ModelAndView(pageName);
        return m;
    }
    
    

}
