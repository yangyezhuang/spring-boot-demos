package com.yyz.elasticsearch.controller;

import com.yyz.elasticsearch.entity.Content;
import com.yyz.elasticsearch.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * (商品)表控制层
 */
@RestController
@RequestMapping("good")
public class ContentController {

    @Autowired
    private ContentService contentService;

    /**
     * 将数据写入es
     */
    @GetMapping("/clone")
    public ResponseEntity<List<Content>> queryAll() throws IOException {
        return ResponseEntity.ok(contentService.queryAll());
    }


    /**
     * 搜索
     */
    @GetMapping("/search/{keyword}/{pageNum}/{pageSize}")
    public List<Map<String, Object>> search(@PathVariable("keyword") String keyword, @PathVariable("pageNum") int pageNum,
                                            @PathVariable("pageSize") int pageSize) throws IOException {

        return contentService.searchPageHighlightBuilder(keyword, pageNum, pageSize);
    }

    /**
     * 分页查询
     *
     * @param content     筛选条件
     * @param pageRequest 分页对象
     * @return 查询结果
     */
    @GetMapping
    public ResponseEntity<Page<Content>> queryByPage(Content content, PageRequest pageRequest) {
        return ResponseEntity.ok(this.contentService.queryByPage(content, pageRequest));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public ResponseEntity<Content> queryById(@PathVariable("id") int id) {
        return ResponseEntity.ok(this.contentService.queryById(id));
    }

    /**
     * 新增数据
     *
     * @param content 实体
     * @return 新增结果
     */
    @PostMapping
    public ResponseEntity<Content> add(Content content) {
        return ResponseEntity.ok(this.contentService.insert(content));
    }

    /**
     * 编辑数据
     *
     * @param content 实体
     * @return 编辑结果
     */
    @PutMapping
    public ResponseEntity<Content> edit(Content content) {
        return ResponseEntity.ok(this.contentService.update(content));
    }

    /**
     * 删除数据
     *
     * @param id 主键
     * @return 删除是否成功
     */
    @DeleteMapping
    public ResponseEntity<Boolean> deleteById(int id) {
        return ResponseEntity.ok(this.contentService.deleteById(id));
    }

}

