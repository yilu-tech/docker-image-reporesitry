FROM yilutech/cloud9

COPY java/jdk8_maven3-6-3/startup java/jdk8_maven3-6-3/c9.json /

RUN sed -i "s|8|9|g" /etc/apk/repositories \
 && apk update \
 && apk add openjdk8 \
 && wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -O - | tar -xz -C /usr/local/ \
 && chmod +x /startup.sh \
 && sed -i "s|9|8|g" /etc/apk/repositories \
 && mv /root/.bashrc /root/.bash_profile \
 && echo -e "\nexport PATH=\$JAVA_HOME/bin:\$MAVEN_HOME/bin:\$PATH" >> /root/.bash_profile

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk JRE_HOME=$JAVA_HOME/jre CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib MAVEN_HOME=/usr/local/apache-maven-3.6.3

WORKDIR /apps

CMD ["/startup"]
