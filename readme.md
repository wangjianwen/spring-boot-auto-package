# 概述
本例子演示了如何自动打包基于spring-boot项目。
# 项目结构
- assembly 定义一个共享的assembly插件，在src/resources/assemblies/assembly.xml文件中定义了如何打包

- server 定义了spring-boot的启动类，其启动脚本

- starter 该项目将被自动打成pom, 基于spring-boot的项目需要把parent定义为starter,就可以实现自动打包的功能

# 使用示例

新建一个spring-boot工程，项目结构如下：
example

        src
        
           main 
           
             java
             
                 com.youyou.example
                 
                            HelloWorldController.java
                            
        pom.xml
        
 其中pom.xml的内容如下：
 
 ```xml
     <!-- parent指向starter -->
     <parent>
         <groupId>com.youyou.example</groupId>
         <artifactId>starter</artifactId>
         <version>1.1-SNAPSHOT</version>
     </parent>
 
     <groupId>com.youyou.example</groupId>
     <artifactId>auto-package</artifactId>
     <version>1.0-SNAPSHOT</version>
 
     <build>
         <plugins>
             <!-- 引用在starter中申明的maven-dependency-plugin -->
             <plugin>
                <artifactId>maven-dependency-plugin</artifactId>
                </plugin>
             <!-- 引用在starter中申明的maven-assembly-plugin -->
             <plugin>
                 <artifactId>maven-assembly-plugin</artifactId>
             </plugin>
         </plugins>
     </build>
 ```
 
 
 其中 HelloWorldController的代码如下：
 
 ```java
    package com.youyou.example;
    
    
    import org.springframework.stereotype.Controller;
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.ResponseBody;
    
    @Controller
    public class HelloWorldContorller {
    
        @RequestMapping("/hello")
        @ResponseBody
        public String helloWorld(){
            return "hello world";
        }
    }

 ```
 
 运行mvn clean install
 在target下将生成auto-package-1.0-SNAPSHOT.zip文件，解压，该文件，运行start.bat或start.sh，即启动web应用程序