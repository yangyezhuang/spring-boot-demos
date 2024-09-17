package com.yyz.minio.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * 分页查询结果模型类
 */
public class PageResult<T> implements Serializable {
    private List<T> items;
    private long counts;
    private long page;
    private long pageSize;

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    public long getCounts() {
        return counts;
    }

    public void setCounts(long counts) {
        this.counts = counts;
    }

    public long getPage() {
        return page;
    }

    public void setPage(long page) {
        this.page = page;
    }

    public long getPageSize() {
        return pageSize;
    }

    public void setPageSize(long pageSize) {
        this.pageSize = pageSize;
    }


    public PageResult(List<T> items, long counts, long page, long pageSize) {
        this.items = items;          // 当前页的数据列表
        this.counts = counts;   // 总记录数
        this.page = page;     // 当前页码
        this.pageSize = pageSize;// 每页显示的记录数量
    }

}
