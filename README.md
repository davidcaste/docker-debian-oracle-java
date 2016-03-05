# Yet another Debian Docker image with Oracle Java

[![Build Status](https://travis-ci.org/davidcaste/docker-debian-oracle-java.svg?branch=master)](https://travis-ci.org/davidcaste/docker-debian-oracle-java)

[![](https://badge.imagelayers.io/davidcaste/debian-oracle-java:latest.svg)](https://imagelayers.io/?images=davidcaste/debian-oracle-java:latest)

Basic [Docker](https://www.docker.com/) image to run [Java](https://www.java.com/) applications.
This image is based on [Debian](http://www.debian.org/) Jessie. Includes Bash, since many Java applications like to have convoluted Bash start-up scripts.

Based on [`anapsix/alpine-java`](https://hub.docker.com/r/anapsix/alpine-java/) Docker image (thanks [anapsix](https://github.com/anapsix)!!).

### Versions

**JRE8/JDK8 Version**: `8u74-b02`  
**JRE7/JDK7 Version**: `7u80-b15`

### Tags

| Java version      | tags                    | Size                                                                                                                                          |
|:------------------|:------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------|
| Oracle Java 8 JRE | latest / 8 / jre / jre8 | [![](https://badge.imagelayers.io/davidcaste/debian-oracle-java:jre8.svg)](https://imagelayers.io/?images=davidcaste/debian-oracle-java:jre8) |
| Oracle Java 8 JDK | jdk / jdk8              | [![](https://badge.imagelayers.io/davidcaste/debian-oracle-java:jdk8.svg)](https://imagelayers.io/?images=davidcaste/debian-oracle-java:jdk8) |
| Oracle Java 7 JRE | 7 / jre7                | [![](https://badge.imagelayers.io/davidcaste/debian-oracle-java:jre8.svg)](https://imagelayers.io/?images=davidcaste/debian-oracle-java:jre7) |
| Oracle Java 7 JDK | jdk7                    | [![](https://badge.imagelayers.io/davidcaste/debian-oracle-java:jdk7.svg)](https://imagelayers.io/?images=davidcaste/debian-oracle-java:jdk7) |


### Usage

Example:

    docker run -it --rm davidcaste/debian-oracle-java java -version
