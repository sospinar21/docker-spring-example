FROM openjdk:14-jdk-buster

WORKDIR /usr/src

ENV HOME=/usr/src

ENV GRAFLE_VERSION=6.3 GRADLE_USER_HOME=/usr/local/gradle

ENV PATH=/opt/gradle/gradle-${GRADLE_VERSION}/bin:${PATH}

# Step 7: Install the configured Gradle version:
RUN curl -L -o "gradle-${GRADLE_VERSION}-bin.zip" \
  "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
 && mkdir -p /opt/gradle /usr/local/gradle \
 && unzip -d /opt/gradle gradle-${GRADLE_VERSION}-bin.zip \
 && rm -rf "gradle-${GRADLE_VERSION}-bin.zip"