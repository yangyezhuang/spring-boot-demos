package com.yyz.elasticsearch;

import com.alibaba.fastjson.JSON;
import com.yyz.elasticsearch.entity.User;
import org.elasticsearch.action.admin.indices.delete.DeleteIndexRequest;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.support.master.AcknowledgedResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.CreateIndexResponse;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.core.TimeValue;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.query.TermQueryBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.FetchSourceContext;
import org.elasticsearch.xcontent.XContentType;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

/**
 * ES7.6.1 高级客户端API测试
 */
@SpringBootTest
class ElasticsearchApplicationTests {

    @Autowired
    @Qualifier("restHighLevelClient")
    private RestHighLevelClient client;

    /**
     * 测试创建索引
     */
    @Test
    void testCreateIndex() throws IOException {
        // 1. 创建索引请求
        CreateIndexRequest request = new CreateIndexRequest("test_index");
        // 2. 客户端执行请求 indices, 请求后获得响应
        CreateIndexResponse createIndexResponse = client.indices().create(request, RequestOptions.DEFAULT);
        System.out.println(createIndexResponse);
    }

    /**
     * 测试获取索引，判断索引是否存在
     */
    @Test
    void testExistIndex() throws IOException {
        GetIndexRequest request = new GetIndexRequest("test_index");
        boolean exists = client.indices().exists(request, RequestOptions.DEFAULT);
        System.out.println(exists);
    }

    /**
     * 测试删除索引
     */
    @Test
    void testDeleteIndex() throws IOException {
        DeleteIndexRequest request = new DeleteIndexRequest("test_index");
        AcknowledgedResponse delete = client.indices().delete(request, RequestOptions.DEFAULT);
        System.out.println(delete.isAcknowledged());
    }

    /**
     * 测试添加文档
     */
    @Test
    void testAddDocument() throws IOException {
        // 创建对象
        User user = new User("测试3", 10);
        // 创建请求
        IndexRequest request = new IndexRequest("test_index");

        // 规则 put /test_index/_doc/1
        request.id("3");
        request.timeout(TimeValue.timeValueSeconds(1));
        request.timeout("1s");

        // 将数据放入请求 json
        request.source(JSON.toJSONString(user), XContentType.JSON);

        // 客户端发送请求，获取响应结果
        IndexResponse indexResponse = client.index(request, RequestOptions.DEFAULT);

        System.out.println(indexResponse.toString());
        System.out.println(indexResponse.status());
    }

    /**
     * 判断文档是否存在
     */
    @Test
    void testIsExistDocument() throws IOException {
        GetRequest getRequest = new GetRequest("test_index", "1");
        // 不获取返回的_source的上下文
        getRequest.fetchSourceContext(new FetchSourceContext(false));
        getRequest.storedFields("_none_");
        // 判断是否存在
        boolean exists = client.exists(getRequest, RequestOptions.DEFAULT);
        System.out.println(exists);
    }

    /**
     * 获取文档信息
     */
    @Test
    void testGetDocument() throws IOException {
        GetRequest getRequest = new GetRequest("test_index", "1");
        GetResponse response = client.get(getRequest, RequestOptions.DEFAULT);
        // 打印文档内容
        System.out.println(response.getSourceAsString());
        System.out.println(response);   // 打印全部内容
    }

    /**
     * 更新文档信息
     */
    @Test
    void testUpdateDocument() throws IOException {
        UpdateRequest request = new UpdateRequest("test_index", "1");
        request.timeout("1s");

        User user = new User("测试1", 44);
        request.doc(JSON.toJSONString(user), XContentType.JSON);

        UpdateResponse response = client.update(request, RequestOptions.DEFAULT);
        // 打印文档内容
        System.out.println(response);
    }

    /**
     * 删除文档信息
     */
    @Test
    void testDeleteDocument() throws IOException {
        DeleteRequest request = new DeleteRequest("test_index", "3");
        request.timeout("1s");

        DeleteResponse response = client.delete(request, RequestOptions.DEFAULT);
        // 打印文档内容
        System.out.println(response);
    }

    /**
     * 批量插入数据
     */
    @Test
    void testBulkAddDocument() throws IOException {

        BulkRequest bulkRequest = new BulkRequest();
        bulkRequest.timeout("10s");

        ArrayList<User> userList = new ArrayList<>();
        for (int i = 20; i < 25; i++) {
            // 创建对象
            userList.add(new User("test" + i, i));
        }

        // 批处理请求
        for (int i = 0; i < userList.size(); i++) {
            // 批量更新，删除在这里修改对应请求即可
            bulkRequest.add(
                    new IndexRequest("test_index")
                            .id(String.valueOf(i + 1))
                            .source(JSON.toJSONString(userList.get(i)), XContentType.JSON)
            );
        }
        BulkResponse bulkResponse = client.bulk(bulkRequest, RequestOptions.DEFAULT);

        System.out.println(bulkResponse.hasFailures()); // 是否失败
    }

    /**
     * 查询
     * SearchRequest 搜索请求
     * SearchSourceBuilder 条件构造
     * HighlightBuilder 构建高亮
     * TermQueryBuilder 精确查询
     * MatchAllQueryBuilder 全部查询
     */
    @Test
    void testSearch() throws IOException {
        SearchRequest request = new SearchRequest("test_index");
        // 构建搜索条件
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        // 查询条件，使用QueryBuilders工具类快速实现
        // QueryBuilders.termQuery 精确匹配
        // QueryBuilders.matchAllQuery 查询所有
        TermQueryBuilder termQueryBuilder = QueryBuilders.termQuery("name", "test20");
        // MatchAllQueryBuilder matchAllQueryBuilder = QueryBuilders.matchAllQuery();

        sourceBuilder.query(termQueryBuilder);
        sourceBuilder.timeout(new TimeValue(60, TimeUnit.SECONDS));

        request.source(sourceBuilder);

        SearchResponse searchResponse = client.search(request, RequestOptions.DEFAULT);
        System.out.println(JSON.toJSONString(searchResponse.getHits()));
        System.out.println("===============================");
        for (SearchHit documentFields : searchResponse.getHits().getHits()) {
            System.out.println(documentFields.getSourceAsMap());
        }
    }
}
