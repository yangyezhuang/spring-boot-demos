package com.yyz.elasticsearch.service;

import com.yyz.elasticsearch.entity.Content;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * (商品)表服务接口
 */
public interface ContentService {

    /**
     * 查询全部
     */
    List<Content> queryAll() throws IOException;


    /**
     * 搜索
     *
     * @param keyword  关键词
     * @param pageNum  页码
     * @param pageSize 每页条数
     */
    List<Map<String, Object>> searchPage(String keyword, int pageNum, int pageSize) throws IOException;


    /**
     * 高亮搜索
     *
     * @param keyword  关键词
     * @param pageNum  页码
     * @param pageSize 每页条数
     */
    List<Map<String, Object>> searchPageHighlightBuilder(String keyword, int pageNum, int pageSize) throws IOException;


    /**
     * 通过ID查询单条数据
     */
    Content queryById(int id);

    /**
     * 分页查询
     *
     * @param content     筛选条件
     * @param pageRequest 分页对象
     * @return 查询结果
     */
    Page<Content> queryByPage(Content content, PageRequest pageRequest);

    /**
     * 新增数据
     *
     * @param content 实例对象
     * @return 实例对象
     */
    Content insert(Content content);

    /**
     * 修改数据
     *
     * @param content 实例对象
     * @return 实例对象
     */
    Content update(Content content);

    /**
     * 通过主键删除数据
     */
    boolean deleteById(int id);

}
