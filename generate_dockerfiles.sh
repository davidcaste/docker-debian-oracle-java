#!/bin/bash

set -o pipefail -e

JRE_TEMPLATE="Dockerfile.jre.tpl"
JDK_TEMPLATE="Dockerfile.jdk.tpl"

declare -a JAVA_VERSIONS=( ["7"]="7.80.15" ["8"]="8.74.02" )
declare -A JAVA_JCE_URLS=( ["7"]="http://download.oracle.com/otn-pub/java/jce/7/UnlimitedJCEPolicyJDK7.zip" ["8"]="http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" )

for VERSION in ${!JAVA_VERSIONS[@]}; do
  JVM_VERSION=$(echo ${JAVA_VERSIONS["$VERSION"]})
  JCE_URL=$(echo ${JAVA_JCE_URLS["$VERSION"]})

  JVM_MAJOR=$(echo ${JVM_VERSION} | cut -d. -f1)
  JVM_MINOR=$(echo ${JVM_VERSION} | cut -d. -f2)
  JVM_BUILD=$(echo ${JVM_VERSION} | cut -d. -f3)

  echo -en "Generating Dockerfile for ${JVM_MAJOR}u${JVM_MINOR}-b${JVM_BUILD} JRE.. "
  sed "s|%JVM_MAJOR%|$JVM_MAJOR|g;s|%JVM_MINOR%|$JVM_MINOR|g;s|%JVM_BUILD%|$JVM_BUILD|g;s|%JVM_PACKAGE%|server-jre|g;s|%JCE_URL%|$JCE_URL|g" $JRE_TEMPLATE > $JVM_MAJOR/jre/Dockerfile && \
    echo "done" || \
    echo "failed"

  echo -en "Generating Dockerfile for ${JVM_MAJOR}u${JVM_MINOR}-b${JVM_BUILD} JDK.. "
  sed "s|%JVM_MAJOR%|$JVM_MAJOR|g;s|%JVM_MINOR%|$JVM_MINOR|g;s|%JVM_BUILD%|$JVM_BUILD|g;s|%JVM_PACKAGE%|jdk|g;s|%JCE_URL%|$JCE_URL|g" $JDK_TEMPLATE > $JVM_MAJOR/jdk/Dockerfile && \
    echo "done" || \
    echo "failed"
done
