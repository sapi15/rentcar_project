package dev.mvc.rentcar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"dev.mvc"})
public class RentcarApplication {

	public static void main(String[] args) {
		SpringApplication.run(RentcarApplication.class, args);
	}

}
