package com.example.demo.web;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
public class DemoController {

  @GetMapping("/")
  public String getMethodName() {
    return "Hello World!";
  }

}
