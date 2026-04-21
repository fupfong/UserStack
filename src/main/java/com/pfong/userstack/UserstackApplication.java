package com.pfong.userstack;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.server.servlet.context.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class UserstackApplication {
	public static void main(String[] args) {
		SpringApplication.run(UserstackApplication.class, args);
	}
}
