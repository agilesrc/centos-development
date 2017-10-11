FROM agilesrc/centos-java-maven:6-8-3

RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -

ENV GRIB_API_VERSION 1.23.1

RUN yum install -y openjpeg openjpeg-devel gcc-c++ gcc-gfortran wget make nodejs git

#example url https://software.ecmwf.int/wiki/download/attachments/3473437/grib_api-1.14.7-Source.tar.gz?api=v2
RUN cd /tmp &&  wget https://software.ecmwf.int/wiki/download/attachments/3473437/grib_api-${GRIB_API_VERSION}-Source.tar.gz \
    && cd /tmp && tar xvzf grib_api-${GRIB_API_VERSION}-Source.tar.gz && rm -f grib_api-${GRIB_API_VERSION}-Source.tar.gz \
    && cd /tmp/grib_api-${GRIB_API_VERSION}-Source && /tmp/grib_api-${GRIB_API_VERSION}-Source/configure --with-openjpeg=/usr/lib64/ \
	&& make && make check && make install && cd / && rm -rf /tmp/* && yum clean all

VOLUME /input
VOLUME /output
