package com.example.netty.client;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;

/**
 * Netty的客户端
 */
public class NettyClient {
    public static void main(String[] args) throws InterruptedException {
        // 1.创建线程组
        EventLoopGroup group = new NioEventLoopGroup(1);
        // 2.创建客户端启动助手
        Bootstrap bootstrap = new Bootstrap();
        // 3.设置线程组
        bootstrap.group(group)
                // 4.设置客户端通道实现为NIO
                .channel(NioSocketChannel.class)
                // 5.创建一个通道初始化对象
                .handler(new ChannelInitializer<SocketChannel>() {
                    @Override
                    protected void initChannel(SocketChannel socketChannel) throws Exception {
                        // 6.向pipeline中添加自定义业务处理handler
                        socketChannel.pipeline().addLast(new StringDecoder());
                        socketChannel.pipeline().addLast(new StringEncoder());
                        socketChannel.pipeline().addLast(new NettyClientHandler());
                    }
                });
        // 7.启动客户端，等待连接服务，同时将异步改为同步
        ChannelFuture channelFuture = bootstrap.connect("localhost", 8090).sync();
        // 8.关闭通道和连接池
        channelFuture.channel().closeFuture().sync();
        group.shutdownGracefully();
    }
}
