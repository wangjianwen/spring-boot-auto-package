# 概述
本例子演示了如何自动打包基于spring-boot项目。
# 项目结构
- assembly 定义一个共享的assembly插件，在src/resources/assemblies/assembly.xml文件中定义了如何打包

- server 定义了spring-boot的启动类，其启动脚本

- starter 该项目将被自动打成pom, 基于spring-boot的项目需要把parent定义为starter,就可以实现自动打包的功能