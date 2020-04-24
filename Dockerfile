# Stage I: Development Image ===================================================

# Step 1: Begin using the openjdk image with the JDK 14 on Debian Buster variation:
FROM openjdk:14-jdk-buster AS development

# Step 2: Define the working directory: 
WORKDIR /usr/src

# Step 3: Define the HOME path:
ENV HOME=/usr/src

# Definir la version de Gradle
ENV GRADLE_VERSION=6.3 GRADLE_USER_HOME=/usr/local/gradle

# Add Gradle executable s to PATH:
ENV PATH=/opt/gradle/gradle-${GRADLE_VERSION}/bin:${PATH}

# Step 7: Install the configured Gradle version:
RUN curl -L -o "gradle-${GRADLE_VERSION}-bin.zip" \
  "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
 && mkdir -p /opt/gradle /usr/local/gradle \
 && unzip -d /opt/gradle gradle-${GRADLE_VERSION}-bin.zip \
 && rm -rf "gradle-${GRADLE_VERSION}-bin.zip"

# Step : Define default command:
CMD [ "gradle", "bootRun" ]

# ==============================================================================

FROM development AS testing

COPY . /usr/src

CMD [ "gradle", "test" ]

# ==============================================================================