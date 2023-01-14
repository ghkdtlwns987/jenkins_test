package com.LinkT.MH;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(value={"com.LinkT.MH.Mapper"})
public class MhApplication {
	public static void main(String[] args) {
		SpringApplication.run(MhApplication.class, args);
	}

}
