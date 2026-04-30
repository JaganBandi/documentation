Dockerfile
***************************
Dockerfile : Dockerfile is a text file that contains a set of instructuions to build the docker image

Step 1:Clone one virtual machine and update vm
 
  command : yum update -y

Step 2:Install the docker server
  
  create one file
  command : vim docker-setup.sh

  insert docker script and installing the docker 

Step 3:Check the docker is installed or not

 command : docker --version

Step 4:Goto the /opt directory

 command : cd /opt

Step 5:Create one directory
 
 command : mkdir dir-name

 example : mkdir jenkins

Step 6:Enter into created directory and create one docker file

 command : vim Dockerfile

 Here,file name starting is Capital and without spaces,just asingle word (Dockerfile)

 open the 'Dockerfile' insert key

 example :
# -------------------------------
# Base Image
# -------------------------------
FROM almalinux:9

# -------------------------------
# Install Required Packages
# -------------------------------
RUN dnf update -y && \
    dnf install -y \
        sudo \
        vim \
        wget \
        tar \
        make \
        unzip \
        git \
        fontconfig \
        java-21-openjdk-devel \
    && dnf clean all

# -------------------------------
# Add Jenkins Repository
# -------------------------------
RUN wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/rpm-stable/jenkins.repo && \
    rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2023.key

# -------------------------------
# Install Jenkins
# -------------------------------
RUN dnf install -y jenkins && \
    dnf clean all

# -------------------------------
# Expose Jenkins Port
# -------------------------------
EXPOSE 8080

# -------------------------------
# Set Jenkins Home
# -------------------------------
ENV JENKINS_HOME=/var/lib/jenkins

# -------------------------------
# Start Jenkins (Without systemctl)
# -------------------------------
CMD ["/usr/bin/java", "-jar", "/usr/share/java/jenkins.war"]


Step 7 : give the file permissions to the file

 command : chmod 644 Dockerfile

Step 8 : After give the file permissions ,to build the docker image

 command : docker build -t jenkins .

 this command is used to build a Docker image from the Docker file in the current directory

 Step 9 : After complete the docker image build ,verify the images

 command : docker images 

 Step 10: Create and run the continer with Dockerfile image

 command :docker run -itd jenkins:latest /bin/bash

