FROM quay.io/pypa/manylinux2014_x86_64

ARG AMDGPU_INSTALL_URL

RUN curl -SL "${AMDGPU_INSTALL_URL:?No amdgpu-install URL provided}" --output /tmp/amdgpu-install.rpm && \
    yum -y install /tmp/amdgpu-install.rpm && \
    rm /tmp/amdgpu-install.rpm && \
    yum -y install hipblas-devel rocblas-devel && \
    yum clean all && \
    rm -r /var/cache/yum
