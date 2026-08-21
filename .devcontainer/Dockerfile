# select python base container environment to use
FROM python:3.13

# set a user to run the dev container code in and correct
# map uid/gid into when using container
ARG USERNAME
ENV USERNAME=$USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -s "/usr/bin/bash" \
    # Install additional needed os packages here
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo nvtop \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Enable contrib component in debian apt sources so we can install nvtop
# and other packages
RUN sed -i 's/Components: main/Components: main contrib/g' /etc/apt/sources.list.d/debian.sources


# setup the user python environment and install needed packages
# from the requirements file
#USER $USERNAME

# create and manage default virtual environment for assignment work
ARG PYTHON_ENV
ENV PYTHON_ENV=$PYTHON_ENV

# setup default environment
RUN mkdir requirements
COPY requirements.txt set_python_env.sh /requirements/
RUN bash ./requirements/set_python_env.sh $PYTHON_ENV $USERNAME

# set PYTHONPATH in environment
ARG CONTAINER_WORKSPACE_FOLDER
ENV PYTHONPATH=${CONTAINER_WORKSPACE_FOLDER}/src

