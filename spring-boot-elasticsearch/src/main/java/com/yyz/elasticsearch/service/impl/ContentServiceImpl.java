package com.yyz.elasticsearch.service.impl;

import com.alibaba.fastjson.JSON;
import com.yyz.elasticsearch.dao.ContentDao;
import com.yyz.elasticsearch.entity.Content;
import com.yyz.elasticsearch.service.ContentService;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.core.TimeValue;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.query.TermQueryBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.elasticsearch.xcontent.XContentType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * (商品)表服务实现类
 */
@Service
public class ContentServiceImpl implements ContentService {
    @Autowired
    private ContentDao contentDao;

    @Autowired
    private RestHighLevelClient restHighLevelClient;


    /**
     * 查询全部，放入到es
     */
    @Override
    public List<Content> queryAll() throws IOException {
        List<Content> contentList = contentDao.queryAll();

        BulkRequest bulkRequest = new BulkRequest();
        bulkRequest.timeout("2m");

        // 将解析到的数据放入到es中
        for (Content content : contentList) {
            bulkRequest.add(new IndexRequest("jd_goods")
                    .source(JSON.toJSONString(content), XContentType.JSON));
        }

        BulkResponse bulk = restHighLevelClient.bulk(bulkRequest, RequestOptions.DEFAULT);
        System.out.println(!bulk.hasFailures());
        return contentList;
    }

    /**
     * 实现搜索
     *
     * @param keyword  关键词
     * @param pageNum  页码
     * @param pageSize 每页条数
     */
    public List<Map<String, Object>> searchPage(String keyword, int pageNum, int pageSize) throws IOException {
        if (pageNum <= 1) {
            pageNum = 1;
        }
        // 条件搜索
        SearchRequest searchRequest = new SearchRequest("jd_goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();

        // 分页
        sourceBuilder.from(pageNum);
        sourceBuilder.size(pageSize);

        // 精准匹配
        TermQueryBuilder termQueryBuilder = QueryBuilders.termQuery("goodName", keyword);
        sourceBuilder.query(termQueryBuilder);
        sourceBuilder.timeout(new TimeValue(60, TimeUnit.SECONDS));

        // 执行搜索
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);

        // 解析结果
        ArrayList<Map<String, Object>> list = new ArrayList<>();
        for (SearchHit documentFields : searchResponse.getHits().getHits()) {
            list.add(documentFields.getSourceAsMap());
        }
        return list;
    }


    /**
     * 实现搜索高亮
     *
     * @param keyword  关键词
     * @param pageNum  页码
     * @param pageSize 每页条数
     */
    public List<Map<String, Object>> searchPageHighlightBuilder(String keyword, int pageNum, int pageSize) throws IOException {
        if (pageNum <= 1) {
            pageNum = 1;
        }
        // 条件搜索
        SearchRequest searchRequest = new SearchRequest("jd_goods");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();

        // 分页
        sourceBuilder.from(pageNum);
        sourceBuilder.size(pageSize);

        // 精准匹配
        TermQueryBuilder termQueryBuilder = QueryBuilders.termQuery("goodName", keyword);
        sourceBuilder.query(termQueryBuilder);
        sourceBuilder.timeout(new TimeValue(60, TimeUnit.SECONDS));

        // 高亮
        HighlightBuilder highlightBuilder = new HighlightBuilder();
        highlightBuilder.field("goodName");
        highlightBuilder.requireFieldMatch(false);  // 多个高亮显示
        highlightBuilder.preTags("<span style='color:red'>");
        highlightBuilder.postTags("</span>");
        sourceBuilder.highlighter(highlightBuilder);

        // 执行搜索
        searchRequest.source(sourceBuilder);
        SearchResponse searchResponse = restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);

        // 解析结果
        ArrayList<Map<String, Object>> list = new ArrayList<>();
        for (SearchHit hit : searchResponse.getHits().getHits()) {
            Map<String, HighlightField> highlightFields = hit.getHighlightFields();
            HighlightField goodName = highlightFields.get("goodName");
            Map<String, Object> sourceAsMap = hit.getSourceAsMap(); // 原来的结果
            // 解析高亮字段，将原来的字段换位高亮字段
            if (goodName != null) {
                Text[] fragments = goodName.fragments();
                String newGoodName = "";
                for (Text fragment : fragments) {
                    newGoodName += fragment;
                }
                sourceAsMap.put("goodName", newGoodName);   // 高亮字段替换原来内容
            }
            list.add(sourceAsMap);
        }
        return list;
    }


    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Content queryById(int id) {
        return this.contentDao.queryById(id);
    }

    /**
     * 分页查询
     *
     * @param content     筛选条件
     * @param pageRequest 分页对象
     * @return 查询结果
     */
    @Override
    public Page<Content> queryByPage(Content content, PageRequest pageRequest) {
        long total = this.contentDao.count(content);
        return new PageImpl<>(this.contentDao.queryAllByLimit(content, pageRequest), pageRequest, total);
    }

    /**
     * 新增数据
     *
     * @param content 实例对象
     * @return 实例对象
     */
    @Override
    public Content insert(Content content) {
        this.contentDao.insert(content);
        return content;
    }

    /**
     * 修改数据
     *
     * @param content 实例对象
     * @return 实例对象
     */
    @Override
    public Content update(Content content) {
        this.contentDao.update(content);
        return this.queryById(content.getGoodId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(int id) {
        return this.contentDao.deleteById(id) > 0;
    }
}
