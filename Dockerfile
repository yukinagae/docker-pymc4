FROM jupyter/datascience-notebook
MAINTAINER yuki.nagae1130@gmail.com

WORKDIR /home/jovyan/work

USER root

# Add permanent apt-get installs and other root commands here
# e.g., RUN apt-get install npm nodejs
RUN apt-get update && apt-get -y upgrade

USER jovyan

# Add permanent pip/conda installs, data files, other user libs here
# e.g., RUN pip install jupyter_dashboards
ADD requirements.txt .
RUN pip install --upgrade pip
RUN pip install --requirement requirements.txt

RUN pip install --user git+https://github.com/pymc-devs/pymc4.git#egg=pymc4
RUN pip install git+https://github.com/arviz-devs/arviz.git

EXPOSE 8888
CMD start-notebook.sh --NotebookApp.token=''
