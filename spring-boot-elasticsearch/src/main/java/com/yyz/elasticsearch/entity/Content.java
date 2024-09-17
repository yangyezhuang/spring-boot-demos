package com.yyz.elasticsearch.entity;

/**
 * (商品)实体类
 */
public class Content {

    private int goodId;

    private String goodShop;

    private String goodName;

    private String goodPrice;

    private String commentNum;

    private String goodLink;

    private String goodImg;

    public int getGoodId() {
        return goodId;
    }

    public void setGoodId(int goodId) {
        this.goodId = goodId;
    }

    public String getGoodShop() {
        return goodShop;
    }

    public void setGoodShop(String goodShop) {
        this.goodShop = goodShop;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public String getGoodPrice() {
        return goodPrice;
    }

    public void setGoodPrice(String goodPrice) {
        this.goodPrice = goodPrice;
    }

    public String getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(String commentNum) {
        this.commentNum = commentNum;
    }

    public String getGoodLink() {
        return goodLink;
    }

    public void setGoodLink(String goodLink) {
        this.goodLink = goodLink;
    }

    public String getGoodImg() {
        return goodImg;
    }

    public void setGoodImg(String goodImg) {
        this.goodImg = goodImg;
    }
}

