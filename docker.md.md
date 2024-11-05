
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