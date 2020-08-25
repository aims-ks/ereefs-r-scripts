FROM rocker/rstudio:4.0.0

RUN install2.r BiocManager
RUN /rocker_scripts/install_geospatial.sh
