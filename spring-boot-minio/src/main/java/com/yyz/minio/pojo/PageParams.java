package com.example.minio.pojo;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 分页查询的参数
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PageParams {
    /**
     * 当前页码
     */
    @ApiModelProperty(value = "页码")
    private Long pageNo = 1L;
    /**
     * 每页显示记录数
     */
    @ApiModelProperty(value = "每页显示记录数")
    private Long pageSize = 30L;

}
