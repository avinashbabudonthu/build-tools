# Maven Notes

## Maven dependency scopes
* compile
	* This is maven default scope
	* Dependencies with compile scope are needed to build, test, and run the project
```
<dependencies>
    <dependency>
        <groupId>log4j</groupId>
        <artifactId>log4j</artifactId>
        <version>1.2.14</version>
        <!-- You can ommit this because it is default -->
        <scope>compile</scope>
    </dependency>
</dependencies>
```

* provided
	* Maven dependency scope provided is used during build and test the project
	* They are also required to run, but should not exported, because the dependency will be provided by the runtime, for instance, by servlet container or application server
```
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>servlet-api</artifactId>
    <version>3.0.1</version>
    <scope>provided</scope>
</dependency>
```
* runtime
	* Dependencies with maven dependency scope runtime are not needed to build, but are part of the classpath to test and run the project
```
<dependency>
    <groupId>com.thoughtworks.xstream</groupId>
    <artifactId>xstream</artifactId>
    <version>1.4.4</version>
    <scope>runtime</scope>
 </dependency>
```
* test
	* Dependencies with maven dependency scope test are not needed to build and run the project
	* They are needed to compile and run the unit tests
```
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.12</version>
    <scope>test</scope>
</dependency>
```
* system
	* Dependencies with system are similar to ones with scope provided. 
	* The only difference is system dependencies are not retrieved from remote repository.
	* They are present under project’s subdirectory and are referred from there
```
<dependency>
  <groupId>extDependency</groupId>
  <artifactId>extDependency</artifactId>
  <scope>system</scope>
  <version>1.0</version>
  <systemPath>${basedir}\war\WEB-INF\lib\extDependency.jar</systemPath>
</dependency>
```
* import
	* import scope is only supported on a dependency of type pom in the dependencyManagement section. 
	* It indicates the dependency to be replaced with the effective list of dependencies in the specified POM’s dependencyManagement section
```
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>other.pom.group.id</groupId>
            <artifactId>other-pom-artifact-id</artifactId>
            <version>SNAPSHOT</version>
            <scope>import</scope>
            <type>pom</type>
        </dependency>   
    </dependencies>
</dependencyManagement>
```
* Maven dependency transitivity resolution
	* When you include a maven dependency and it has it’s own other dependencies (i.e. transitive dependencies) then you may want to be clear about the scope of these transitive dependencies as well
	* First column - scope of dependency, scope of transitive dependency at the top row

Dependency            | compile   		| provided  	  | runtime   		| test
--------------------  | --------------- | --------------- | --------------- | ---------------
compile				  | compile			| 	 			  | runtime			| 
provided			  | provided		| 	 			  | provided		| 
runtime				  | runtime			| 	 			  | runtime			| 
test				  | test			| 	 			  | test			|

## Maven Pull from remote repository - repositories tag
```
<repositories>
    <repository>
        <id>browserid-snapshots</id>
        <name>browserid-snapshots</name>
        <url>https://oss.sonatype.org/content/repositories/snapshots/</url>
    </repository>
</repositories>
```

## Maven Push to remote repository - distributionManagement tag
```
<distributionManagement>
    <repository>
      <id>operative-releases</id>
      <name>Operative Releases Repository</name>
      <url>${operative.nexus}/repositories/operative-releases</url>
    </repository>
    <snapshotRepository>
      <id>operative-snapshots</id>
      <name>Operative Snapshots Repository</name>
      <url>${operative.nexus}/repositories/operative-snapshots</url>
    </snapshotRepository>
    <site>
      <id>operative-mavensite</id>
      <name>Operative Maven WebSite</name>
      <url>operative-global</url>
    </site>
  </distributionManagement>
```

## Maven Spring Boot Plugin
```
<plugin>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-maven-plugin</artifactId>
</plugin>
```

## Maven Executive Exec Plugin
* Add `exec-maven-plugin` plugin under `build/plugins` in `pom.xml`
* Configure full packaged class name of main class in the plugin
* Execute main program using command: `mvn exec:java`
```
<plugin>
	<groupId>org.codehaus.mojo</groupId>
	<artifactId>exec-maven-plugin</artifactId>
	<version>1.6.0</version>
	<configuration>
	  <mainClass>com.test.MainAppClassName</mainClass>
	  <executable>java</executable>
	  <arguments>
		<argument>-Xms1024M</argument>
		<argument>-Xmx1024M</argument>
		<argument>-cp</argument>
		<classpath/>
	  </arguments>
	</configuration>
 </plugin>
```