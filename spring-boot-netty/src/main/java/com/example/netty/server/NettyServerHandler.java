package com.example.netty.server;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;

/**
 * 服务端业务处理类
 */
public class NettyServerHandler extends SimpleChannelInboundHandler<String> {

    /**
     * 通道读取就绪事件--接受客户端请求
     *
     * @param channelHandlerContext
     * @param s
     * @throws Exception
     */
    @Override
    protected void channelRead0(ChannelHandlerContext channelHandlerContext, String s) throws Exception {
        System.out.println("服务端接受到的消息：" + s);
    }

    /**
     * 通道读取完毕事件--给客户端响应
     *
     * @param ctx
     * @throws Exception
     */
    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
        ctx.writeAndFlush("你好，我是Netty服务端");
    }
}
