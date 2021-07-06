#FROM image-registry.openshift-image-registry.svc:5000/aiplatform-tekton-build/s2i-generic-data-science-notebook:v0.0.2
FROM quay.io/thoth-station/ps-cv-pytorch:v0.1.1

USER 0

RUN \
echo -e "[global]\n\
index=https://nexus.kela.fi/repository/pypi-group/pypi\n\
index-url=https://nexus.kela.fi/repository/pypi-group/simple\n\
extra-index-url=https://nexus.kela.fi/repository/pypi-group/simple" > /etc/pip.conf

#export no_proxy="nexus.kela.fi"

#ENV HTTP_PROXY=http://172.17.0.1:8888
#ENV HTTPS_PROXY=http://172.17.0.1:8888

ENV PIP_CONFIG_FILE=/etc/pip.conf
ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
#ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
ENV PARALLEL = 'False'
RUN python3 -m pip3 install --upgrade pillow==8.2.0 --verbose

USER 1000
