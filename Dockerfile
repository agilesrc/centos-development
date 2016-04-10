FROM agilesrc/centos-java-maven

#https://software.ecmwf.int/wiki/download/attachments/3473437/grib_api-1.14.7-Source.tar.gz?api=v2
RUN yum install -y epel-release && \
	yum install -y gcc-c++ gcc-gfortran libgfortran make && yum clean all
