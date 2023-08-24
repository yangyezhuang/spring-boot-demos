package com.example.netty.client;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;

/**
 * 客户端业务处理类
 */
public class NettyClientHandler extends SimpleChannelInboundHandler<String> {

    /**
     * 通道读取事件--读取服务端发送的消息
     *
     * @param channelHandlerContext
     * @param s
     * @throws Exception
     */
    @Override
    protected void channelRead0(ChannelHandlerContext channelHandlerContext, String s) throws Exception {
        System.out.println("客户端接受到的消息：" + s);
    }

    /**
     * 通道连接就绪事件--与服务端建立连接
     *
     * @param ctx
     * @throws Exception
     */
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        ctx.writeAndFlush("你好，我是Netty客户端");
    }
}
