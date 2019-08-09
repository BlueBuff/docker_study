FROM tomcat
MAINTAINER "HDG huangxiaojun <1010060164@qq.com>"

ENV APP_NAME dockerstudy

#替换tomcat配置文件
COPY ./config/tomcat/conf/*.xml /usr/local/tomcat/conf/
#将构建的项目添加到docker镜像内
COPY ./target/$APP_NAME /usr/local/tomcat/$APP_NAME/ROOT
#替换配置文件
COPY ./config/resources/* /usr/local/tomcat/$APP_NAME/ROOT/WEB-INF/classes/