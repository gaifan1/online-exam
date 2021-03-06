# 在线考试系统

# 介绍
一款多角色在线考试系统，系统集成了用户管理、角色管理、部门管理、题库管理、试题管理、试题导入导出、考试管理、在线考试、错题训练等功能，考试流程完善。
项目已共享至github 链接https://github.com/gaifan1/online-exam.git

# 技术栈
SpringBoot / Shiro / Vue / MySQL

# 产品功能

## 系统完善：完善的权限控制和用户系统
权限控制：基于Shiro和JWT开发的权限控制功能。    
用户系统：用户管理、部门管理、角色管理等。    

## 多角色：多角色支持    
考试端：学生学员角色、支持在线考试、查看分数、训练错题。    
管理端：题库管理、试题管理、考试管理、用户部门管理、查看考试情况等等。    

## 定员考试：考试权限定义    
完全公开：任何人员都可以参与考试。    
指定部门：只有选中部门的人员才可以看到考试。    

## 多题型：常用题型支持    
支持题型：单选题、多选题、判断题。    
难易程度：普通、困难。    

## 便捷组卷：题库组卷    
题库组卷：指定题库、分数、数量；题目、选项随机排序、杜绝作弊    


# 环境要求
JDK 1.8+     
Mysql5.7+  

# 安装资源
1、安装JDK1.8
2、安装MySQL    

# 快速运行
1、自行安装MySQL数据库（版本最好是5.7），将`安装资源中`的`exam.sql`导入到安装好的数据库  
2、安装Java环境，要求JDK版本大于1.8  
3、请修改外置配置文件：application-local.yml 改成您自己的MySQL配置  
4、启动项目
5、如果无意外，可通过：http://localhost:8101 访问到项目了  
6、管理员账号密码：admin/admin 学员账号：person/person  老师账号：teacher/teacher

# 页面展示
![image](https://github.com/gaifan1/online-exam/blob/main/images/%E9%A6%96%E9%A1%B5.png)
![image](https://github.com/gaifan1/online-exam/blob/main/images/%E4%B8%BB%E7%95%8C%E9%9D%A2.png)
![image](https://github.com/gaifan1/online-exam/blob/main/images/%E8%80%83%E8%AF%95%E7%95%8C%E9%9D%A2.png)
![image](https://github.com/gaifan1/online-exam/blob/main/images/%E8%AF%95%E9%A2%98%E7%AE%A1%E7%90%86.png)
