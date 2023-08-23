package com.yyz.elasticsearch.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * (商品)实体类
 */
@Data
@NoArgsConstructor
public class Content {

    private int goodId;

    private String goodShop;

    private String goodName;

    private String goodPrice;

    private String commentNum;

    private String goodLink;

    private String goodImg;

}

