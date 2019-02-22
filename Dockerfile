FROM ubuntu:16.04

WORKDIR /opt

#### java ####
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install -y curl git unzip oracle-java8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#### node ####
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

### yarn ###
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

#### android ####
# 32-bit compatibility libraries needed for android
RUN apt-get install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1
RUN curl -O https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
RUN unzip -q sdk-tools* -d android-sdk
ENV ANDROID_HOME /opt/android-sdk
COPY licenses $ANDROID_HOME/licenses

#### ruby & fastlane ####
RUN add-apt-repository -y ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -y ruby2.4 ruby2.4-dev g++ make
RUN gem install fastlane -NV
ENV LANG en_US.UTF-8

RUN yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses