FROM dclong/jupyterlab

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        r-base-dev \
    && apt-get autoremove \
    && apt-get autoclean

ADD settings/Renviron.site /etc/R/Renviron.site

# install R package dependencies
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        libxml2-dev \
        libcairo2-dev \
        libssl-dev \
        libcurl4-openssl-dev \
    && apt-get autoremove \
    && apt-get autoclean

# install IRKernel
ADD scripts /scripts
RUN Rscript /scripts/install_irkernel.r


