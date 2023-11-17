package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@EnableAspectJAutoProxy
@SpringBootApplication
public class MiniProjectBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(MiniProjectBootApplication.class, args);
	}

}
