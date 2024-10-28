package com.revature.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError() {
        // Return the name of your JSP error page
        return "errorPage"; // This refers to error.jsp in the views directory
    }

//    @Override
    public String getErrorPath() {
        return "/errorPage"; // This method is required by ErrorController
    }
}
