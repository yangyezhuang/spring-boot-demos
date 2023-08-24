package com.example.minio.pojo;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 媒资信息
 * </p>
 *
 * @author itcast
 */
@Data
@TableName("media_files")
public class MediaFiles implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 文件名称
     */
    private String filename;

    /**
     * 文件类型（文档，音频，视频）
     */
    private String fileType;

    /**
     * 存储目录
     */
    private String bucket;

    /**
     * 存储路径
    */
    private String filePath;

    /**
     * 媒资文件访问地址
     */
    private String url;

    /**
     * 上传时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createDate;

    /**
     * 文件大小
     */
    private Long fileSize;

}
