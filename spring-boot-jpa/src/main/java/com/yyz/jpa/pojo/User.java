package com.yyz.jpa.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;

/**
 * 用户实体类
 *
 * @author YangYezhuang
 * @date 2023/8/15 21:30
 */
@Data
@JsonIgnoreProperties(value = {"hibernateLazyInitializer"})
@Entity //标识这是一个实体类
@Table(name = "user")   //标识与之映射的表名
public class User {
    /**
     * 主键生成策略：自增
     */
    @Id //识数据库主键
    @GeneratedValue(strategy = GenerationType.IDENTITY) //标识主键生成策略，这里是自增。
    private int id;
    private String username;
    private String password;
    private String sex;
    private int age;
}
