# Gradle Java Hello World

## Requirement
* Have maven and gradle in same project

## Maven Command
```
mvn archetype:generate -DgroupId=gradle.java.hello.world -DartifactId=gradle-java-hello-world -Dversion=1.0 -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
```

## Gradle Command
```
gradle init --type pom
```

## Steps
* Dependencies - Refer [pom.xml](pom.xml) or [build.gradle](build.gradle)

## Compile With Maven
```
mvn clean compile
```

## Compile With Gradle
```
gradlew clean compileJava
```