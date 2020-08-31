# AIMS eReefs R scripts
[![GitHub license](https://img.shields.io/badge/license-MIT-green)](https://github.com/aims-ks/ereefs-r-scripts/blob/master/LICENSE)

Example R scripts for processing AIMS eReefs derived data with R.

***

List of notebooks:

| Description | Notebook | Source Code
| ------------- | ------------- | ------------- |
| 1. Plot AIMS eReefs data | [Notebook (HTML)](/notebooks/1-plot-aims-ereefs-data.nb.html) | [R Markdown (Rmd)](notebooks/1-plot-aims-ereefs-data.Rmd)  |

## Run scripts

You can either run the scripts in your local environment or with Docker. When running in your local environment, please
make sure to install all the dependency packages defined in the top section of each script. This step is not necessary
when using the Docker container as all dependencies are installed automatically.

### Run scripts in Docker
This project contains a `Dockerfile` which creates a [Rocker](https://www.rocker-project.org/) container for RStudio and 
installs libraries from the [geospatial](https://github.com/rocker-org/rocker-versioned2) scripts.

#### Build and start RStudio in Docker
First we need to call the build command: 
```bash
docker build --tag rstudio .
```
> ***Note***: this can take a while because the script `/rocker_scripts/install_geospatial.sh` from the image 
>installs many libraries. 

After this we can run the container with the following command:

```bash
docker run --rm --name rstudio -d -e PASSWORD=rstudioPassword -p 8787:8787 -v "/path/to/ereefs-r-scripts":/home/rstudio/projects rstudio
``` 

> ***Note***: Please replace "/path/to/ereefs-r-scripts/" with your local path to this repository.
 
Once the Docker container is running RStudio can be accessed via `http://localhost:8787` (see 
https://www.rocker-project.org for more information).

The initial login is:  
**username**: rstudio   
**password**: rstudioPassword 

After the login you can open the project `ereefs-r-scripts` which is located in the sub-folder `projects`. All changes
to the scripts in RStudio are made directly to the files on the host system as the project directory is mounted to the 
Docker container as volume.   
