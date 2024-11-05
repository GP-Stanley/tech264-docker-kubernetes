
- [Install Docker Desktop on your local machine](#install-docker-desktop-on-your-local-machine)
  - [Installing Docker Desktop](#installing-docker-desktop)
  - [Verify Docker Installation](#verify-docker-installation)
  - [Check Docker Desktop Status](#check-docker-desktop-status)
  - [Create Docker Hub Account \& Log in](#create-docker-hub-account--log-in)
- [Differences between virtualisation and containerisation](#differences-between-virtualisation-and-containerisation)
  - [Virtualisation vs. Containerisation](#virtualisation-vs-containerisation)
  - [Virtualisation](#virtualisation)
    - [Benefits](#benefits)
  - [Containerisation](#containerisation)
    - [Benefits](#benefits-1)
  - [Key Differences](#key-differences)
    - [Comparison Table: Virtualisation vs. Containerisation](#comparison-table-virtualisation-vs-containerisation)
- [History of Running Software: Traditional, Virtualisation, and Containerisation](#history-of-running-software-traditional-virtualisation-and-containerisation)
  - [Traditional Deployment](#traditional-deployment)
  - [Virtualisation](#virtualisation-1)
  - [Containerisation](#containerisation-1)
  - [When to choose?](#when-to-choose)
- [Microservices](#microservices)
  - [What Are Microservices?](#what-are-microservices)
  - [How Are They Made Possible?](#how-are-they-made-possible)
    - [Benefits of Microservices](#benefits-of-microservices)
- [Docker](#docker)
  - [What Is Docker?](#what-is-docker)
  - [Alternatives to Docker](#alternatives-to-docker)
    - [How Docker Works (Docker Architecture/API)](#how-docker-works-docker-architectureapi)
  - [Success Story Using Docker](#success-story-using-docker)
    - [Concepts](#concepts)
- [How Docker Works](#how-docker-works)
  - [Docker Host](#docker-host)
  - [Docker CLI (Client)](#docker-cli-client)
  - [Docker Hub (Registry)](#docker-hub-registry)
  - [Running Containers](#running-containers)
  - [Pulling Images Manually](#pulling-images-manually)
- [Tuesday Code-Along, 05/11](#tuesday-code-along-0511)
- [Change a container from the inside](#change-a-container-from-the-inside)
- [Push host-custom-static-webpage container image to Docker Hub](#push-host-custom-static-webpage-container-image-to-docker-hub)
  - [Step 1: Commit the Running Container as an Image](#step-1-commit-the-running-container-as-an-image)
  - [Step 2: Log in to Docker Hub](#step-2-log-in-to-docker-hub)
  - [Step 3: Push the Image to Docker Hub](#step-3-push-the-image-to-docker-hub)
  - [Step 4: Test the Image from Docker Hub](#step-4-test-the-image-from-docker-hub)
  - [Step 5: Test on the Browser](#step-5-test-on-the-browser)
- [Automate docker image creation using a Dockerfile](#automate-docker-image-creation-using-a-dockerfile)
  - [Step 1: Set Up the Folder Structure](#step-1-set-up-the-folder-structure)
    - [Alternative: Using Visual Studio Code](#alternative-using-visual-studio-code)
  - [Step 2: Write the Dockerfile](#step-2-write-the-dockerfile)
  - [Step 3: Build the Custom Docker Image](#step-3-build-the-custom-docker-image)
  - [Step 4: Run the Container](#step-4-run-the-container)
  - [Step 5: Push the Image to Docker Hub](#step-5-push-the-image-to-docker-hub)
  - [Step 6: Run Command](#step-6-run-command)
  - [Check your browser!](#check-your-browser)


# Install Docker Desktop on your local machine

Once installed:
* In a terminal window, run docker --version, and paste the output in the chat. From v20 onwards is fine.
* Run Docker Desktop application and check the bottom left for the status.

:information_source: Note:

* Status should be green and the newer versions also state "Engine running".
* If the status is not green, you will need to troubleshoot to get it running.

:warning: Warning! When starting Docker Desktop in Windows, you will likely need to choose to "Run as Administrator". If you don't, you will get an error.

* Create an account on Docker Hub. Doesn't matter the OS you are using on your local machine.
* In Docker Desktop, login using the account you created on Docker Hub.

<br>

## Installing Docker Desktop
Source: https://docs.docker.com/desktop/install/windows-install/
* Follow the installation prompts. On Windows, you may need to allow permissions and select "Run as Administrator."

![install](./dk-images/install.png)
![unpacking](./dk-images/unpacking.png)

## Verify Docker Installation
* Once Docker Desktop is installed, open a terminal (Command Prompt, PowerShell, or your OS's terminal).
* Open a fresh Git Bash terminal. 
* Run the following command: `docker --version`
* This should display Docker’s version number. Look for a version from 20 onwards.

```bash
Docker version 27.2.0, build 3ab4256
```

* It will ask to restart your desktop.

![alt text](./dk-images/restart.png)

## Check Docker Desktop Status
* Launch Docker Desktop (view in downloads).
* Look at the bottom left corner for Docker’s status indicator.
  * A green status and “Engine running” text indicate that Docker is functioning properly.

![running](./dk-images/running.png)

* If you see a different status, troubleshoot using Docker’s support resources or ensure Docker Desktop has the necessary permissions to run.

## Create Docker Hub Account & Log in
* Go to Docker Hub and create an account if you haven’t already.
* My username: gina98
* Open Docker Desktop and log in with the Docker Hub account credentials.

<br>

# Differences between virtualisation and containerisation

![vvsc](./dk-images/vvsc.png)
Source: https://www.bmc.com/blogs/containers-vs-virtual-machines/

<br>

## Virtualisation vs. Containerisation
Virtualisation and containerisation are both ways to create isolated environments for running applications, but they differ in their approach and structure.

## Virtualisation
**How It Works**
* In virtualisation, a physical machine runs a hypervisor, which is software that creates multiple virtual machines (VMs). 
* Each VM has its own operating system and resources.

**What's in a VM?**
* Each virtual machine includes a full OS, libraries, dependencies, and the application itself.

![virt-arch](./dk-images/virt-arch.png)

Source: https://www.researchgate.net/figure/Generic-Virtualization-Architecture-based-on-56_fig3_366198104

### Benefits
* **Isolation**: VMs are fully isolated, which increases security and reliability.
* **Resource Allocation**: You can allocate specific CPU, memory, and storage resources to each VM.
* **Compatibility**: Each VM can run different OS's, making it flexible for various applications.

<br>

## Containerisation
**How It Works**
* Containers package up just the application code and dependencies but share the host OS kernel. 
* Instead of a hypervisor, containers use a container runtime like Docker to manage isolation.

**What's in a Container?**
* A container usually includes only the application, necessary libraries, and dependencies—no separate OS.

![cont-arch](./dk-images/cont-arch.png)

<br>

### Benefits
* **Lightweight**: Containers don’t need an entire OS, making them smaller and faster to start up.
* **Consistency**: Containers ensure that applications run the same, regardless of where they are deployed.
* **Scalability**: Containers are more efficient in terms of resource use, so you can run more containers on the same hardware compared to VMs.

## Key Differences
* **Size**: Containers are much lighter than VMs as they share the host OS kernel.
* **Startup Time**: Containers start almost instantly, whereas VMs can take several minutes.
* **Isolation**: VMs provide stronger isolation since each VM has its own OS, while containers share the host OS.

<br>

### Comparison Table: Virtualisation vs. Containerisation

| Aspect           | Virtualisation                            | Containerisation                       |
|------------------|------------------------------------------|----------------------------------------|
| **Isolation**    | Full OS per VM                           | Shared OS kernel, isolated space       |
| **Resource Usage** | Higher resource usage                  | Lower resource usage                   |
| **Startup Time** | Slower                                   | Almost instant                         |
| **Use Cases**    | Legacy applications, multiple OS types   | Microservices, cloud-native apps       |

![both-arch](./dk-images/both-arch.png)

<br>

# History of Running Software: Traditional, Virtualisation, and Containerisation

![trad,virt,cont](./dk-images/trad,virt,cont.png)

Source: https://www.linkedin.com/pulse/traditional-deployment-vs-virtualization-container-chinnayya-chintha-vmk2c/

<br>

## Traditional Deployment
* Early on, organisations ran applications on physical servers.
* Install or use an existing operating system.
* Install the tools & dependencies needed by your software.
* Run your application on it.

Cons of Traditional Deployment:
* In the issue of resource isolation, there is no way to define resource boundaries for applications in a physical server.
* Scaling issues for specific applications and long downtime.
* Over-utilisation of resources for a specific app can crash the entire physical server.
* It was expensive for organisations to maintain many physical servers.

To overcome this problem, a virtual machine was introduced.

<br>

## Virtualisation
* Virtualisation is a process where software is used to create an abstract layer. So VM's that abstract layer or software is called Hypervisor.
* Hypervisor simplify something—something that helps a virtual machine emulate a physical computer.
* Hypervisor is software responsible for creating, managing and running these virtual machines. It also manages the allocation of resources between VM's on that single physical host.
* Now each VM runs its own operating system and has its own virtual hardware, like virtual CPU, storage, etc.

Cons of Virtualisation:
* Operating system images are heavyweight; image size is in GB. 
Contain guest OS for each virtual machine. 
It is a slow-to-boot-up process.

Real-time use cases of Virtualisation:
* Diverse Operating System(o/s)
* Legacy & Isolation Applications

<br>

## Containerisation
* Docker is an **open source** platform that enables developers to build, deploy, run, update and manage containers—standardised, executable components that combine application source code with the operating system (OS) libraries and dependencies required to run that code in any environment.
* Docker container virtualise the operating system. 
  * So each individual container contains only the application and it's libraries and dependencies.
* Docker Engine is core software that's responsible for managing the life cycle of docker container and providing infrastructure for creating, runningand orchestrating containers.
* In Docker Engine, Cgroups or Control groups, is responsible for **allocating resources among the processes**, and Namespaces (n/s)  restrict container access and visibility to other resources on the system.
* Docker Images are light weight, standalone and executable packages that include everything you need to run a piece of software.
* Docker Images are built using Dockerfile, which are simple document that provide instructions to creating the image.
* Docker containers are runtime instances of images that run in docker engine. Each container is an isolated and self-sufficient environment that includes only the necessary components of running specific application and can be easily started, stopped and restarted.

Real-time use cases of Containerisation:
* Ideal for portability, scalability, and microservice architectures.
* Containers package applications with dependencies into a single unit.
* Rapid development, deployment & Resource Efficiency

When to Choose
* **Traditional Deployment**: Fine-grained control, customisation.
* **Virtualisation**: workload consolidation, resource optimisation.
* **Containerisation**: portability, scalability, lightweight deployment.

<br>

## When to choose?

![choices](./dk-images/choices.png)

Source: https://blog.bytebytego.com/p/virtualization-and-containerization

<br>

# Microservices
* Microservices are an architectural style where applications are broken down into small, independent services that each handle a specific function.

## What Are Microservices?
* Microservices are an architectural style where applications are broken down into small, independent services that each handle a specific function.
* Microservices are small, self-contained services that communicate with each other through APIs.
* Each microservice is responsible for a specific function, like user authentication, payment processing, or inventory management.

## How Are They Made Possible?
* Microservices are enabled by containerisation tools like Docker, which allow each service to be isolated and packaged separately.
* Docker containers encapsulate the application code, libraries, and dependencies, ensuring that each microservice runs consistently across different environments. 
* Communication between microservices is typically handled by APIs, making it easier to scale and update parts of an application without affecting others.

### Benefits of Microservices
* **Scalability**: You can scale individual services based on demand, without affecting other parts of the application.
* **Flexibility**: Different microservices can be written in different languages or use different frameworks.
* **Resilience**: If one microservice fails, it doesn’t bring down the entire application.

![microservices](./dk-images/microservices.png)
![micro,eg](./dk-images/micro,eg.png)

<br>

# Docker
* Docker is a popular platform for developing, shipping, and running applications in containers. 
* It automates the deployment of applications by packaging them with everything they need to run.

## What Is Docker?
* Docker is a containerisation tool that simplifies application development by creating lightweight, isolated environments.
* It provides a standardised way to build, share, and run containers, making it easier to work across different environments (e.g., development, testing, production).

## Alternatives to Docker
* **Kubernetes**: A container orchestration tool that manages containers across multiple hosts. Often used with Docker.
* **Podman**: Similar to Docker but without requiring a daemon, allowing for rootless containers.
* **LXC** (Linux Containers): An older container technology, more like traditional VMs.
* **rkt** (Rocket): A container runtime developed by CoreOS, now less popular.

### How Docker Works (Docker Architecture/API)
Docker’s architecture consists of several key components:

* **Docker Engine**: The core software that runs and manages containers. It has two parts:
  * **Docker Daemon**: Runs on the host machine and manages the containers.
  * **Docker CLI**: A command-line interface to interact with Docker.
* **Docker Images**: A read-only template that defines the container. 
  * Each image is built from a Dockerfile, which specifies the OS, dependencies, and application.
* **Docker Containers**: Instances of Docker images that can be run, stopped, and removed as needed.
* **Docker Hub**: A public repository for sharing and downloading container images.

![daemon](./dk-images/daemon.png)

<br>

## Success Story Using Docker
Example: Spotify

* **Challenge**: Spotify needed to scale its application to millions of users across many devices while maintaining high reliability and quick feature delivery.
* **Solution with Docker**: Spotify adopted Docker for its microservices architecture, using it to package each service independently. 
  * This allowed the team to release updates frequently without disrupting the user experience.
* **Outcome**: Docker helped Spotify reduce deployment times, maintain consistency across environments, and scale its services efficiently to handle global traffic.

### Concepts

| Concept          | Description                                                                             |
|------------------|-----------------------------------------------------------------------------------------|
| **Microservices**| Independent services focused on specific tasks, made possible by containers and APIs.   |
| **Docker**       | A containerisation platform that makes it easy to create, share, and deploy containers. |
| **Docker Engine**| The core of Docker, managing images and containers.                                     |
| **Docker Hub**   | A repository for Docker images, enabling easy sharing and deployment of containerised applications. |

Docker and microservices offer agility, consistency, and scalability, which is why they are widely used in modern software development.

<br>

# How Docker Works

![alt text](./dk-images/image.png)

## Docker Host
* This is the machine where Docker is installed. 
* It runs the Docker Daemon (server), which is responsible for managing Docker containers, images, networks, and storage volumes. 
* The Docker Daemon listens for Docker API requests and manages Docker objects.

## Docker CLI (Client)
* *The Docker Command Line Interface (CLI) is a tool that allows users to interact with the Docker Daemon using commands. 
* These commands use an API to communicate with the Docker Daemon, enabling users to manage containers, images, networks, and volumes.

## Docker Hub (Registry)
* Docker Hub is a cloud-based registry service where Docker images are stored. 
* It acts as a central repository for Docker images, allowing users to share and access container images. 
* Docker Hub stores all the files needed to run a container, such as the application code, libraries, and dependencies.

## Running Containers
`docker run (image name)`
* This command is used to create and start a container from a specified image. 
* When you run this command, Docker checks if the image is available locally. 
* If the image is not found locally, Docker will pull it from Docker Hub.

  * **Image Check**: If the specified image is not available locally, Docker Daemon will check Docker Hub to see if the image exists.
  * **Image Pull**: If the image is found on Docker Hub, Docker will download (pull) the image to the local machine.
  * **Container Start**: Once the image is available locally, Docker will create and start a container from the image.

## Pulling Images Manually
`docker pull (image name)`
* This command is used to manually download an image from a remote repository (e.g., Docker Hub) to the local machine. 
* This is useful if you want to ensure that the image is available locally before running a container.

Summary
* Docker simplifies the process of building, deploying, and running applications by using containers. 
* The Docker Host runs the Docker Daemon, which manages containers and images. 
* The Docker CLI allows users to interact with the Docker Daemon using commands. 
* Docker Hub serves as a central repository for Docker images. 
* When running a container, Docker checks if the image is available locally and pulls it from Docker Hub if necessary. 
* This streamlined process ensures that applications run consistently across different environments.

<br>

# Tuesday Code-Along, 05/11
* Open Git Bash window. 
* `docker --help`: to help you with Docker commands.
* What Docker images you already have: `docker images`
  * repository, tag, image id, created, size.

![alt text](./dk-images/image-1.png)

* If you have a permission error, try:
  * Go to Windows search bar and type "Git Bash"
  * Click "Run as administrator".

![alt text](./dk-images/image-2.png)

<br> 

* Test: `docker run hello-world`
  * It created the container and is designed to stop running once it's done. 

![alt text](./dk-images/image-3.png)

* If you go onto your Docker Desktop, you'll notice a container has been created.

![alt text](./dk-images/image-4.png)

<br> 

* Check if any containers are running.
  * `docker ps`
  * You'll notice nothing is running. 

![alt text](./dk-images/image-1.png)

<br>

`docker run -d -p 80:80 nginx`
* `-d`: Detached mode. This option runs the container in the background.
* `-p`: Port mapping. This option specifies the ports to be used for this container, both inside and outside.
* `80:80`: Maps port 80 on the host to port 80 on the container. This is useful if you want to expose the container's service on a specific port.
* `Nginx`: The container image you want to run. In this case, it's the Nginx web server.

Detailed Explanation
Detached Mode (-d):
* Runs the container in the background, allowing you to continue using the terminal for other commands.

Port Mapping (-p):
* 80:80: The first 80 is the host port, and the second 80 is the container port. 
* This means that any traffic to port 80 on the host will be forwarded to port 80 on the container.

Why Specify Ports: 
* Containers are often designed to run specific services or applications. 
* By mapping ports, you can control how these services are accessed from outside the container. 
* This is particularly useful if you want to run multiple servers on different ports.

Specify the Image:
* `nginx`: The name of the Docker image you want to run. If the image is not available locally, Docker will pull it from Docker Hub.

![alt text](./dk-images/image-5.png)

* You can check it's running on your Docker Desktop.

![alt text](./dk-images/image-8.png)

<br>

* `docker ps`

![alt text](./dk-images/image-6.png)

* If you go to a web browser and type 'localhost' where you would your URL, you will see the nginx page.

![alt text](./dk-images/image-7.png)

<br>

* How to stop this container. 
  * You can use the container ID or the Name. 
  * `docker stop d18152c4c45c` or `docker stop sleepy_wu`

![alt text](./dk-images/image-9.png)

* `docker ps --help`
  * To get help on different types of docker ps commands.

* To get a list of containers:
  * `docker ps -a`

![alt text](./dk-images/image-10.png)

<br>

* Start and remove a container
  * `docker start sleepy_wu` (insert container name or id)

* Removing the image is different to removing the image.
* remove a container:
  * `docker rm sleepy_wu` (insert container name or id)

![alt text](./dk-images/image-11.png)

* Error: you can either forcefully remove it or stop it running before you remove it. 
  * `docker rm --help`

![alt text](./dk-images/image-12.png)

* `docker rm sleepy_wu -f`
* `docker ps` to check if it's been removed.

![alt text](./dk-images/image-13.png)

<br>

# Change a container from the inside

* Run the container again (becuase we've deleted it). 
  * `docker run -d -p 80:80 nginx`
  * `docker ps`: to check it's running. 

![alt text](./dk-images/image-14.png)

  * Refresh web browser with local host running (to check nginx is running).
  * `docker exec -it determined_fermi sh` 
    * (-i (interpreter) t (terminal), container ID or name, sh (shell)). 

![alt text](./dk-images/image-15.png)

*Note! This will give you the following error:
`the input device is not a TTY.  If you are using mintty, try prefixing the command with 'winpty'`
. Fear not! This is normal. To fix this, we can use the
`alias`
command.*

* Error: we need to prefix the command to fix this. 
  * Fix: run an alias command. 
    * This is a way of saying "when I type this into the terminal, I want you to do this instead". 
      * e.g: `terraform` into the Bash terminal to check if it's present, type `alias tf="terraform"` to give it an alias, now when you give the command `tf`, terraform will appear on the terminal.
      * You will have to add this to .bashrc to make it persistent. 

![alt text](./dk-images/image-16.png)

* Our fix: `alias docker="winpty docker"`
* try your execute command again:
  * `docker exec -it determined_fermi sh` 
* Once we're in the container, our prompt is now a '#'. 

![alt text](./dk-images/image-17.png)

* Do a uname command:
  * `uname -a`

![alt text](./dk-images/image-18.png)

* Do an update and upgrade within the container:
  * `apt-get update -y`
  * `apt-get upgrade -y`

![alt text](./dk-images/image-19.png)

* Sudo does not exist within the container so we need to install it. 
  * `apt-get install sudo`

![alt text](./dk-images/image-20.png)

<br> 

Change something inside the container.
* We want to change the default nginx page. 
  * `pwd`: to find out where you are.
  * `ls` to see what#s around.
  * cd into the user folder `cd /usr` > `cd share` > `ls` >` cd nginx` > `cd html` > `ls` > `pwd`   

![alt text](./dk-images/image-21.png)

<br> 

Edit the index .html file
* Install nano: `apt-get install nano`
* `nano index.html`

![alt text](./dk-images/image-22.png)
![alt text](./dk-images/image-23.png)

* Edit the line to something memorable!
* Ctrl+S, Ctrl+X
* Refresh your nginx browser.

![alt text](./dk-images/image-24.png)

* `exit`: to leave the container. 

<br> 

Run a container on a different port
* `docker run -d -p 80:80 ahskhan/nginx-254`

* Error: port is already being used as we have nginx running on port 80. 
  * Change to port 90: `docker run -d -p 90:80 ahskhan/nginx-254`

![alt text](./dk-images/image-25.png)

<br>

# Push host-custom-static-webpage container image to Docker Hub
Task:
* Create an image from your running container which is running nginx with the index.html file we already modified in our code-along.
* Push the image to your Docker Hub account.
* Once you know your image runs from pulling down from Docker Hub, then delete your local image, then re-run your docker run command.
* Share the link to run your pushed container in the chat e.g. docker run -d -p 90:80 ahskhan/nginx-254
* It should work for everyone.

*Hint: Most blockers are related to repo naming convention.*

<br>

## Step 1: Commit the Running Container as an Image

This is the command you'll need: docker commit <container ID> <dockerhub username>/<image-name>

* Identify the running container ID for the Nginx container:
  * `docker ps`

* We will be using the nginx page that we previously edited as our image. 
  * Container ID: 141aa3203d3b

![alt text](./dk-images/image-26.png)

* Identify your dockerhub username.
  * Navigate to your Docker Desktop and locate your username.
    * `gina98`

![alt text](./dk-images/image-30.png)

* Give the image a custome name that you will remember.
  * `nginx_custom_task`

Put the command together: 
`docker commit 141aa3203d3b gina98/nginx_custom_task`

## Step 2: Log in to Docker Hub
* Log in to Docker Hub from your terminal if you haven't already
  * `docker login`

![alt text](./dk-images/image-27.png)

## Step 3: Push the Image to Docker Hub
* Push the newly created image to Docker Hub.

This is what our command will be based off: 
> `docker push <dockerhub username>/<image-name>`

* Outcome: `docker push gina98/nginx_custom_task`

## Step 4: Test the Image from Docker Hub
This is what our command will be based off: 
> `docker run -d -p <hostport:80> <dockerhub username>/<image-name>`

* Outcome: `docker run -d -p 82:80 gina98/nginx_custom_task`
 
## Step 5: Test on the Browser
* Go to your web browser and search: localhost:82
  * ':82': because this is the port we mapped to the container's port 80 when we ran the Docker container. 

![alt text](./dk-images/image-28.png)

* `docker ps`

![alt text](./dk-images/image-29.png)

<br>
 
# Automate docker image creation using a Dockerfile
Task:

We don't want to do the steps manually to change the default nginx page. We want to automate it.

You are also practicing using the docker build command
* Create a new folder such as tech2xx-mod-nginx-dockerfile (not in a repo that will be published)
* cd into the new folder
* Create an index.html you'd like to use instead of the nginx default page
* Create a Dockerfile to:
* Use the nginx base image
* Copy your index.html to the location of the nginx default page in the container
* Use docker build command to build your custom image
* Tag it similar to tech2xx-nginx-auto:v1
* Run the container
* Push your custom image to Docker Hub
* Share your command to run your custom image in the chat

If time:
* Remove the local copy of your custom image
* Re-run your container and force docker to pull the custom image from Docker Hub

<br>

## Step 1: Set Up the Folder Structure
1. Create a new folder.
   * Go to Git Bash terminal and choose a location for your dockerfile.
     * I have placed it in my Documents folder to avoid it being pushed. 
   * Name your folder: 'tech264-mod-nginx-dockerfile' and `cd` into it. 

```bash
mkdir tech264-mod-nginx-dockerfile
cd tech264-mod-nginx-dockerfile
```

![alt text](./dk-images/image-31.png)

<br> 

2. Create a custom index.html file in this folder with your desired content.
   * Create the file: `nano index.html`
  
![alt text](./dk-images/image-32.png)

<br>

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gina's Mind Blown</title>
</head>
<body>
    <p>Welcome to Gina's Custom Nginx Page!</p>
</body>
</html>
```

### Alternative: Using Visual Studio Code
1. Open Visual Studio Code.
   * Open your 'tech264-mod-nginx-dockerfile' folder on VSC.
   * You will see a index.html file already located on the left. 

![alt text](./dk-images/image-33.png)

* Click into this file.
* On the first line type: ! and click the Tab button.
  * This automatically inserts the basic html code. 
* Within the body you can enter your description.
* The title will appear within the tab of the browser.

![alt text](./dk-images/image-34.png)

2. Check index.html file in Git Bash.
   * Go to a Git Bash terminal and locate your 'tech264-mod-nginx-dockerfile' folder.
   * Nano into the index.html file: `nano index.html`
   * And there's your code!

![alt text](./dk-images/image-35.png)

<br> 

## Step 2: Write the Dockerfile
* Create a Dockerfile in the same folder with the following content:
  * File name: Dockerfile

![alt text](./dk-images/image-36.png)

```dockerfile
# Use the official Nginx base image
FROM nginx:latest

# Copy custom index.html to the default Nginx HTML location
COPY index.html /usr/share/nginx/html/index.html
```

<br>

## Step 3: Build the Custom Docker Image
* Still within the tech264-mod-nginx-dockerfile folder.
* Build the image and tag it. 
  * Base it off of this command: docker build -t your_dockerhub_username/tech2xx-nginx-auto:v1 .
  * `.`: means to use this directory and files. 

```bash
docker build -t gina98/tech264-nginx-auto:v1 .
```

![alt text](./dk-images/image-37.png)

## Step 4: Run the Container
* This will be within the home directory of your Git Bash.
* Run the container to verify everything is working.
  * We will be using port 83:80 because we have port :82 occupied currently. 
  * Base it off of this command: docker run -d -p 80:80 your_dockerhub_username/tech2xx-nginx-auto:v1

```bash
docker run -d -p 83:80 gina98/tech264-nginx-auto:v1
```

![alt text](./dk-images/image-38.png)

> If it's not working, you may need to open a fresh terminal. 

<br> 

## Step 5: Push the Image to Docker Hub
* Log in to Docker Hub if needed, then push the image.
  * To log in: `docker login`
  * To push the image: docker push your_dockerhub_username/tech2xx-nginx-auto:v1

```bash
docker push gina98/tech264-nginx-auto:v1
```

![alt text](./dk-images/image-39.png)

<br>

## Step 6: Run Command 
* Share the command so others can pull and run your custom Nginx image.
  * The command is based on: docker run -d -p 80:80 your_dockerhub_username/tech2xx-nginx-auto:v1

```bash
docker run -d -p 84:80 gina98/tech264-nginx-auto:v1
```

## Check your browser!
* Go to your web browser and type: localhost:84

![alt text](./dk-images/image-40.png)

<br>

