package com.pfong.userstack.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.JdbcTemplate;
import com.microsoft.sqlserver.jdbc.SQLServerDataSource;

@Configuration
@PropertySource("classpath:application.properties")
public class JdbcConfiguration {

    @Value("${spring.datasource.url}")
    private String url;

    @Value("${spring.datasource.username}")
    private String username;

    @Value("${spring.datasource.password}")
    private String password;

    @Scope("singleton")
    @Bean
    public DataSource dataSource() {
        SQLServerDataSource dataSource = new SQLServerDataSource();
        dataSource.setURL(url);
        dataSource.setUser(username);
        dataSource.setPassword(password);
        System.out.println("系統訊息 >>> SQL Server DataSource Bean 初始化");
        return dataSource;
    }

    @Scope("prototype")
    @Bean
    public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        try {
            System.out.println("系統訊息 >>> 資料庫：" + jdbcTemplate.getDataSource().getConnection().getCatalog() + " 連線成功");
        } catch (Exception e) {
            System.err.println("系統訊息 >>> 資料庫連線失敗，請檢查網路或密碼配置。");
        }
        System.out.println("系統訊息 >>> JdbcTemplate Bean 初始化");
        return jdbcTemplate;
    }
}
