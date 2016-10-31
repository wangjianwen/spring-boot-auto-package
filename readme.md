# 概述
本例子演示了如何自动打包基于spring-boot项目。
# 项目结构
example 一个hello-world级别的例子，在执行mvn clean install命令后，在该项目下会有一个example-1.1-SNAPSHOT.zip文件，该文件解压后，执行start.bat或start.sh可直接运行。
my-assembly-descriptor 定义一个共享的assembly插件，在src/resources/assemblies/my-assembly.xml文件中定义了如何打包
server 定义了spring-boot的启动类，其启动脚本
starter 该项目将被自动打成pom, 基于spring-boot的项目需要把parent定义为starter,就可以实现自动打包的功能