package org.hdg.dockerstudy.controller;

import org.hdg.dockerstudy.model.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @auther: huangxiaojun
 * @date: 2019/08/09 12:11
 */
@Controller
@RequestMapping("/helloWorld")
public class HelloWorldController {

    @RequestMapping(value = "/test")
    @ResponseBody
    public Result<String> test(String msg){
        System.out.println("msg:"+msg);
        return new Result<>(0,"ok",msg);
    }
}
