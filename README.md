# centos-development

This is a simple image that has java, maven, c++, make and some other build tools. 
It also has the following mapped drives

/source  - from the centos-java-maven image, this should point to local source code
/M2_HOME - from the centos-java-maven image, this should point to the local .m2 folder if maven is going to be used

Example of usage with maven (see. dmvn)

```
docker run -it --rm -v `pwd`:/source -v ~/.m2:/M2_HOME agilesrc/centos-development mvn -f /source/pom.xml $*
```