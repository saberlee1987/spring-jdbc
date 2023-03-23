package com.saber.springjdbc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
@Configuration
@ImportResource(value = "classpath:applicationContext.xml")
@EnableTransactionManagement
public class AppConfig {

    @Bean
    public JdbcTemplate jdbcTemplate(DriverManagerDataSource dataSource){
        return new JdbcTemplate(dataSource);
    }
}
