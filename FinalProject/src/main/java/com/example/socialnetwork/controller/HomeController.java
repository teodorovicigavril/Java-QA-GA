package com.example.socialnetwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "hello";
    }

    @GetMapping("/qa/{token}")
    public ModelAndView qa(@PathVariable String token) {
        System.out.println("the token got from FB is " + token);
        ModelAndView model = new ModelAndView("qa");
        model.addObject("token", token);
        return model;
    }

    @GetMapping("/giveaway/{token}")
    public ModelAndView giveAway(@PathVariable String token) {
        System.out.println("the token got from FB is " + token);
        ModelAndView model = new ModelAndView("ga");
        model.addObject("token", token);
        return model;
    }

    @GetMapping("/qa/comments/{id}/{token}")
    public ModelAndView comments(@PathVariable String id, @PathVariable String token) {
        ModelAndView model = new ModelAndView("comments");
        model.addObject("id", id);
        model.addObject("token", token);
        return model;
    }

    @GetMapping("/qa/randomComment/{id}/{token}")
    public ModelAndView randomComment(@PathVariable String id, @PathVariable String token) {
        ModelAndView model = new ModelAndView("randomComment");
        model.addObject("id", id);
        model.addObject("token", token);
        return model;
    }

    @GetMapping("/giveaway/getWinner/{id}/{token}")
    public ModelAndView getWinner(@PathVariable String id, @PathVariable String token) {
        ModelAndView model = new ModelAndView("winner");
        model.addObject("id", id);
        model.addObject("token", token);
        return model;
    }


}
