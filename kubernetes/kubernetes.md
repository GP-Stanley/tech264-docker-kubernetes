- [Kubernetes](#kubernetes)
  - [Why is Kubernetes Needed?](#why-is-kubernetes-needed)
  - [Benefits of Kubernetes](#benefits-of-kubernetes)
  - [Success Stories](#success-stories)
    - [Spotify](#spotify)
- [Kubernetes Architecture](#kubernetes-architecture)
  - [Architecture Diagram: Master Nodes and Worker Nodes](#architecture-diagram-master-nodes-and-worker-nodes)
- [Kubernetes terminology and architecture](#kubernetes-terminology-and-architecture)
  - [Pods](#pods)
  - [Deployments](#deployments)
  - [Services](#services)
  - [Nodes](#nodes)
  - [The Kubernetes control plane](#the-kubernetes-control-plane)
- [What is a Cluster?](#what-is-a-cluster)
  - [Key Components of a Kubernetes Cluster](#key-components-of-a-kubernetes-cluster)
  - [Cluster Architecture/Diagram](#cluster-architecturediagram)
- [Control Plane](#control-plane)
  - [Controller manager](#controller-manager)
  - [API Server](#api-server)
  - [Scheduler](#scheduler)
  - [etcd](#etcd)
- [Worker node components](#worker-node-components)
  - [Kubelet](#kubelet)
  - [Kube proxy](#kube-proxy)
  - [Container runtime](#container-runtime)
  - [Pods](#pods-1)
- [The Cluster Setup](#the-cluster-setup)
  - [Master vs Worker Nodes](#master-vs-worker-nodes)
  - [Managed Service vs. Launching Your Own](#managed-service-vs-launching-your-own)
    - [Pros of Managed Service](#pros-of-managed-service)
    - [Cons of Managed Service](#cons-of-managed-service)
  - [Control Plane vs. Data Plane](#control-plane-vs-data-plane)
    - [Azure Kubernetes Service (AKS) Specifics](#azure-kubernetes-service-aks-specifics)
- [Kubernetes Objects](#kubernetes-objects)
  - [What Does It Mean When a Pod is "Ephemeral"?](#what-does-it-mean-when-a-pod-is-ephemeral)
- [Mitigating Security Concerns with Containers](#mitigating-security-concerns-with-containers)
  - [Maintained Images](#maintained-images)
    - [Pros](#pros)
    - [Cons](#cons)

<br>

# Kubernetes
* Kubernetes is a powerful tool in the world of cloud computing and software development.

## Why is Kubernetes Needed?
* Kubernetes helps in managing containers, which are small, portable environments used to run applications. 
* Managing these containers manually can become difficult, especially as you scale up with more applications or users. 
* Kubernetes automates the deployment, scaling, and operation of these containers, making it easier to manage complex applications across different servers.

## Benefits of Kubernetes
* **Scalability**: Automatically adjusts the number of containers based on application load, (provides load balancing).
* **Efficiency**: Helps you use resources (like CPU and memory) effectively, reducing costs.
* **Portability**: Applications can run in many different environments (e.g., on-premises, cloud).
* **High availability**: Keeps applications running even if some containers or servers fail.
* **Self-healing**: Automatically restarts or replaces failed containers.
* **Rollback**: Allows you to revert to a previous version of your application if something goes wrong with a new update, minimising downtime and keeping your users happy.
* **Open-source**: Being open-source, Kubernetes benefits from a large community of contributors who continuously improve and update the platform, ensuring it stays cutting-edge and reliable.
* **No single point of failure**: Distributes workloads across multiple nodes, ensuring that the failure of a single node does not bring down the entire application.

## Success Stories
* Many companies like Google, Spotify, and Shopify use Kubernetes to run applications at scale, manage high traffic, and quickly deploy new features. 
* It’s particularly popular among companies that rely on microservices architectures, where applications are split into smaller, manageable parts.

### Spotify
* **Challenge**: Spotify, a global audio-streaming platform, needed to manage its rapidly growing user base and complex microservices architecture. 
  * Initially, they used a homegrown container orchestration system called Helios, but it became clear that they needed a more robust solution supported by a larger community.

* **Solution**: Spotify decided to migrate to Kubernetes. 
  * They were attracted by Kubernetes' feature-rich environment and the strong community support. 
  * The migration allowed Spotify to benefit from increased velocity, reduced costs, and alignment with industry best practices.

Impact:
* **Improved Efficiency**: Teams could focus more on delivering features rather than managing infrastructure.
* **Autoscaling**: Kubernetes' autoscaling capabilities allowed Spotify to handle up to 10 million requests per second efficiently.
* **Reduced Provisioning Time**: Creating new services and getting them operational in production went from taking an hour to just seconds or minutes.
* **Better Resource Utilisation**: Kubernetes' bin-packing and multi-tenancy features improved CPU utilisation by two to three times.

> Spotify's successful migration to Kubernetes highlights how the platform can handle complex, large-scale applications, improve operational efficiency, and support rapid growth. This success story demonstrates the transformative power of Kubernetes in modern application management.


<br>

# Kubernetes Architecture
* Kubernetes uses a cluster setup, which is a group of connected computers (nodes) that work together.
  * **Master Node**: The brain of the cluster, controlling and managing tasks, distributing them to worker nodes.
  * **Worker Nodes**: Execute the tasks assigned by the master node by running containers.

Diagram: A simple structure of a Kubernetes architecture:

          +---------------+            +--------------------+
          |               |            |                    |
          |   Master      | ----->     | Worker Nodes       |
          |               |            |                    |
          +---------------+            +--------------------+

<br>

## Architecture Diagram: Master Nodes and Worker Nodes

![kube-arch](./kube-images/kube-arch1.png)

Source: https://newrelic.com/de/blog/how-to-relic/what-is-kubernetes

<br>

# Kubernetes terminology and architecture

![kube-arch](./kube-images/kube-arch.png)

Source: https://www.cncf.io/blog/2019/08/19/how-kubernetes-works/

<br>

## Pods
* A Kubernetes pod is a group of containers that work together and share the same resources like memory and storage. 
* Each pod has one IP address that all its containers use. 
* This setup makes it easy to manage the containers as a single application.
  * **Single Container Pods**: Often, a pod has just one container, especially if the application is simple.
  * **Multi-Container Pods**: For more complex tasks, a pod can have multiple containers that share data and work together.

Example: Imagine you have a service that creates GIFs. One pod might have several containers:
* One container handles incoming requests.
* Other containers process images in the background.

This setup helps manage the application efficiently and ensures all parts work together smoothly.

![pod-arch](./kube-images/pod-arch.png)

Source: https://www.wallarm.com/what/what-is-a-kubernetes-pod

<br>

## Deployments
* Kubernetes deployments *define the scale* at which you want to run your application by letting you set the details of *how you would like pods replicated* on your Kubernetes nodes. 
* Deployments describe the **number of desired identical pod replicas to run** and the preferred update *strategy used when updating* the deployment. 
* Kubernetes will **track pod health**, and will **remove or add pods** as needed to bring your application deployment to the **desired state**.

![deploy](./kube-images/deploy.png)

<br>

## Services
* In Kubernetes, the lifetime of an individual pod is unpredictable; their **IP addresses** and **existence** can **change**. 
* In the DevOps world, servers are often treated as either "pets" (cared for individually) or "cattle" (*interchangeable*). 
* Kubernetes treats its pods like cattle, **replacing them if they fail** to ensure the application keeps running smoothly.

![alt text](./kube-images/cat-pets.png)

* A **service** in Kubernetes is an abstraction that provides a **stable interface for interacting with pods**. 
* As pods are **replaced**, their **names** and **IPs** might **change**, but the **service maintains a consistent machine name or IP address**. 
  * This way, to the outside network, everything appears unchanged, even as the underlying pods are updated or replaced.

<br>

## Nodes
* A Kubernetes node **manages** and **runs pods**; it’s the **machine** (whether virtualised or physical) that **performs the given work**. 
* Just as **pods collect individual containers that operate together**, a **node collects entire pods that function together**. 
* When you’re operating at scale, you want to be able to hand work over to a node whose pods are free to take it.

<br>

## The Kubernetes control plane
* The Kubernetes control plane is the **main entry point** for **administrators** and **users** to **manage the various nodes**. 
* Operations are issued to it either through HTTP calls or connecting to the machine and running command-line scripts. 
* As the name implies, it **controls how Kubernetes interacts with your applications**.

<br>

# What is a Cluster?
* A cluster in computing is like a team of computers working together to achieve a common goal. 
* Each computer in the cluster is called a node, and they all communicate and collaborate to run applications more efficiently and reliably.
* It allows multiple computers to work together seamlessly, providing better performance, scalability, and reliability for running applications

## Key Components of a Kubernetes Cluster
Master Node:
* **Control Plane**: This is the brain of the cluster. It manages the cluster, schedules applications, and handles the overall state of the system.
* **API Server**: Acts as the front end for the Kubernetes control plane. It exposes the Kubernetes API.
* **Scheduler**: Assigns work to the worker nodes based on resource availability.
* **Controller Manager**: Ensures the desired state of the cluster matches the actual state.
* **etcd**: A key-value store that holds all the data about the cluster's state.

Worker Nodes:
* **Kubelet**: An agent that runs on each worker node and ensures containers are running in a pod.
* **Kube-proxy**: Manages network communication inside and outside the cluster.
* **Container Runtime**: Software that runs the containers, such as Docker or containerd.

<br>

## Cluster Architecture/Diagram
* A cluster is all of the below components put together as a single unit.

![control-plane](./kube-images/control-plane.png)

Source: https://www.logicmonitor.com/support/kubernetes-control-plane-monitoring-overview

<br>

# Control Plane

## Controller manager
* The controller-manager is responsible for making sure that the **shared state of the cluster is operating as expected**. 
* More accurately, the controller manager **oversees various controllers which respond to events** (e.g., if a node goes down)

## API Server
* The API server exposes a **REST interface** to the Kubernetes cluster. 
* All **operations** against pods, services, and so forth, are **executed programmatically by communicating with the endpoints provided by it**.

## Scheduler
* The scheduler is responsible for **assigning work** to the various nodes. 
* It keeps watch over the resource capacity and **ensures that a worker node’s performance is within an appropriate threshold**.

## etcd
`etcd`

* is a distributed key-value store that Kubernetes uses to share information about the overall state of a cluster. 
* Additionally, nodes can refer to the global configuration data stored there to set themselves up whenever they are regenerated.

<br>

# Worker node components

## Kubelet
* A Kubelet tracks the state of a pod to ensure that all the containers are running. 
* It provides a heartbeat message every few seconds to the control plane. 
* If a replication controller does not receive that message, the node is marked as unhealthy.

## Kube proxy
* The Kube proxy routes traffic coming into a node from the service. 
* It forwards requests for work to the correct containers.

## Container runtime
* This is responsible for working with the containers and executing them. 
* It can be Docker or another container runtime, such as containerd or cri-o.
* It uses the container runtime interface (CRI) to communicate with the kubelet.

## Pods
* These are groups of one or more containers that share storage and network resources, and a specification for how to run them. 
* Pods are the smallest units of a Kubernetes application. 
* They can be created and managed by workload resources, such as deployments or statefulsets. 

![alt text](./kube-images/work-node.png)

<br>

# The Cluster Setup
* A cluster is the basic setup for Kubernetes, where multiple computers work together as a single unit. The main parts are master nodes and worker nodes:
  * **Master Node**: Responsible for controlling and scheduling tasks within the cluster. It houses the control plane, where all the decision-making happens.
  * **Worker Nodes**: Run the application workloads and communicate with the master node.

<br>

## Master vs Worker Nodes
In a cluster, there are two main types of nodes: master nodes and worker nodes.

Master Nodes:
* These are the brains of the cluster. 
* They manage and control everything that happens in the cluster. 
* The master nodes decide which tasks need to be done and assign those tasks to the worker nodes. 
* They also keep track of the overall health and status of the cluster.

Worker Nodes:
* These are the hands of the cluster. 
* They do the actual work assigned by the master nodes. 
* Each worker node runs applications and handles tasks like processing data, responding to user requests, and more. 
* Worker nodes report back to the master nodes to let them know how things are going.

> Summary
> 
> **Cluster**: A group of connected computers working together.
> 
> **Master Nodes**: Manage and control the cluster, assigning tasks to worker nodes.
> 
> **Worker Nodes**: Perform the tasks assigned by the master nodes, running applications and handling workloads.

<br>

## Managed Service vs. Launching Your Own
* **Managed Service** (like Google Kubernetes Engine, Amazon EKS): 
  * Easier to set up and maintain, as the provider handles many aspects, like updates and scaling.
* **Self-Managed**: Offers full control but requires more expertise and management.

### Pros of Managed Service
* Reduces the time and effort needed to set up and maintain Kubernetes.
* Automatic updates and security patches.
* **Azure Kubernetes Service** (AKS): Simplifies deploying a managed Kubernetes cluster in Azure by offloading the operational overhead to Azure. 
  * Azure handles critical tasks like health monitoring and maintenance.

### Cons of Managed Service
* Limited customisation.
* Potentially higher costs.

## Control Plane vs. Data Plane
* **Control Plane**: The brains of the cluster, handling the scheduling, monitoring, and scaling of applications.
* **Data Plane**: Executes tasks and runs the application workloads on worker nodes.

### Azure Kubernetes Service (AKS) Specifics
Control Plane: 
* Azure automatically creates and configures the control plane for you at no cost. 
* The Azure platform manages the AKS control plane, which is responsible for the Kubernetes objects and worker nodes that you deploy to run your applications.

Data Plane: 
* The data plane consists of the worker nodes, which are Azure virtual machines (VMs) that run your applications. 
* You only pay for the AKS nodes that run your applications.

> By using AKS, you benefit from a fully managed Kubernetes service that simplifies the deployment, management, and scaling of containerised applications, allowing you to focus more on your applications and less on the underlying infrastructure.

<br>

# Kubernetes Objects
* Kubernetes manages several types of objects that define different parts of an application.
  * **Deployments**: Control how and where Pods are run, making it easy to roll out updates.
  * **ReplicaSets**: Ensure a specified number of identical Pods are running.
  * **Pods**: The smallest deployable unit, containing one or more containers.

![alt text](./kube-images/objects.png)

## What Does It Mean When a Pod is "Ephemeral"?
* Pods are ephemeral, meaning they are *temporary*. 
* If a Pod fails or is no longer needed, Kubernetes will terminate it and create a new one when necessary.

<br>

# Mitigating Security Concerns with Containers
Containers can be vulnerable, so it’s important to:
* Use maintained images (updated by trusted sources).
* Limit container permissions.
* Use security tools for scanning and monitoring containers.

## Maintained Images
* Maintained images are container images created and updated by a trusted source, like Docker or a cloud provider. 
* They come with frequent updates, security patches, and optimisations.

### Pros
* Saves time and effort as updates and patches are handled for you.
* Generally more secure than unmaintained images.

### Cons
* May not have all the customisation options you need.
* Could be larger in size than a custom-built image.

> Kubernetes is a powerful way to manage applications efficiently and reliably at scale. With practice, the architecture and terms will become more familiar, helping you leverage all the benefits Kubernetes has to offer.

<br>