FROM yilutech/cloud9:node-6

COPY java/ubuntu-jdk8_maven3-6-3/settings.xml /

RUN apt-get update \
 && apt-get install -y openjdk-8-jdk git openssh-client \
 && wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -O - | tar -xz -C /usr/local/ \
 && mv -f /settings.xml /usr/local/apache-maven-3.6.3/conf/settings.xml

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/bin MAVEN_HOME=/usr/local/apache-maven-3.6.3
ENV JRE_HOME=$JAVA_HOME/jre
ENV CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin

