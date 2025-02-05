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
  - [Launching Your Own](#launching-your-own)
    - [Pros of Launching Your Own](#pros-of-launching-your-own)
    - [Cons of Launching Your Own](#cons-of-launching-your-own)
  - [Control Plane (Master Node) vs. Data Plane (Worker Node)](#control-plane-master-node-vs-data-plane-worker-node)
    - [Azure Kubernetes Service (AKS) Specifics](#azure-kubernetes-service-aks-specifics)
- [Kubernetes Objects](#kubernetes-objects)
- [ReplicaSets](#replicasets)
  - [How It Works:](#how-it-works)
  - [Example](#example)
- [Pods](#pods-2)
  - [Key Points](#key-points)
    - [Group of Containers](#group-of-containers)
    - [Shared IP Address](#shared-ip-address)
    - [Ephemeral](#ephemeral)
  - [What Does It Mean When a Pod is "Ephemeral"?](#what-does-it-mean-when-a-pod-is-ephemeral)
- [What is a Volume?](#what-is-a-volume)
  - [Key Points](#key-points-1)
    - [Persistent Storage](#persistent-storage)
    - [Shared Storage](#shared-storage)
    - [Types of Volumes](#types-of-volumes)
- [Secrets in Kubernetes](#secrets-in-kubernetes)
  - [Key Points](#key-points-2)
    - [Base64 Encoding](#base64-encoding)
    - [Encryption](#encryption)
  - [Best Practices for Securing Secrets](#best-practices-for-securing-secrets)
- [Name Space](#name-space)
  - [Key Points](#key-points-3)
- [Mitigating Security Concerns with Containers](#mitigating-security-concerns-with-containers)
  - [How to mitigate security concerns with containers](#how-to-mitigate-security-concerns-with-containers)
  - [Maintained Images](#maintained-images)
  - [Key Points](#key-points-4)
    - [Pros](#pros)
    - [Cons](#cons)
- [Getting Kubernetes Running](#getting-kubernetes-running)
  - [Docker Desktop](#docker-desktop)
  - [Git Bash Window: `kubectl get service`](#git-bash-window-kubectl-get-service)
- [Code-along](#code-along)
  - [Create a Node Port Service for Nginx](#create-a-node-port-service-for-nginx)
  - [Deleting a Pod](#deleting-a-pod)
  - [Increase Number of Replicas](#increase-number-of-replicas)
  - [How to Delete Everything](#how-to-delete-everything)
  - [ClusterIP v NodePort](#clusterip-v-nodeport)
    - [ClusterIP](#clusterip)
    - [NodePort](#nodeport)
- [My Interpretation of Kubernetes Architecture](#my-interpretation-of-kubernetes-architecture)
- [K8s deployment of NodeJS Sparta test app](#k8s-deployment-of-nodejs-sparta-test-app)
  - [1. Create Deployment for mongodb-deploy.yml](#1-create-deployment-for-mongodb-deployyml)
    - [Explanation](#explanation)
  - [2. Create a Service for MongoDB](#2-create-a-service-for-mongodb)
    - [Explanation](#explanation-1)
  - [3. Create Deployment YAML for NodeJS App](#3-create-deployment-yaml-for-nodejs-app)
    - [Explanation](#explanation-2)
    - [Alternative way of seeding - untested in my scripts](#alternative-way-of-seeding---untested-in-my-scripts)
    - [Manual Seeding: Using a Pod - untested](#manual-seeding-using-a-pod---untested)
  - [4. Create App Service](#4-create-app-service)
    - [Explanation](#explanation-3)
  - [5. Run and Verify the Deployment](#5-run-and-verify-the-deployment)
    - [Blockers](#blockers)
    - [Deletion Commands](#deletion-commands)
    - [Creation Commands](#creation-commands)
    - [Check They're There](#check-theyre-there)
  - [6. Seeding the Database](#6-seeding-the-database)
    - [Copy the app folder](#copy-the-app-folder)
    - [Explanation](#explanation-4)
- [Manually Seeding: log in to a pod and seed the database](#manually-seeding-log-in-to-a-pod-and-seed-the-database)
- [Persistent Volume (PV) and Persistent Volume Claim (PVC) for MongoDB](#persistent-volume-pv-and-persistent-volume-claim-pvc-for-mongodb)
  - [Using PV and PVC for MongoDB](#using-pv-and-pvc-for-mongodb)
- [Create 2-tier deployment with PV for database](#create-2-tier-deployment-with-pv-for-database)
  - [Create a Persistent Volume (PV) for MongoDB](#create-a-persistent-volume-pv-for-mongodb)
  - [Create a Persistent Volume Claim (PVC) for MongoDB](#create-a-persistent-volume-claim-pvc-for-mongodb)
  - [Apply these configurations](#apply-these-configurations)
  - [Configure the MongoDB Deployment with PVC](#configure-the-mongodb-deployment-with-pvc)
  - [Apply the deployment](#apply-the-deployment)
  - [Configure Node.js Deployment and Service](#configure-nodejs-deployment-and-service)
  - [Apply the configurations](#apply-the-configurations)
  - [Testing Persistent Data](#testing-persistent-data)
    - [What does this output mean?](#what-does-this-output-mean)
    - [Analysis of the output](#analysis-of-the-output)
    - [Summary](#summary)
  - [Delete MongoDB Pod/Deployment and Re-create:](#delete-mongodb-poddeployment-and-re-create)
    - [Deletion Commands](#deletion-commands-1)
    - [Creation Commands](#creation-commands-1)
    - [Check They're There](#check-theyre-there-1)
  - [Seed Manually](#seed-manually)
  - [Delete MongoDB Pod/Deployment and Re-create](#delete-mongodb-poddeployment-and-re-create-1)
  - [Check for Persistent Data](#check-for-persistent-data)
  - [Diagram Layout](#diagram-layout)
- [Research Types of Autoscaling with K8s](#research-types-of-autoscaling-with-k8s)
  - [What is Autoscaling?](#what-is-autoscaling)
  - [Types of Autoscaling in Kubernetes](#types-of-autoscaling-in-kubernetes)
    - [1. Horizontal Pod Autoscaling (HPA)](#1-horizontal-pod-autoscaling-hpa)
    - [2. Vertical Pod Autoscaling (VPA)](#2-vertical-pod-autoscaling-vpa)
    - [3. Cluster Autoscaling](#3-cluster-autoscaling)
    - [4. Kubernetes Event-Driven Autoscaling (KEDA)](#4-kubernetes-event-driven-autoscaling-keda)
  - [Difference Between Vertical and Horizontal](#difference-between-vertical-and-horizontal)
  - [Benefits of Autoscaling](#benefits-of-autoscaling)
- [The key components of Kubernetes autoscaling](#the-key-components-of-kubernetes-autoscaling)
  - [1. Resource Request](#1-resource-request)
    - [Configuring the resource request](#configuring-the-resource-request)
    - [Pod Disruption Budget](#pod-disruption-budget)
  - [2. Pod Disruption Budget](#2-pod-disruption-budget)
  - [3. Horizontal Pod Autoscaler](#3-horizontal-pod-autoscaler)
  - [4. Cluster Autoscaler](#4-cluster-autoscaler)
    - [Adding a node](#adding-a-node)
    - [Removing a node](#removing-a-node)
- [Use Horizontal Pod Autoscaler (HPA) to scale the app](#use-horizontal-pod-autoscaler-hpa-to-scale-the-app)
  - [Steps to Implement HPA for Node.js Application](#steps-to-implement-hpa-for-nodejs-application)
  - [Install Apache](#install-apache)
  - [1. Define HPA for Node.js App](#1-define-hpa-for-nodejs-app)
  - [2. Create HPA](#2-create-hpa)
  - [3. Verify HPA Setup](#3-verify-hpa-setup)
  - [4. Load Test with Apache Bench (ab)](#4-load-test-with-apache-bench-ab)
  - [Install Metrics Server](#install-metrics-server)
  - [Steps to Fix the Metrics Server](#steps-to-fix-the-metrics-server)
- [Delete \& Create](#delete--create)
  - [Delete all at once](#delete-all-at-once)
  - [Delete MongoDB Pod/Deployment and Re-create:](#delete-mongodb-poddeployment-and-re-create-2)
    - [Deletion Commands](#deletion-commands-2)
    - [Creation Commands](#creation-commands-2)
    - [Check They're There](#check-theyre-there-2)
- [Use MetalLB as a load balancer for the Sparta app deployment](#use-metallb-as-a-load-balancer-for-the-sparta-app-deployment)
  - [Goal](#goal)
  - [MetalLB Requirements](#metallb-requirements)
- [Install MetalLB by Manifest](#install-metallb-by-manifest)
    - [What This Command Does:](#what-this-command-does)
  - [Configure MetalLB in L2 mode](#configure-metallb-in-l2-mode)
    - [Finding Your IP Range](#finding-your-ip-range)
    - [Calculating the IP Range](#calculating-the-ip-range)
  - [Configure MetalLB \& Apply](#configure-metallb--apply)
    - [Explanation](#explanation-5)
  - [Apply your PV and PVC file](#apply-your-pv-and-pvc-file)
  - [Deploy the Database](#deploy-the-database)
  - [Deply Sparta App](#deply-sparta-app)
  - [Enable Autoscaling (HPA)](#enable-autoscaling-hpa)
  - [Verify the Deployment](#verify-the-deployment)
  - [Access Service](#access-service)
- [Delete \& Create](#delete--create-1)
    - [Delete all at once:](#delete-all-at-once-1)
    - [Create all at once](#create-all-at-once)
    - [Check They're There](#check-theyre-there-3)
- [Local Stack](#local-stack)
- [Setup minikube on a cloud instance running Ubuntu 22.04 LTS](#setup-minikube-on-a-cloud-instance-running-ubuntu-2204-lts)
- [AWS EC2](#aws-ec2)
  - [Provision Your Cloud Instance](#provision-your-cloud-instance)
  - [Connect to Your Instance](#connect-to-your-instance)
  - [Update System Packages](#update-system-packages)
  - [Install MiniKube \& Binary](#install-minikube--binary)
    - [Check Version](#check-version)
  - [Install Docker](#install-docker)
  - [Install Kubectl](#install-kubectl)
  - [Start Minikube](#start-minikube)
    - [Explanation](#explanation-6)
- [Delete Minikube and all related resources from your cloud instance](#delete-minikube-and-all-related-resources-from-your-cloud-instance)
  - [1. Stop and Delete Minikube Cluster](#1-stop-and-delete-minikube-cluster)
  - [2. Uninstall Minikube](#2-uninstall-minikube)
  - [3. Uninstall Kubectl](#3-uninstall-kubectl)
  - [4. Uninstall Docker](#4-uninstall-docker)
  - [5. Clean Up Docker Data](#5-clean-up-docker-data)
  - [6. Verify Removal](#6-verify-removal)
- [Tasks not yet done:](#tasks-not-yet-done)
- [Deploy on three apps on one cloud instance running minikube](#deploy-on-three-apps-on-one-cloud-instance-running-minikube)
- [Using Terraform: Infrastructure Setup for Minikube Deployment](#using-terraform-infrastructure-setup-for-minikube-deployment)
  - [1. AWS Provider Configuration](#1-aws-provider-configuration)
  - [2. Security Group Creation](#2-security-group-creation)
  - [3. Security Group Ingress Rules](#3-security-group-ingress-rules)
    - [Allow SSH (Port 22)](#allow-ssh-port-22)
    - [Allow HTTP (Port 80)](#allow-http-port-80)
    - [Allow HTTP on Port 9000](#allow-http-on-port-9000)
    - [Allow All Outbound Traffic](#allow-all-outbound-traffic)
  - [4. EC2 Instance Configuration](#4-ec2-instance-configuration)
- [Variables](#variables)
- [Output](#output)
  - [Minikube Deployment with NodePort and Nginx Reverse Proxy](#minikube-deployment-with-nodeport-and-nginx-reverse-proxy)
    - [Step 1: Define the Kubernetes Service with NodePort](#step-1-define-the-kubernetes-service-with-nodeport)
    - [Step 2: Apply the Kubernetes Service Configuration](#step-2-apply-the-kubernetes-service-configuration)
    - [Step 3: Get the Minikube IP Address](#step-3-get-the-minikube-ip-address)
    - [Step 4: Configure Nginx as a Reverse Proxy](#step-4-configure-nginx-as-a-reverse-proxy)
    - [Step 5: Test and Reload Nginx Configuration](#step-5-test-and-reload-nginx-configuration)
    - [Step 6: Access Your Application](#step-6-access-your-application)
  - [Recap of the Setup](#recap-of-the-setup)
  - [App 2: Tunnel \& LoadBalancer Deployment.](#app-2-tunnel--loadbalancer-deployment)
  - [Setting Up Minikube Tunnel with a LoadBalancer](#setting-up-minikube-tunnel-with-a-loadbalancer)
    - [Step 1: Define the Kubernetes Service as a LoadBalancer](#step-1-define-the-kubernetes-service-as-a-loadbalancer)
    - [Step 2: Start Minikube Tunnel](#step-2-start-minikube-tunnel)
    - [Step 3: Check the LoadBalancer IP](#step-3-check-the-loadbalancer-ip)
    - [Step 4: Configure Nginx as a Reverse Proxy](#step-4-configure-nginx-as-a-reverse-proxy-1)
    - [Step 5: Test and Reload Nginx Configuration](#step-5-test-and-reload-nginx-configuration-1)
    - [Step 6: Access Your Application](#step-6-access-your-application-1)
- [Create Bash script to provision minikube](#create-bash-script-to-provision-minikube)
  - [Key Concepts](#key-concepts)
    - [Why We Need to Restart the Script with Docker Group Permissions](#why-we-need-to-restart-the-script-with-docker-group-permissions)
    - [Effect of sg docker "$0"](#effect-of-sg-docker-0)
    - [Why This Is Necessary](#why-this-is-necessary)
    - [Why We Avoid Running Minikube as Root](#why-we-avoid-running-minikube-as-root)
  - [Overview of Steps](#overview-of-steps)
- [1. Installing and Configuring Docker](#1-installing-and-configuring-docker)
  - [Adding the ubuntu User to the Docker Group](#adding-the-ubuntu-user-to-the-docker-group)
- [2. Installing and Configuring Minikube](#2-installing-and-configuring-minikube)
- [3. Starting Minikube as the ubuntu User](#3-starting-minikube-as-the-ubuntu-user)
  - [Breakdown of the code](#breakdown-of-the-code)
- [4. Installing and Configuring Nginx](#4-installing-and-configuring-nginx)
- [Final Output and Status](#final-output-and-status)
- [Use Kubernetes to deploy the Sparta test app in the cloud](#use-kubernetes-to-deploy-the-sparta-test-app-in-the-cloud)
  - [Objectives](#objectives)
- [Provisioning Script for Kubernetes Metrics Server and Application Deployment](#provisioning-script-for-kubernetes-metrics-server-and-application-deployment)
  - [Step 1: Apply Metrics Server Components](#step-1-apply-metrics-server-components)
  - [Step 2: Patch the Metrics Server Deployment](#step-2-patch-the-metrics-server-deployment)
- [Step 3: Restart the Metrics Server Deployment](#step-3-restart-the-metrics-server-deployment)
- [Step 4: Apply Application Deployment](#step-4-apply-application-deployment)
- [Step 5: Display All Resources](#step-5-display-all-resources)

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
> **Master Nodes**: Manage and control the cluster, assigning tasks to worker nodes. On average you'll want a minimum of 3. 
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

<br>

## Launching Your Own
Launching your own Kubernetes service means setting up and managing your Kubernetes cluster independently, without relying on a managed service provider like Google Kubernetes Engine (GKE), Amazon EKS, or Azure Kubernetes Service (AKS).

### Pros of Launching Your Own
* **Full Control**: You have complete control over the configuration and management of your Kubernetes cluster.
  * You can customise the setup to meet specific requirements and preferences.

* **Cost Efficiency**: Potentially lower costs if you have the expertise and resources to manage the infrastructure efficiently.
  * Avoids the premium costs associated with managed services.

* **Flexibility**: You can choose your own hardware, cloud provider, or hybrid setup.
  * Freedom to use any Kubernetes-compatible tools and integrations.

* **Security**: You can implement custom security measures and policies tailored to your organisation's needs.
  * Full control over data privacy and compliance.

* **Learning and Expertise**: Provides an opportunity to gain in-depth knowledge and expertise in Kubernetes and container orchestration.
  * Valuable for teams looking to build and maintain their own infrastructure skills.

### Cons of Launching Your Own
* **Complexity**: Setting up and managing a Kubernetes cluster can be complex and time-consuming.
  * Requires a deep understanding of Kubernetes architecture and best practices.

* **Maintenance**: You are responsible for all maintenance tasks, including updates, patches, and scaling.
  * Ongoing monitoring and troubleshooting can be resource-intensive.

* **Resource Requirements**: Requires significant resources, including skilled personnel and hardware.
  * May need to invest in additional tools for monitoring, logging, and security.

* **Risk of Downtime**: Higher risk of downtime if not managed properly.
  * Requires robust disaster recovery and backup plans.

* **Support**: Limited to community support unless you invest in third-party support services.
  * May lack the immediate assistance available with managed services.


## Control Plane (Master Node) vs. Data Plane (Worker Node)
The master node works on the control plane, and the worker nodes work on the data plane. 
* **Control Plane**: The brains of the cluster, handling the scheduling, monitoring, and scaling of applications.
* **Data Plane**: Executes tasks and runs the application workloads on worker nodes.

### Azure Kubernetes Service (AKS) Specifics
Control Plane
* Azure automatically creates and configures the control plane for you at no cost. 
* The Azure platform manages the AKS control plane, which is responsible for the Kubernetes objects and worker nodes that you deploy to run your applications.

Data Plane
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

<br>

# ReplicaSets
A ReplicaSet in Kubernetes is like a manager that ensures you always have a certain number of identical workers (called Pods) running at all times. 

* **Pods**: Think of Pods as individual workers that do a specific job in your application.
* **ReplicaSet**: The manager that keeps an eye on these workers.

## How It Works:
* **Desired Number**: You tell the ReplicaSet how many Pods you want running. For example, you might say, "I need 3 Pods running."
* **Monitoring**: The ReplicaSet constantly monitors the Pods to make sure the desired number is running.
* **Replacement**: If one of the Pods fails or stops working, the ReplicaSet will automatically create a new Pod to replace it, ensuring you always have the specified number of Pods running.

> a ReplicaSet helps maintain the stability and reliability of your application by ensuring that the right number of Pods are always up and running.

## Example
* Imagine you have a web application, and you want to make sure there are always 3 instances of it running to handle user requests. 
* You create a ReplicaSet and set the desired number of Pods to 3. 
* If one of the instances crashes, the ReplicaSet will notice and start a new instance to replace it, keeping your application running smoothly.

<br> 

![alt text](./kube-images/replica.png)

Source: https://stackoverflow.com/questions/66898830/kubernetes-internal-socket-io-connection

<br>

# Pods
* A pod in Kubernetes is the smallest and simplest unit that you can create or deploy. 
  * Think of it as a tiny, self-contained environment where your application runs.

## Key Points
### Group of Containers
* A pod can contain one or more containers that share the same resources like memory and storage. 
* These containers work together as a single application.

### Shared IP Address
* All containers within a pod share the same IP address, which makes it easy for them to communicate with each other.

### Ephemeral
* Pods are temporary and can be created, destroyed, and replaced as needed. 
* If a pod fails, Kubernetes can automatically create a new one to replace it.

## What Does It Mean When a Pod is "Ephemeral"?
* Pods are ephemeral, meaning they are *temporary*. 
* If a Pod fails or is no longer needed, Kubernetes will terminate it and create a new one when necessary.

<br>

# What is a Volume?
* A way to store the data for the pods.
* A volume is a storage resource that is accessible to all containers within a pod. 
* Unlike the ephemeral storage that containers use by default (which is lost when the container stops), volumes provide a way to persist data beyond the lifecycle of individual containers.

## Key Points
### Persistent Storage
* Volumes allow data to be stored persistently, so it remains available even if the container restarts or the pod is rescheduled to a different node.

### Shared Storage
* All containers within a pod can access the same volume, making it easy to share data between them.

### Types of Volumes
* Kubernetes supports various types of volumes, such as emptyDir, hostPath, persistentVolumeClaim, configMap, and more. 
* Each type serves different use cases and storage needs.

<br>

# Secrets in Kubernetes
Secrets are encoded with base64 but this is not the same as being encrypted. 
* Secrets in Kubernetes are used to store sensitive information, such as passwords, tokens, and keys. 
* While they are encoded with base64, this encoding is not the same as encryption. 
* **Base64** encoding is simply a way to represent binary data in an ASCII string format, making it easier to handle and transmit. 
  * However, it does not provide any security or protection for the data.

## Key Points
### Base64 Encoding
* Converts binary data into a text format using a set of 64 characters. 
* This makes it easier to store and transmit data but does not secure it.

### Encryption
* Involves transforming data into a secure format that can only be read by someone with the correct decryption key. 
* This provides a higher level of security compared to base64 encoding.

## Best Practices for Securing Secrets
* **Use Encryption**: Store secrets in an encrypted format to protect them from unauthorised access.
* **Limit Access**: Restrict access to secrets to only those components and users that absolutely need it.
* **Use External Secret Management Tools**: Consider using tools like HashiCorp Vault, AWS Secrets Manager, or Azure Key Vault to manage and secure secrets outside of Kubernetes.
* **Audit and Monitor**: Regularly audit and monitor access to secrets to detect and respond to any unauthorised access.

<br>

# Name Space
* A logical way to group your resources for an application within a cluster. 
  * Think of it as a virtual boundary that helps you manage and isolate different parts of your application or different environments (like development, testing, and production).

## Key Points
* **Logical Grouping**: Namespaces allow you to group resources (like pods, services, and deployments) for an application, making it easier to manage and organise them.
* **Isolation**: They provide a level of isolation between different projects or teams, ensuring that resources in one namespace do not interfere with resources in another.
* **Default Namespace**: If you don't specify a namespace when creating a resource, it will be placed in the default namespace.

<br>

# Mitigating Security Concerns with Containers
Containers can be vulnerable, so it’s important to:
* Use maintained images (updated by trusted sources).
* Limit container permissions.
* Use security tools for scanning and monitoring containers.

## How to mitigate security concerns with containers
* **No Root Privliges**: NEVER run containers with root privileges. 
  * Running containers as root can expose your system to significant security risks. 
  * Always use the principle of least privilege.
* **Monitoring and logging**: Implement monitoring and logging of container activity. 
  * This helps detect and respond to suspicious behavior or potential security incidents in real-time. 
* **Image Scanning**: Regularly scan container images for vulnerabilities using tools like Clair, Trivy, or Aqua Security. 
  * This helps identify and fix security issues before deploying your containers.
* **Network Policies**: Implement network policies to control traffic between pods. 
  * This minimises the attack surface by restricting which pods can communicate with each other.
* **Role-Based Access Control** (RBAC): Define and control permissions within the cluster using RBAC. 
  * This ensures that only authorised users and services can access and modify resources.
* **Namespace Isolation**: Use namespaces to separate environments within the cluster for different applications or teams. 
  * This provides an additional layer of isolation and security.
* **Use Trusted Sources**: Only deploy images from reliable and secure repositories. 
  * Using maintained images from trusted sources ensures that your containers receive regular updates and security patches.

<br>

## Maintained Images
* Maintained images are container images created and updated by a trusted source, like Docker or a cloud provider. 
* They come with frequent updates, security patches, and optimisations.

## Key Points
* **Frequent Updates**: Maintained images receive regular updates to fix bugs, improve performance, and patch security vulnerabilities.
* **Trusted Sources**: These images are provided by reputable organizations, ensuring a higher level of trust and reliability.

### Pros
* **Saves Time and Effort**: Updates and patches are handled for you, reducing the time and effort needed to maintain the images.
* **Security**: Generally more secure than unmaintained images, as they receive regular security patches and updates.
* **Reliability**: Maintained images are usually tested and optimized for stability and performance, reducing the likelihood of encountering issues.
* **Community Support**: Maintained images often come with extensive documentation and community support, making it easier to troubleshoot and resolve issues.
* **Compliance**: These images are often compliant with industry standards and regulations, which can be crucial for certain applications.

### Cons
* **Limited Customisation**: May not have all the customization options you need for specific use cases.
* **Larger Size**: Could be larger in size than a custom-built image, potentially using more resources.
* **Dependency on External Updates**: Relying on external maintainers for timely updates could be risky if updates are delayed.
* **Potential Bloat**: Maintained images might include unnecessary components that you don't need, which can increase the image size and resource usage.
* **Compatibility Issues**: Sometimes, updates to maintained images can introduce compatibility issues with your existing setup, requiring additional testing and adjustments.

> Kubernetes is a powerful way to manage applications efficiently and reliably at scale. With practice, the architecture and terms will become more familiar, helping you leverage all the benefits Kubernetes has to offer.

<br>

# Getting Kubernetes Running
## Docker Desktop
* Check that your Docker Desktop is running.
  * Go to Settings.
  * Go to Kubernetes (on the left)
  * Enable Kubernetes.
  * Click "Apply and Restart"

![alt text](./kube-images/gitadmin.png)

* If you have your Docker Desktop in a large window, you will be able to check if Kubernetes is running.

![alt text](./kube-images/running.png)

<br> 

## Git Bash Window: `kubectl get service`
* Go to your Git Bash window, (you may need administration if yours is not working).
  * You can do this through the windows search bar.

![alt text](./kube-images/admin.png)


* `kubectl get service`: This command lists all the services in your Kubernetes cluster.

  * Services in Kubernetes are used to expose your application running on a set of pods. 
  * They provide a stable IP address and DNS name for accessing the application, even if the underlying pods change.

![alt text](./kube-images/kubectl.png)

`kubectl get all`
* This command lists all the resources in your Kubernetes cluster, including pods, services, deployments, ReplicaSets, and more. 
* It's a comprehensive command that gives you an overview of everything running in your cluste

<br>

# Code-along

`kubectl get deploy`

![alt text](./kube-images/image.png)

<br>

* cd into GitHub Repo folder.
  * cd tech264-docker-kubernetes
  * cd into that repo.

Make another directory: 

* `mkdir k8s-yaml-definitions`
* cd k8s-yaml-definitions
* `mkdir local-nginx-deploy`
* cd into local-nginx-deploy
* `pwd`: Path: /c/Users/georg/OneDrive - Sparta Global/Documents/GitHub Repos/tech264-docker-kubernetes/k8s-yaml-definitions/local-nginx-deploy

<br>

Make a yml file
* `touch nginx-deploy.yml`
* `ls` to check it the file is there. 

Editing on VSC
* If you go to the left side of your panel, you can see your yml file.
* Within this file, I have used Ramon's image instead of my own. 
  * daraymonsta/nginx-257:dreamteam
  * This is mine: gina98/nginx_custom_task

![alt text](./kube-images/image-1.png)

> You can still edit on Git Bash if you'd prefer. 

```yaml
# YAML is case sensitive
# use spaces NOT a tab when we have to indent

# Specify the API you want to use for deployment
apiVersion: apps/v1
# What kind service/object you want to create
kind: Deployment
metadata:
  name: nginx-deployment  # name the deployment
spec:
  selector:
    matchLabels:
      app: nginx # look for this label/tag to match with the k8 service

  # Create a ReplicaSet with instances pods
  replicas: 5
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: gina98/nginx_custom_task # the image you created to run mod nginx
        ports:
        - containerPort: 80
```


* Run the file.
  * `kubectl create -f nginx-deploy.yml`

* Check it's been deployed.
  * `kubectl get deploy`

![alt text](./kube-images/image-2.png)

* `kubectl get replicasets`
* `kubectl get pods`

![alt text](./kube-images/image-3.png)

* Get them all at once:
  * `kubectl get all`

![alt text](./kube-images/image-4.png)

* How to delete your deployment, (use the name of the deployment at the end).
  * `kubectl delete deploy nginx-deployment`

<br> 

## Create a Node Port Service for Nginx
Three main services:
* **A Node Port**: easiest way to expose pods to the outsidw world through a port. 
  * NodePort service can use 30000-32768
* **Cluser IP**:The default type of service, which exposes the service on a cluster-internal IP. 
  * This means the service is only accessible within the cluster.
* **Load Balancer Service**: Exposes the service externally using a cloud provider's load balancer. 
  * This is useful for distributing traffic across multiple pods and ensuring high availability.

<br>

* Create a new definition file within 'local-nginx-deploy' folder. 
  * `nano nginx-service.yml`

```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-svc
  namespace: default
spec:
  ports:
  - nodePort: 30001	# range is 30000-32768
    port: 80
    targetPort: 80
  selector:
    app: nginx	# this label to match service to deployment
  type: NodePort
```

* Run the file.
  * `kubectl create -f nginx-service.yml`
* Check it's been created.
  * `kubectl get services`

![alt text](./kube-images/image-5.png)

* Go to your local browser: localhost:30001 (this is because we have 30001 under port(s))
  * This means you've connected to one of your pods. 

![alt text](./kube-images/image-6.png)

<br>

## Deleting a Pod
* View your pods.
  * `kubectl get pods`

* Delete one of these.
  * `kubectl delete pod nginx-deployment-77897d64b4-7r828`

Why has it been replaced?
* Because it's self healing. 

![alt text](./kube-images/image-7.png)

<br> 

## Increase Number of Replicas

1. We can directly edit the deployment in real time. 
   * Use this command to search for the deployment: `kubectl get all`
   * We can use: `kubectl edit deploy nginx-deployment`
   * Change your "replicas" from 3 to 4.
   * Save and exit.

![alt text](./kube-images/image-8.png)

* Check if it's changed:
  * `kubectl get all`

<br>

2. Modify deployment file and apply it.
   * `nano nginx-deploy.yml`: change 3 to 5.
   * `kubectl get all`: we need to apply these changes. 
   * Create and update configs using a yaml definition:
     * `kubectl apply -f nginx-deploy.yml`

![alt text](./kube-images/image-9.png)

* `kubectl get all`
  * Now you can see that there are 5 pods!

![alt text](./kube-images/image-10.png)

<br> 

3. Use a command to increase the number of replica pods.
   * Have the number of replicas available (i.e.,5).
   * `kubectl scale --current-replicas=5 --replicas=6 deployment.apps/nginx-deployment`
   * Check: `kubectl get all`

![alt text](./kube-images/image-11.png)

<br>

## How to Delete Everything
It's best practise to delete things in a logical order: deploy, then service. 
* `kubectl delete -f <yaml.file>`
  * `kubectl delete -f nginx-service.yml`
  * `kubectl delete -f nginx-deploy.yml`

![alt text](./kube-images/image-12.png)

* The 'delete' deletes the objects but not the yaml files. 

<br> 

## ClusterIP v NodePort
### ClusterIP
* **Internal Access**: ClusterIP exposes the service on an internal IP within the cluster. This means the service is only accessible from within the cluster.
* **Use Case**: Ideal for internal services that do not need to be accessed from outside the cluster, such as databases or internal APIs.
* **Security**: Provides better security as it limits access to within the cluster.

### NodePort
* **External Access**: NodePort exposes the service on a static port on each node's IP. This allows the service to be accessed from outside the cluster using `<NodeIP>:<NodePort>`.
* **Use Case**: Suitable for services that need to be accessed from outside the cluster, such as web applications or APIs that external clients need to reach.
* **Simplicity**: Easier to set up for external access without additional configurations.

<br>

# My Interpretation of Kubernetes Architecture

![alt text](./kube-images/image-15.png)

<br>

# K8s deployment of NodeJS Sparta test app
Pre-Requisites:
* Docker image for the NodeJS Sparta test app: gina98/sparta-test-app:v1
* Database container Docker image: mongo:7.0.6

Guidance:
* Before you do it, draw a K8s architecture diagram and share it
* Copy the YAML files we already used to a new folder for this deployment, but change the file names, label/tags, images used, ports
* Deploy the app (3 replicas) without the database first, then
* Make a another deployment folder that also includes the Mongo database (1 replica)

<br>

## 1. Create Deployment for mongodb-deploy.yml
Create a yaml file called [mongo-deploy.yml](../k8s-yaml-definitions/local-nginx-deploy/mongodb-deploy.yml). This YAML script defines a Kubernetes Deployment for a MongoDB instance. 

### Explanation

1. **apiVersion**: Specifies the API version to use for the deployment. In this case, it's `apps/v1`.
2. **kind**: Specifies the kind of Kubernetes object to create. In this case, it's a `Deployment`.
3. **metadata**: Provides metadata for the deployment, including the name of the deployment (`mongodb-deployment`).
4. **spec**: Defines the specification for the deployment, including the following:
   * **selector**: Specifies the label selector to match the pods managed by this deployment. In this case, it looks for pods with the label `app: mongodb`.
   * **replicas**: Specifies the number of pod replicas to create. In this case, it creates 1 replica.
   * **template**: Defines the pod template used to create the pods. This includes:
     * **metadata**: Provides metadata for the pods, including the label `app: mongodb`.
     * **spec**: Defines the specification for the pods, including the following:
       * **containers**: Specifies the containers to run in the pods. In this case, it runs a single container with the following properties:
       * **name**: The name of the container (`mongodb`).
       * **image**: The Docker image to use for the container (`mongo:7.0.6`).
       * **ports**: Specifies the ports to expose. In this case, it exposes port `27017`.

> This script creates a Kubernetes Deployment that manages a single replica of a MongoDB pod using the mongo:7.0.6 Docker image. The pod is labeled with app: mongodb and exposes port 27017 for MongoDB connections.

<br>

## 2. Create a Service for MongoDB
Create a yaml file called [mondobg-service](../k8s-yaml-definitions/local-nginx-deploy/mongodb-service.yml). This YAML script defines a Kubernetes Service for a MongoDB instance.

### Explanation
1. **apiVersion**: Specifies the API version to use for the service. In this case, it's `v1`.
2. **kind**: Specifies the kind of Kubernetes object to create. In this case, it's a `Service`.
3. **metadata**: Provides metadata for the service, including the name of the service (`mongodb-svc`) and the namespace (`default`).
4. **spec**: Defines the specification for the service, including the following:
   * **ports**: Specifies the ports to expose. In this case:
     * **nodePort**: `30002` - The port on each node where the service is exposed (worker node), (exposed on the outside of the cluster).
     * **port**: `27017` - The port that the service listens on (inside of the cluster).
     * **targetPort**: `27017` - The port on the pod that the service forwards traffic to.
   * **selector**: Specifies the label selector to match the pods managed by this service. In this case, it looks for pods with the label `app: mongodb`.
   * **type**: Specifies the type of service. In this case, it's a `NodePort` service, which exposes the service on a static port on each node's IP (can use clusterip for just internal access).

> This script creates a Kubernetes Service that exposes the MongoDB instance running in the `default` namespace. The service listens on port `27017` and is accessible via the node port `30002`. The service forwards traffic to pods with the label `app: mongodb`.

<br>

## 3. Create Deployment YAML for NodeJS App
Create a yaml file called [nodejs-deploy.yml](../k8s-yaml-definitions/local-nginx-deploy/nodejs-deploy.yml). This YAML script defines a Kubernetes Deployment for your Sparta application.

### Explanation
1. **apiVersion**: Specifies the API version to use for the deployment. In this case, it's `apps/v1`.
2. **kind**: Specifies the kind of Kubernetes object to create. In this case, it's a `Deployment`.
3. **metadata**: Provides metadata for the deployment, including the name of the deployment (`sparta-app-deployment`).
4. **spec**: Defines the specification for the deployment, including the following:
   * **selector**: Specifies the label selector to match the pods managed by this deployment. In this case, it looks for pods with the label `app: sparta-app`.
   * **replicas**: Specifies the number of pod replicas to create. In this case, it creates 3 replicas.
   * **template**: Defines the pod template used to create the pods. This includes:
     * **metadata**: Provides metadata for the pods, including the label `app: sparta-app`.
     * **spec**: Defines the specification for the pods, including the following:
       * **containers**: Specifies the containers to run in the pods. In this case, it runs a single container with the following properties:
         * **name**: The name of the container (`sparta-app`).
         * **image**: The Docker image to use for the container (`gina98/sparta-test-app:v1`).
         * **ports**: Specifies the ports to expose. In this case, it exposes port `3000`.
         * **env**: Sets the environment variable `DB_HOST` to the MongoDB service's address.
         * **command**: Specifies the shell to use (`/bin/sh`) with the `-c` option to run the command provided in the `args` section.
         * **args**: Executes the following commands:
           * `cd ../app`: Changes the directory to the parent directory and then into the "app" folder.
           * `node seeds/seed.js`: Runs the Node.js script to seed the database.
           * `npm start`: Starts the application using npm.

> This script creates a Kubernetes Deployment that manages three replicas of a Sparta application pod using the gina98/sparta-test-app:v1 Docker image. The pods are labeled with app: sparta-app, expose port 3000, set the DB_HOST environment variable, and run the seed script to initialize the database before starting the application.

<br>

### Alternative way of seeding - untested in my scripts
```yaml
command: ["/bin/sh", "-c"]
args: ["node seeds/seed.js && npm start app.js"]
```

### Manual Seeding: Using a Pod - untested
* Run a one-time Pod to seed the database.

1. Create a pod. Here's an example YAML file for a Pod that seeds a MongoDB database:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: seed-pod
spec:
  containers:
  - name: seed-container
    image: mongo:latest
    command: ["/bin/sh", "-c"]
    args: ["mongo mongodb://mongodb-svc.default.svc.cluster.local:27017/mydb --eval 'db.myCollection.insert({name: \"example\"})'"]
  restartPolicy: Never
```

2. Run the pod. 
   * `kubectl apply -f seed-pod.yaml`

3. Verify the pod.
   * Check the status of the Pod to ensure it completed successfully.
     * `kubectl get pods`
   * View the logs of the Pod to see the output of the seeding command.
     * `kubectl logs seed-pod`

4. Clean up.
   * Once the Pod has completed successfully, you can delete it to clean up resources.
     * `kubectl delete pod seed-pod`

<br>

## 4. Create App Service
Create a yaml file called [nodejs-service.yml](../k8s-yaml-definitions/local-nginx-deploy/nodejs-service.yml). This YAML script defines a Kubernetes Service for your Sparta application.

### Explanation
1. **apiVersion**: Specifies the API version to use for the service. In this case, it's `v1`.
2. **kind**: Specifies the kind of Kubernetes object to create. In this case, it's a `Service`.
3. **metadata**: Provides metadata for the service, including the name of the service (`sparta-app-svc`) and the namespace (`default`).
4. **spec**: Defines the specification for the service, including the following:
   * **ports**: Specifies the ports to expose. In this case:
     * **nodePort**: `30003` - The port on each node where the service is exposed (worker node), (exposed on the outside of the cluster).
     * **port**: `80` - The port that the service listens on (inside of the cluster).
     * **targetPort**: `3000` - The port on the pod that the service forwards traffic to.
   * **selector**: Specifies the label selector to match the pods managed by this service. In this case, it looks for pods with the label `app: sparta-app`.
   * **type**: Specifies the type of service. In this case, it's a `NodePort` service, which exposes the service on a static port on each node's IP.

> This script creates a Kubernetes Service that exposes the Sparta application running in the default namespace. The service listens on port 80 and is accessible via the node port 30003. The service forwards traffic to pods with the label app: sparta-app and directs it to port 3000 on those pods.

<br>

## 5. Run and Verify the Deployment
Run these Kubernetes commands: 
* `kubectl create -f mongodb-deploy.yml`
* `kubectl create -f mongodb-service.yml`
* `kubectl create -f nodejs-deploy.yml`
* `kubectl create -f  nodejs-service.yml`

![alt text](./kube-images/image-14.png)
![alt text](./kube-images/image-13.png)

* `kubectl get pods`: to check the status of your pods and ensure they are running.
* `kubectl get services`: to verify that your services are correctly configured and accessible.
* `kubectl get all`: to get all of the information in one. 

### Blockers
* In your nodejs-service.yml (when connecting with the database), you need to change the NodePort and it can't be the same port as the mongodb-service.yml.
* Make sure you create the mongodb-deploy.yml and mongodb-service.yml as the app needs something to connect to.

<br>

### Deletion Commands
* `kubectl delete service mongodb-svc`
* `kubectl delete service sparta-app-svc` 
* `kubectl delete deployment mongodb-deployment`
* `kubectl delete deployment sparta-app-deployment`

### Creation Commands
* `kubectl create -f mongodb-deploy.yml`
* `kubectl create -f mongodb-service.yml`
* `kubectl create -f nodejs-deploy.yml`
* `kubectl create -f nodejs-service.yml`

### Check They're There
* `kubectl get all`

<br>

## 6. Seeding the Database
* This will need to be inputted after the environment variable within 'nodejs-deploy.yml' file.

### Copy the app folder
Path for app folder:
* C:\Users\georg\OneDrive - Sparta Global\Documents\tech264-docker-app-container\app\seeds

Copy your app folder to your k8s-yaml-definitions folder (the parent directory to the local-nginx-deploy').
* Navigate to wherever your app folder is kept.
* Use the copy command:
  * `cp -r ~/OneDrive\ -\ Sparta\ Global/Documents/tech264-docker-app-container/app ~/OneDrive\ -\ Sparta\ Global/Documents/GitHub\ Repos/tech264-docker-kubernetes/k8s-yaml-definitions/`

![alt text](./kube-images/image-16.png)

<br>

Navigate to the [nodejs-deploy.yml](../k8s-yaml-definitions/local-nginx-deploy/nodejs-deploy.yml) file and add the command to seed your database. 

```yaml
        env:
        - name: DB_HOST
          value: "mongodb://mongodb-svc.default.svc.cluster.local:27017/posts"
        command: ["/bin/sh", "-c"]
        args: ["cd ../app && node seeds/seed.js && npm start"]
```

![alt text](./kube-images/image-17.png)

<br>

### Explanation
**Environment Variable** (`env`):
* **name**: `DB_HOST` - This is the name of the environment variable.
* **value**: `"mongodb://mongodb-svc.default.svc.cluster.local:27017/posts"`
  * This is the value assigned to the `DB_HOST` variable, which points to the MongoDB service running in the Kubernetes cluster at the specified address and port.

> When your application container starts, it will use this environment variable to connect to the MongoDB database at the given address. This allows your application to interact with the database without hardcoding the database URL in your application code.

**Command** (`command`):
* `command: ["/bin/sh", "-c"]`
* This specifies the shell to use for executing the command. 
* In this case, it uses the `/bin/sh` shell with the `-c` option to run the command provided in the args section.

**Arguments** (args):
* `args: ["cd ../app && node seeds/seed.js && npm start"]`
  * This specifies the command to be executed by the shell. 
  * It performs the following actions:
  * `cd ../app`: Changes the directory to the parent directory and then into the "app" folder.
  * `node seeds/seed.js`: Runs the Node.js script to seed the database.
  * `npm start`: Starts the application using npm.

<br> 

# Manually Seeding: log in to a pod and seed the database
* For this task, I have commented out the command & args to seed the database in the nodejs-deploy.yml. 

```yaml
        env:
        - name: DB_HOST
          value: "mongodb://mongodb-svc.default.svc.cluster.local:27017/posts"
#        command: ["/bin/sh", "-c"]
#        args: ["cd ../app && node seeds/seed.js && npm start"]
```

* cd into 'local-nginx-deploy' and run all of your scripts in the correct order (db & app).

Creation Commands
* `kubectl create -f mongodb-deploy.yml`
* `kubectl create -f mongodb-service.yml`
* `kubectl create -f nodejs-deploy.yml`
* `kubectl create -f nodejs-service.yml`

<br>

Goal: log in to a pod and seed the database.

* ` kubectl get all` to see your pods.
* Copy this: 'sparta-app-deployment-b9c5777d7-brl8j'

![alt text](./kube-images/1.png)

* `kubectl exec -it sparta-app-deployment-b9c5777d7-brl8j -- sh`

![alt text](./kube-images/2.png)

* Fix with the 'winpty' command. 
  * `winpty kubectl exec -it sparta-app-deployment-b9c5777d7-brl8j -- sh`

![alt text](./kube-images/3.png)

Why are we in the app folder?
* Because we set the working directory in the dockerfile. 

Now what?
* Check your env variable is present.
  * `printenv DB_HOST` or `echo $DB_HOST`

![alt text](./kube-images/4.png)

* Now seed the database.
  * `node seeds/seed.js`

![alt text](./kube-images/5.png)

* Refresh your terminal.
  * http://localhost:30003/posts

![alt text](./kube-images/6.png)

* Exit out.
  * `exit`

<br>

# Persistent Volume (PV) and Persistent Volume Claim (PVC) for MongoDB
* By using PV and PVC, you ensure that your MongoDB **data persists** even if the MongoDB pod is **deleted** or **rescheduled**. 
* This setup provides a reliable way to **manage storage for stateful applications** like databases in Kubernetes

**Persistent Volume** (PV)
* A Persistent Volume (PV) in Kubernetes is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes. 
* It is a resource in the cluster just like a node is a cluster resource. 
* PVs are volume plugins like Volumes, but they have a lifecycle independent of any individual Pod that uses the PV.

**Persistent Volume Claim** (PVC)
* A Persistent Volume Claim (PVC) is a request for storage by a user. 
* It is similar to a Pod. 
* Pods consume node resources, and PVCs consume PV resources. 
* PVCs can request specific size and access modes (e.g., they can be mounted ReadWriteOnce, ReadOnlyMany, ReadWriteMany, or ReadWriteOncePod).

## Using PV and PVC for MongoDB
When deploying MongoDB in Kubernetes, you can use PV and PVC to ensure that your MongoDB data is stored persistently.

1. Create a Persistent Volume (PV):
   * Define a PV that specifies the storage capacity, access modes, and storage backend (e.g., NFS, iSCSI, cloud storage).

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mongo-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Delete
  hostPath:
    path: /data/mongo
```

2. Create a Persistent Volume Claim (PVC):
   * Define a PVC that requests storage from the PV.

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mongo-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

3. Use the PVC in the MongoDB Deployment:
   * Reference the PVC in the MongoDB deployment to mount the persistent storage.

For example:
```yaml
volumes: 
- name: mongo-storage 
  persistentVolumeClaim: 
    claimName: mongo-pvc
```

<br>

# Create 2-tier deployment with PV for database
Task:

**Pre-requisite**: You have the NodeJS app and MongoDB database working on Kubernetes, but you are not using a PV (persistent volume) yet for the database.

* Create mongo-node deploy and volume (PV and PVC).
* Be careful you don't allocate too much storage for the PV.
* Remember to remove PV at the end (otherwise they will just stay there).

Check them using these commands:
* `kubectl get pv`
* `kubectl get pvc`

You will know you are successful if you:
* Delete the database deployment or the database pod
* Re-create the deployment or pod
* The same data displays on the /posts page.

Diagram (20min) your Kubernetes architecture with the PV and PVC
* Have logical notes/dot points on your diagram, labels
* Then send the link for to your diagram

Links to help:
* https://kubernetes.io/docs/concepts/storage/persistent-volumes/

<br>

## Create a Persistent Volume (PV) for MongoDB
This step ensures that the database has persistent storage that remains even if the MongoDB pod is deleted.

[Persistent Volume (PV) Definition (YAML)](../k8s-yaml-definitions/local-nginx-deploy/mongodb-pv.yml)

<br>

## Create a Persistent Volume Claim (PVC) for MongoDB
This step ensures that the database has persistent storage that remains even if the MongoDB pod is deleted.

[Persistent Volume Claim (PVC) Definition (YAML)](../k8s-yaml-definitions/local-nginx-deploy/mongodb-pvc.yml)

## Apply these configurations
* `kubectl apply -f mongodb-pv.yml`
* `kubectl apply -f mongodb-pvc.yml`

<br>

## Configure the MongoDB Deployment with PVC
In the Mongodb-deploy.yml, reference the PVC to ensure data is stored persistently.

```yaml
        volumeMounts:
        - name: mongo-storage
          mountPath: /data/db
      volumes:
      - name: mongo-storage
        persistentVolumeClaim:
          claimName: mongodb-pvc
```

## Apply the deployment
* `kubectl apply -f mongodb-deploy.yml`

<br>

## Configure Node.js Deployment and Service
The nodejs-deploy.yml and nodejs-service.yml need to connect to the MongoDB service within the same Kubernetes cluster.

## Apply the configurations
* `kubectl apply -f nodejs-deploy.yml`
* `kubectl apply -f nodejs-service.yml`

<br>

## Testing Persistent Data
1. Verify the PV and PVC Status.
   * `kubectl get pv`
   * `kubectl get pvc`

![alt text](./kube-images/7.png)

### What does this output mean?
* **mongodb-pv**: This PV has a capacity of 100Mi, is set to be accessed in ReadWriteOnce (RWO) mode, and has a reclaim policy of Delete. 
* Its status is Available, meaning it is not currently bound to any PVC.

**pvc-cc800919-bfbd-462e-a449-de2cd70ce2d0**: This PV has the same capacity and access mode as mongodb-pv, but its status is Bound, meaning it is currently bound to a PVC named mongodb-pvc in the default namespace.

**mongodb-pvc**: This PVC is in the Bound status, meaning it is successfully bound to the PV named pvc-cc800919-bfbd-462e-a449-de2cd70ce2d0. 
It requests 100Mi of storage with ReadWriteOnce (RWO) access mode and uses the hostpath storage class.

### Analysis of the output
1. Persistent Volume (PV) Status
   * The PV named mongodb-pv has a capacity of 100Mi and an access mode of RWO (ReadWriteOnce)
   * The reclaim policy is set to Delete, which means the PV will be automatically deleted when it is no longer bound to a PVC
   * The STATUS is "Available", meaning it’s ready for use
   * Another entry shows the PV is "Bound" to pvc-cc800919-bfbd-462e-a449-de2cd70ce2d0, indicating that it’s connected to a PVC, which is exactly what you wanted.

2. Persistent Volume Claim (PVC) Status:
   * The PVC named mongodb-pvc shows a status of "Bound", which confirms it has successfully claimed the PV
   * It is bound to the PV pvc-cc800919-bfbd-462e-a449-de2cd70ce2d0, confirming a connection between the PVC and the PV.

### Summary
* **mongodb-pv** is a Persistent Volume that is currently available and not bound to any PVC.
* **pvc-cc800919-bfbd-462e-a449-de2cd70ce2d0** is a Persistent Volume that is bound to the PVC named mongodb-pvc.
* **mongodb-pvc** is a Persistent Volume Claim that is successfully bound to the PV pvc-cc800919-bfbd-462e-a449-de2cd70ce2d0.

This setup ensures that your MongoDB data is stored persistently, even if the MongoDB pod is deleted or rescheduled.

<br>

## Delete MongoDB Pod/Deployment and Re-create:
* `kubectl delete deployment mongo`
* `kubectl apply -f mongodb-deploy.yml`

### Deletion Commands
* `kubectl delete service mongodb-svc`
* `kubectl delete service sparta-app-svc` 
* `kubectl delete deployment mongodb-deployment`
* `kubectl delete deployment sparta-app-deployment`

### Creation Commands
* `kubectl create -f mongodb-deploy.yml`
* `kubectl create -f mongodb-service.yml`
* `kubectl create -f nodejs-deploy.yml`
* `kubectl create -f nodejs-service.yml`

### Check They're There
* `kubectl get all`
* `kubectl get pv`
* `kubectl get pvc`

<br> 

## Seed Manually 
Goal: log in to a pod and seed the database.

* ` kubectl get all` to see your pods.
* Copy this: 'sparta-app-deployment-b9c5777d7-662qj'

![alt text](./kube-images/8.png)

* With the 'winpty' command. 
  * `winpty kubectl exec -it sparta-app-deployment-b9c5777d7-662qj -- sh`

Why are we in the app folder?
* Because we set the working directory in the dockerfile. 

Now what?
* Check your env variable is present.
  * `printenv DB_HOST` or `echo $DB_HOST`

* Now seed the database.
  * `node seeds/seed.js`

![alt text](./kube-images/9.png)

* Refresh your terminal.
  * http://localhost:30003/posts

![alt text](./kube-images/10.png)

* Exit out.
  * `exit`

<br>

## Delete MongoDB Pod/Deployment and Re-create
* This is to check the replicaset will duplicate what you've deleted.

```yaml
kubectl delete deployment mongodb-deployment
kubectl apply -f mongodb-deploy.yml
```

## Check for Persistent Data
* Access your Node.js app and check if previously created entries (e.g., /posts page data) are still available. 
* This will confirm if the Persistent Volume setup is working correctly.

![alt text](./kube-images/11.png)

![alt text](./kube-images/12.png)

<br> 

## Diagram Layout
![alt text](./kube-images/13.png)

<br>

# Research Types of Autoscaling with K8s

## What is Autoscaling?
* Autoscaling in Kubernetes is a way to **automatically adjust** the **number of running pods** or the **resources allocated to them** based on the **current demand**. 
* This helps ensure that your application can handle varying loads efficiently without manual intervention.

<br>

## Types of Autoscaling in Kubernetes

### 1. Horizontal Pod Autoscaling (HPA)
* **What it does**: HPA automatically adjusts the number of pod replicas in a deployment, replica set, or stateful set based on observed CPU utilisation, memory usage, or custom metrics.
* **How it works**: The HPA controller periodically checks the metrics and scales the number of pods up or down to match the desired target utilisation.
* **Use case**: Ideal for applications with fluctuating workloads, such as web servers or APIs that experience varying traffic.

### 2. Vertical Pod Autoscaling (VPA)
* **What it does**: VPA automatically adjusts the CPU and memory requests and limits for containers in a pod.
* **How it works**: VPA monitors the resource usage of pods and updates their resource requests and limits to better match the actual usage.
* **Use case**: Useful for applications where the resource requirements change over time, such as batch processing jobs or data analytics workloads.

### 3. Cluster Autoscaling
* **What it does**: Cluster autoscaling adjusts the number of nodes in a Kubernetes cluster based on the resource requirements of the pods.
* **How it works**: When there are not enough resources to schedule new pods, the cluster autoscaler adds more nodes. 
  * Conversely, it removes nodes when they are underutilised.
* **Use case**: Helps manage the overall capacity of the cluster, ensuring that there are enough resources to run all scheduled pods efficiently.

### 4. Kubernetes Event-Driven Autoscaling (KEDA)
* **What it does**: KEDA allows you to scale your Kubernetes workloads based on external events. It extends the capabilities of Kubernetes autoscaling by enabling you to scale applications based on custom metrics and external event sources, such as message queues, databases, or cloud services.

* **How it works**:
  * **Event-Driven Scaling**: KEDA can scale your applications based on events from various sources, such as Azure Event Hubs, Kafka, RabbitMQ, and more.
  * **Custom Metrics**: KEDA allows you to define custom metrics for scaling, enabling you to scale your applications based on specific business requirements.
  * **Integration with HPA**: KEDA works alongside the Horizontal Pod Autoscaler (HPA) to provide seamless scaling based on both resource utilization and external events.
  * **Scalers**: KEDA supports a wide range of scalers, which are responsible for connecting to external event sources and providing metrics for scaling. Some popular scalers include Azure Monitor, AWS CloudWatch, Prometheus, and more.

* **Use case**: KEDA is particularly useful for applications that experience variable workloads and need to respond quickly to changes in demand. For example:
  * **E-commerce Platforms**: Scale up during peak shopping times and scale down during off-peak hours.
  * **IoT Applications**: Handle bursts of data from IoT devices by scaling up processing capabilities when needed.
  * **Event-Driven Architectures**: Automatically scale based on events from message queues or other event sources, ensuring that your application can handle varying loads efficiently.

![alt text](./kube-images/auto-diagram.png)

<br>

## Difference Between Vertical and Horizontal

| Feature                     | Horizontal Pod Autoscaling (HPA)                                      | Vertical Pod Autoscaling (VPA)                                      |
|-----------------------------|-----------------------------------------------------------------------|---------------------------------------------------------------------|
| **Scaling Direction**       | Scales the number of pods horizontally (increases or decreases the number of pod replicas) | Scales the resources allocated to each pod vertically (adjusts CPU and memory requests and limits) |
| **Resource Management**     | Focuses on distributing the load across multiple pods                | Focuses on optimizing the resource allocation for individual pods   |
| **Implementation**          | Requires setting up metrics to monitor and define target utilization thresholds | Requires setting up policies to monitor resource usage and adjust resource requests and limits |
| **Use Case**                | Ideal for applications with fluctuating workloads, such as web servers or APIs that experience varying traffic | Useful for applications where the resource requirements change over time, such as batch processing jobs or data analytics workloads |
| **Example**                 | Automatically adds more pod replicas to handle increased traffic for a web application | Increases memory limits for a data processing job to ensure it completes successfully |

<br>

## Benefits of Autoscaling
* **Efficiency**: Automatically adjusts resources to match demand, reducing costs and improving performance.
* **Reliability**: Ensures that applications remain responsive under varying loads.
* **Scalability**: Easily handles growth in application usage without manual intervention.

<br>

# The key components of Kubernetes autoscaling
* With this feature, you always have enough resources for the workload, and when a node becomes unhealthy it gets replaced without affecting the workload. 
* You need to provide the scheduler with information about your Pods, so it can make the right decisions when scheduling them.

The following components are needed to truly benefit from the autoscaling feature of Kubernetes;

1. Resource Request
2. Pod Disruption Budget
3. Horizontal Pod Autoscaler
4. Cluster Autoscaler

![alt text](./kube-images/autoscaling.png)

Source: https://timdepater.com/articles/kubernetes-autoscaling-components/

## 1. Resource Request
* When you configure a Pod, you specify how much of each resource it needs. 
* The most common resources to specify are CPU and memory, but there are others.

Per Pod you can specify;
* The amount of CPU & memory you expect this Pod needs; the request.
* The amount of CPU & memory you’re allowing the Pod to use; the limit.
* The scheduler takes the resource request into account when determining which node has the resources available to run this Pod. 
* When there is not a node available that would fit the Pod’s resource request, the Pod goes to the Pending state.
* The Cluster Autoscaler will notice a Pod is pending because of a lack of resources and acts upon it by adding a new node.

<br>

### Configuring the resource request
* The resource request is configured per Pod like this;

```yaml
resources:
  requests:
    cpu: "200m"
    memory: "128Mi"
```

To come up with sane values for CPU & memory you can take the following into account;
* `kubectl top pods -A` shows the actual CPU & memory usage of all Pods. 
  * Be aware that this is a snapshot of that moment, it’s better to gather this information from a monitoring system that can show the trend over a longer period.
* **CPU** is a resource that can overbooked, if the actual usage is higher than defined in the resource request then this could result in performance issues but the Pod wouldn’t get evicted because of it.
* **Memory** can’t be overbooked and is reserved based on the resources request. 
  * When a Pod is using more memory than configured and the node runs out of memory the scheduler could evict this Pod.

### Pod Disruption Budget


<br>

## 2. Pod Disruption Budget
* Pod disruption budgets allow you to configure the number of Pods that can be down simultaneously from voluntary disruptions. 
* Voluntary disruptions are mostly triggered by the application owner or cluster administrator. 
* This happens for example when a deployment is changed or a node is drained. 
* The scheduler makes sure that when it’s evicting Pods, it keeps enough Pods running from the same deployment, statefulset or other controllers to don’t exceed the Pod disruption budget.

> The cluster autoscaler is performing cluster administrator actions like draining a node to scale the cluster down. That’s why it’s important to configure these correctly when you want the cluster to autoscale and auto-heal.

Example of a Pod Disruption Budget that allows for 1 Pod to be unavailable at the same time.
```yaml
apiVersion: policy/v1beta1
kind: PodDisruptionBudget
metadata:
  name: myapp
spec:
  maxUnavailable: 1
  selector:
    matchLabels:
      app: myapp
```

<br>

## 3. Horizontal Pod Autoscaler
* With a Horizontal Pod Autoscaler, you specify which metrics decide if the number of replicas should scale up or down. 
* You can use per-Pod resource metrics like CPU and memory or custom metrics like the number of requests/second, the Pod is receiving.

Resource metrics can be defined as utilisation value, e.g.;

```yaml
metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 90
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 90
```

* When you define the metric as utilisation value it will be calculated as the percentage of the configured resource request.

<br>

## 4. Cluster Autoscaler
* The Cluster Autoscaler is the component that adjusts the size of the node pool so that all Pods have a place to run and there are no unneeded nodes.
* On most public cloud providers it’s part of the control plane which is managed by the provider. 
  * For AWS that’s not the case, you need to deploy it yourself.

### Adding a node
* The Cluster Autoscaler will monitor the Pods and decide to add a node when a Pod needs to be scheduled and there aren’t sufficient resources for the resource request of that Pod.

This works as follows;

1. A new Pod is created
2. The scheduler reads the resource request of the Pod and decides if there are enough resources on one of the nodes.
3. If there are, the Pod is assigned to the node.
4. If there aren’t, the Pod is set to the Pending state and can’t start.
5. The Cluster Autoscaler will detect a Pod is not able to schedule due to a lack of resources.
6. The Cluster Autoscaler will determine if the Pod could be scheduled when a new node is added (it could be due to (anti-) affinity rules that the Pod still can’t schedule on the newly created node).
7. If so, the Cluster Autoscaler will add a new node to the cluster.
8. The scheduler will detect the new node and schedule the Pod on the new node.

> Note: the scheduler is not capable of moving Pods to different nodes to make room for the new Pod. This can sometimes lead to inefficient use of resources.

<br>

### Removing a node
* The Cluster autoscaler will decide to remove a node when it has low utilisation and all of its important Pods can be moved to other nodes. 
* There are a few reasons which prevent a Pod from being moved to a different node. 
* To move a Pod it needs to be evicted and a new one needs to be started on a different node.

Reasons why a Pod can’t be moved;
* The Pod has a restrictive Pod Disruption Budget.
* The Pod is part of the kube-system namespace and doesn’t have a Pod Disruption Budget, or it’s too restrictive.
* The Pod isn’t backed by a controller object (so not created by deployment, replica set, job, statefulset, etc.).
* The Pod has local storage and doesn’t have the safe-to-evict annotation.
* The Pod can’t be moved due to various constraints (lack of resources, non-matching node selectors or (anti-) affinity, safe-to-evict annotation set to false, etc.)

> The logs of the Cluster Autoscaler can tell you the actual reason, but when the Cluster Autoscaler is managed by the cloud provider you don’t always have access to that log.

<br>

# Use Horizontal Pod Autoscaler (HPA) to scale the app
Task:
* Scale only the app (2 minimum, 10 maximum replicas).
* Test your scaler works by load testing.
* You could use Apache Bench (ab) for load testing.

<br>

## Steps to Implement HPA for Node.js Application
* Set up a Horizontal Pod Autoscaler (HPA) for scaling the Node.js app based on CPU utilisation.
* The HPA will automatically adjust the number of Pod replicas according to the load on the application.

## Install Apache
Source: https://www.apachelounge.com/download/

![alt text](./kube-images/17.png)

* create an alias for ab (alias ab=~/.apache/bin/ab.exe)
* `nano .bashrc`
* Insert: alias ab='~/.apache/bin/ab.exe'
* Ctrl+S, Ctrl+X


<br> 

## 1. Define HPA for Node.js App
* Ensure that your [nodejs-deploy.yml](../k8s-yaml-definitions/local-nginx-deploy/nodejs-deploy.yml) YAML file requests CPU resources. 
* This allows Kubernetes to monitor CPU usage and autoscale based on the defined limits.

```yaml
        resources:
          requests:
            cpu: "100m"     # Request 100 millicores (0.1 CPU)
          limits:
            cpu: "500m"     # Limit the app to 500 millicores (0.5 CPU)
```

* Apply this updated Deployment
  * `kubectl apply -f nodejs-deploy.yml`

<br> 

## 2. Create HPA
* Create an HPA that will scale the number of replicas between 2 and 10 based on CPU utilisation (for example, scaling up when CPU usage goes above 50%).

```yaml
# hpa.yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: nodejs-app-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: nodejs-app
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50  # Target 50% CPU utilization
```

* Apply the HPA configuration:
  * `kubectl apply -f hpa.yml`

<br>

## 3. Verify HPA Setup
* Check the status of the HPA to confirm it’s properly set up and monitoring the Node.js deployment.
* You should see output that lists the current and target CPU utilization, along with the desired replica count based on current load.
  * `kubectl get hpa`

![alt text](./kube-images/14.png)

<br>

## 4. Load Test with Apache Bench (ab)
* To simulate load on your application and test if the HPA scales the Pods, use Apache Bench (ab).
  * `ab -n 10000 -c 100 http://<Node.js-Service-External-IP>:<port>/`

* `-n 10000`: Total number of requests to send.
* `-c 100`: Number of concurrent requests.
* Replace `<Node.js-Service-External-IP>` and `<port>` with the external IP and port of your Node.js Service (you can get this by running kubectl get svc).

You will need:
* [nodejs-service.yml](../k8s-yaml-definitions/local-nginx-deploy/nodejs-service.yml) external IP. 
* Port number with the external IP. 

How to get the external IP:
* nano into the [](../k8s-yaml-definitions/local-nginx-deploy/nodejs-service.yml) yaml file and change "NodePort" to "LoadBalancer".

```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: sparta-app-svc
  namespace: default
spec:
  ports:
  - nodePort: 30003   # The port on each node where the service is exposed
    port: 80    # The port that the service listens on.
    targetPort: 3000    # The port on the pod that the service forwards traffic to.
  selector:
    app: sparta-app # Label to match service to deployment
  type: LoadBalancer # used to be NodePort, changed for external IP for hpa
```

* Apply and update these changes.
  * `kubectl apply -f nodejs-service.yml`
* Check this has refreshed.
  * `kubectl get services`

![alt text](./kube-images/15.png)

<br>

* To simulate load on your application and test if the HPA scales the Pods, use Apache Bench (ab).
  * `ab -n 20000 -c 200 http://localhost:30003/`

* To view if pods have been made:
  * `kubectl get pods`

![alt text](./kube-images/16.png)

<br>

## Install Metrics Server
1. Install Metrics Server
* This command installs the Metrics Server in your Kubernetes cluster. 
* The Metrics Server is responsible for collecting resource usage data (CPU and memory) from the nodes and pods in your cluster.

```yaml
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

2. Check Metrics Server Logs.
* This command retrieves the logs from the Metrics Server deployment in the kube-system namespace. 
* It helps you diagnose any issues with the Metrics Server by showing its log output.

```yaml
kubectl logs -n kube-system deployment/metrics-server
```

3. List Metrics Server Pods.
* This command lists all the pods in the kube-system namespace that have the label k8s-app=metrics-server. 
* It helps you verify that the Metrics Server pods are running.

```yaml
kubectl get pods -n kube-system -l k8s-app=metrics-server
```

<br>

## Steps to Fix the Metrics Server
1. Check Metrics Server Logs
   * Review the logs for the Metrics Server to identify any errors:
```yaml
kubectl -n kube-system logs deployment/metrics-server
```

2. Patch the Metrics Server Deployment
   * Since the logs previously indicated a TLS certificate validation error, let's ensure the Metrics Server is configured to bypass this validation. 
   * You can patch the deployment to add the --kubelet-insecure-tls argument:

```yaml
kubectl patch deployment metrics-server -n kube-system --type='json' -p='[
  {
    "op": "add",
    "path": "/spec/template/spec/containers/0/args/-",
    "value": "--kubelet-insecure-tls"
  }
]'
```
* This command adds the `--kubelet-insecure-tls` argument to the metrics server container.
* **Purpose**
  * The --kubelet-insecure-tls flag tells the metrics server to skip the verification of the kubelet's TLS certificates. 
  * This can be useful in environments where the kubelet is using self-signed certificates or certificates that are not signed by a trusted certificate authority (CA).
* You can do this manually by following the path: "/spec/template/spec/containers/0/args/-" and manually inserting "--kubelet-insecure-tls" into the right area. 
* Be careful of syntaxes! Make sure you're manually using spaces and NOT tabs. 

<br>

1. Verify the Metrics Server Deployment
   * After patching, check the status of the Metrics Server deployment again:
```yaml
kubectl get deployment -n kube-system metrics-server
```

1. Check Metrics Availability
   * Once the Metrics Server is running, verify that metrics are available:
```yaml
kubectl top nodes
kubectl top pods
```

1. Monitor HPA
   * After ensuring the Metrics Server is running and metrics are available, monitor the HPA to see if it starts reporting CPU metrics correctly:
```yaml
kubectl get hpa
```

<br>

# Delete & Create

## Delete all at once
* `kubectl delete /local-nginx-deploy`
* `kubectl apply /local-nginx-deploy`

## Delete MongoDB Pod/Deployment and Re-create:
* `kubectl delete deployment mongo`
* `kubectl apply -f mongodb-deploy.yml`

### Deletion Commands
* `kubectl delete service mongodb-svc`
* `kubectl delete service sparta-app-svc` 
* `kubectl delete deployment mongodb-deployment`
* `kubectl delete deployment sparta-app-deployment`
* `kubectl delete pvc mongodb-pvc`
* `kubectl delete pv mongodb-pv`

### Creation Commands
* `kubectl create -f mongodb-deploy.yml`
* `kubectl create -f mongodb-service.yml`
* `kubectl create -f nodejs-deploy.yml`
* `kubectl create -f nodejs-service.yml`
* `kubectl apply -f hpa.yml`

### Check They're There
* `kubectl get all`
* `kubectl get pv`
* `kubectl get pvc`

<br>

# Use MetalLB as a load balancer for the Sparta app deployment
Task:
MetalLB is a load-balancer implementation for bare-metal Kubernetes clusters, which can be used in a local setup.

* Aim: Create a working local deployment of the Sparta test app with database which uses MetalLB as the load balancer.
* Try to use the latest version of MetalLB

Include:
* PV and PVC for the database
* Autoscaling (HPA) for the app

Documentation to help: https://metallb.universe.tf/

> Warning! Be careful of just using ChatGPT to help you, as it will likely give you outdated steps.

Advice:
  * Keep it simple and use L2 mode and advertising rather BGP
* Part of your document should include:
  * Difference between the NodePort and LoadBalancer service, especially the purpose of ports specified in the YAML definition file
  * How to clean-up your deployment, and uninstall Metal LB

<br>

## Goal
* Deploy the Sparta test application along with a database on a local Kubernetes cluster, utilising MetalLB in Layer 2 (L2) mode as a LoadBalancer. 
* This setup will provide:
  * a public IP address for external access to the Sparta app.
  * create Persistent Volume (PV) and Persistent Volume Claim (PVC) for the database.
  * configure Horizontal Pod Autoscaling (HPA) for the Sparta app to manage traffic fluctuations.

<br>

## MetalLB Requirements
MetalLB requires the following to function:
* A **Kubernetes cluster**, running Kubernetes 1.13.0 or later, that does not already have network load-balancing functionality.
* A **cluster network** configuration that can **coexist with MetalLB**.
* Some **IPv4 addresses** for MetalLB to hand out.
* When using the L2 operating mode, **traffic on port 7946** (TCP & UDP, other port can be configured) **must be allowed between nodes**, as required by memberlist.

<br>

# Install MetalLB by Manifest
* MetalLB allows Kubernetes to expose services with a LoadBalancer IP for clusters without native cloud integration. 
* In this setup, we'll use Layer 2 (L2) mode, where MetalLB announces IP addresses directly to the local network.
* Make sure Docker Besktop is running Kubernetes.

![alt text](./kube-images/b.png)

* Open a gitbash window and `docker login` to cover your back.
* In a gitbash window, install MetalLB.

```bash
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.8/config/manifests/metallb-native.yaml
```

![alt text](./kube-images/
* Apply the manifest:
  * `kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.8/config/manifests/metallb-native.yaml`

![alt text](./kube-images/c.png)

### What This Command Does:
Fetches the Manifest:
* The command downloads the MetalLB manifest file from the specified URL.

Applies the Manifest:
* The command applies the manifest to your Kubernetes cluster, creating the necessary resources for MetalLB to function. 
* This includes deploying the MetalLB controller and speaker components.

<br>

## Configure MetalLB in L2 mode
* Create a configuration file within your 'local-nginx-deploy' folder called 'metallb-config.yml', with an IP range suitable for your local network. 

### Finding Your IP Range
On Windows
* Open Command Prompt: Press the Windows key, type cmd, and hit Enter.
* Run the ipconfig Command: Type `ipconfig` and press Enter. 
* Look for the "Default Gateway" under your network connection. 
  * This is your router's IP address.

![alt text](./kube-images/d.png)

From the ipconfig output, we can see the following details for your WiFi connection:

* **IPv4 Address**: 192.168.1.114
* **Subnet Mask**: 255.255.255.0
* **Default Gateway**: 192.168.1.254

### Calculating the IP Range
* Given the subnet mask: 255.255.255.0,
* Your IP range is within the 192.168.1.x range. 
* Specifically, the usable IP addresses range from 192.168.1.1-192.168.1.254.

<br>

## Configure MetalLB & Apply
* You can choose a subset of this range for MetalLB.
* The usable IP addresses range from 192.168.1.1-192.168.1.254.

```yaml
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: my-ip-pool
  namespace: metallb-system
spec:
  addresses:
  - 192.168.1.1-192.168.1.254
```

* Apply the [metallb-config.yml](../k8s-yaml-definitions/local-nginx-deploy/metallb-config.yml) file.
  * `kubectl apply -f metallb-config.yml`

![alt text](./kube-images/e.png)

<br>

### Explanation
IPAddressPool:
* **apiVersion**: Specifies the API version for MetalLB resources.
* **kind**: Defines the type of resource, which is IPAddressPool in this case.
* **metadata**: Contains metadata about the resource, including its name (first-pool) and namespace (metallb-system).
* **spec**: Specifies the details of the IP address pool, including the range of IP addresses (192.168.1.1-192.168.1.254) that MetalLB can use.

L2Advertisement:
* **apiVersion**: Specifies the API version for MetalLB resources.
* **kind**: Defines the type of resource, which is L2Advertisement in this case.
* **metadata**: Contains metadata about the resource, including its name (l2-advertisement) and namespace (metallb-system).

> The IPAddressPool resource defines a pool of IP addresses that MetalLB can use to assign to services. The L2Advertisement resource configures MetalLB to announce these IP addresses using Layer 2 (L2) mode, making them accessible on the local network.

<br> 

## Apply your PV and PVC file

```yaml
kubectl apply -f mongodb-pv.yml
kubectl apply -f mongodb-pvc.yml
```

<br>

## Deploy the Database

```yaml
kubectl create -f mongodb-deploy.yml
kubectl create -f mongodb-service.yml
```

## Deply Sparta App

```yaml
kubectl create -f nodejs-deploy.yml
kubectl create -f nodejs-service.yml
```

## Enable Autoscaling (HPA)

```yaml
kubectl apply -f hpa.yml
```

<br>

## Verify the Deployment
* The output should show an EXTERNAL-IP assigned to sparta-app. 
* You can access the app via this IP.

```yaml
kubectl get services
```

![alt text](./kube-images/f.png)

<br>

## Access Service
* You can now see your app with 'localhost' in the search bar. 

<br>


# Delete & Create

### Delete all at once:
```bash
kubectl delete service mongodb-svc && \
kubectl delete service sparta-app-svc && \
kubectl delete deployment mongodb-deployment && \
kubectl delete deployment sparta-app-deployment && \
kubectl delete pvc mongodb-pvc && \
kubectl delete pv mongodb-pv && \
kubectl delete -f hpa.yml && \
kubectl delete -f metallb-config.yml
```

### Create all at once
* `kubectl apply -f metallb-config.yml`
* `kubectl apply -f app-lb-service.yml`
* `kubectl apply -f mongodb-pv.yml`
* `kubectl apply -f mongodb-pvc.yml`
* `kubectl create -f mongodb-deploy.yml`
* `kubectl create -f mongodb-service.yml`
* `kubectl create -f nodejs-deploy.yml`
* `kubectl create -f nodejs-service.yml`
* `kubectl apply -f hpa.yml`

```bash
kubectl apply -f metallb-config.yml && kubectl apply -f mongodb-pv.yml && kubectl apply -f mongodb-pvc.yml && kubectl create -f mongodb-deploy.yml && kubectl create -f mongodb-service.yml && kubectl create -f nodejs-deploy.yml && kubectl create -f nodejs-service.yml && kubectl apply -f hpa.yml
```

### Check They're There
* `kubectl get all`
* `kubectl get pv`
* `kubectl get pvc`
* `kubectl get services`

<br>

# Local Stack
* LocalStack is an open-source tool that simulates AWS cloud services on a local machine, allowing developers to develop, test, and deploy cloud applications without needing an active AWS account or incurring AWS charges. 
* It replicates a variety of AWS services, like S3, Lambda, DynamoDB, and more, locally, enabling developers to mimic their cloud infrastructure for testing and development.

<br>

# Setup minikube on a cloud instance running Ubuntu 22.04 LTS
Task:
Aim: Get minikube running on a cloud instance
* Use a cloud instance, either:
  * An AWS EC2 instance (size: t3a.small) or
  * An Azure VM (size: standard_b2pls)
  * Image: Ubuntu 22.04 LTS

<br>

# AWS EC2
* Launch a t3a.small instance with Ubuntu 22.04 LTS as the AMI.

## Provision Your Cloud Instance
Launch an EC2 Instance:
* Instance Type: t3a.small
* AMI: Ubuntu 22.04 LTS
* Security Group: Ensure ports 22 (SSH) and 8443 (Kubernetes API) are open.

![alt text](./kube-images/sg.png)

<br>

## Connect to Your Instance
* Navigate to .ssh folder.
* Navigate to "Connect" on AWS and log in via key in .ssh folder. 

## Update System Packages
```bash
sudo apt update && sudo apt upgrade -y
```

## Install MiniKube & Binary
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

![alt text](./kube-images/curl.png)

* Successfully downloaded the Minikube binary to your instance. 
* The output shows that the file minikube-linux-amd64 was downloaded with a size of 99.0 MB.
* Install the Minikube binary to make it executable: `sudo install minikube-linux-amd64 /usr/local/bin/minikube`. 

### Check Version
* `minikube version`

![alt text](./kube-images/ver.png)

<br>

## Install Docker
```bash
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
newgrp docker
```

* Check the version:
  * `docker --version`

![alt text](./kube-images/vers.png)

## Install Kubectl
```bash
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```

![alt text](./kube-images/insta.png)

* Check the version:
  * `kubectl version --client`
* This command will display the version of kubectl installed on your system. 
* If you see the version information, it means kubectl has been installed correctly.

![alt text](./kube-images/versi.png)

<br>

## Start Minikube
```bash
minikube start --driver=docker
```

![alt text](./kube-images/start.png)

### Explanation
* Minikube has successfully started on your cloud instance running Ubuntu 22.04 LTS. 
* The output indicates that Minikube is up and running, and kubectl is configured to use the "minikube" cluster and "default" namespace by default.
* Use kubectl to interact with your Minikube cluster.
  * For example, you can check the status of your nodes and pods:
  * `kubectl get nodes`
  * `kubectl get pods -A`
  * `kubectl get all`

![alt text](./kube-images/kubectl-cmd.png)

<br> 

# Delete Minikube and all related resources from your cloud instance
## 1. Stop and Delete Minikube Cluster
* Stop the Minikube cluster and delete it.
```bash
minikube stop
minikube delete
```

![alt text](./kube-images/stop.png)

<br>

## 2. Uninstall Minikube
* Remove the Minikube binary.
```bash
sudo rm /usr/local/bin/minikube
```

## 3. Uninstall Kubectl
* Remove the kubectl binary.
```bash
sudo rm /usr/local/bin/kubectl
```

## 4. Uninstall Docker
```bash
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io
sudo apt-get autoremove -y --purge docker-ce docker-ce-cli containerd.io
```

## 5. Clean Up Docker Data
* Remove Docker data directories.
```bash
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

## 6. Verify Removal
* Check that Minikube, kubectl, and Docker have been removed.
```bash
minikube version
kubectl version --client
docker --version
```

![alt text](./kube-images/deletev.png)

<br> 

# Tasks not yet done:

<br>

# Deploy on three apps on one cloud instance running minikube
Task:
* **Aim**: Deploy three apps on minikube that will all run at the same time and be exposed to the outside world at different endpoints.

First app deployment:
* Should use a NodePort service at NodePort 30001
* Use image daraymonsta/nginx-257:dreamteam with container port 80 (or use your own image)
* App container should have 5 replicas
* Use Nginx web server installed on the same cloud instance and configure reverse proxy to expose the app:
* App should be accessed from the outside on <instance's public IP address> (default HTTP port)

Second app deployment:
* Use a LoadBalancer service at port 9000, NodePort of LoadBalancer service 30002
* Use minikube tunnel to emulate a load balancer on the same cloud instance
* Use image daraymonsta/tech201-nginx-auto:v1 with container port 80 (or use your own image)
* App container should have 2 replicas
* Use Nginx web server installed on the same cloud instance and configure reverse proxy to expose the app:
* App should be accessed from the outside on <instance's public IP address>:9000

Third app deployment:
* Deploy hello-minikube as the third app.
* Use official documentation to help: https://kubernetes.io/docs/tutorials/hello-minikube/
* Use a LoadBalancer service at port 8080, NodePort of LoadBalancer service does not
* need to be specified
* Use minikube tunnel to emulate the load balancer on the same cloud instance (use the same tunnel service you already used for the second app's deployment)
* Use Nginx web server installed on the same cloud instance and configure reverse proxy to expose the app:
  * App should be accessed from the outside on <instance's public IP address>/hello

In your documentation, include:
* Specifics on how and why use minikube tunnel
* How you cleanup and remove each deployment
* How to get Kubernetes working again after restarting the cloud instance

<br>

# Using Terraform: Infrastructure Setup for Minikube Deployment

## 1. AWS Provider Configuration
The provider block defines the AWS region where your infrastructure will be created.
```bash
# Provider
provider "aws" {
  # Which region we use
  region = "eu-west-1"
}
```

* **region**: The region to deploy the resources (in this case, eu-west-1).

## 2. Security Group Creation
This block defines a security group for the Minikube EC2 instance, which controls the inbound and outbound traffic.

```bash
# Security group
resource "aws_security_group" "minikube_sg" {
  name = var.sg_name
  # Tags
  tags = {
    Name = var.sg_name
  }
}
```

* **name**: The security group name is provided by the variable sg_name.
* **tags**: The security group is tagged with the same name (sg_name) for identification.

## 3. Security Group Ingress Rules
These blocks define the rules for allowing inbound traffic to the EC2 instance. Each rule specifies which ports should be open for incoming traffic.

### Allow SSH (Port 22)

```bash
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_22" {
  security_group_id = aws_security_group.minikube_sg.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  cidr_ipv4         = var.vpc_ssh_inbound_cidr
  tags = {
    Name = "Allow_SSH"
  }
}
```

* **from_port**: Allows traffic on port 22 (SSH).
* **cidr_ipv4**: Restricts access to the specified CIDR block (provided by vpc_ssh_inbound_cidr).

### Allow HTTP (Port 80)

```bash
resource "aws_vpc_security_group_ingress_rule" "allow_http_80" {
  security_group_id = aws_security_group.minikube_sg.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  cidr_ipv4         = var.vpc_ssh_inbound_cidr
  tags = {
    Name = "Allow_http"
  }
}
```

* **from_port**: Allows traffic on port 80 (HTTP).

### Allow HTTP on Port 9000

```bash
resource "aws_vpc_security_group_ingress_rule" "allow_http_9000" {
  security_group_id = aws_security_group.minikube_sg.id
  from_port         = 9000
  ip_protocol       = "tcp"
  to_port           = 9000
  cidr_ipv4         = var.vpc_ssh_inbound_cidr
  tags = {
    Name = "Allow_9000"
  }
}
```

* **from_port**: Allows traffic on port 9000 (used by your Minikube service or Nginx proxy).

### Allow All Outbound Traffic

```bash
resource "aws_vpc_security_group_egress_rule" "allow_out_all" {
  security_group_id = aws_security_group.minikube_sg.id
  ip_protocol       = "All"
  cidr_ipv4         = var.vpc_ssh_inbound_cidr
  tags = {
    Name = "Allow_Out_all"
  }
}
```

* **egress rule**: Allows all outbound traffic from the EC2 instance.

<br>

## 4. EC2 Instance Configuration
This block creates an EC2 instance that will run the Minikube setup.

```bash
# Resource to create
resource "aws_instance" "minikube_instance" {
  # AMI ID ami-0c1c30571d2dae5c9 (for ubuntu 22.04 lts)
  ami = var.app_ami_id

  instance_type = var.instance_type

  # Public ip
  associate_public_ip_address = var.associate_pub_ip

  # Security group
  vpc_security_group_ids = [aws_security_group.minikube_sg.id]

  # SSH Key pair
  key_name = var.ssh_key_name

  # Name the resource
  tags = {
    Name = var.instance_name
  }
}
```

* **ami**: The AMI ID for the Ubuntu 22.04 LTS image (provided via variable app_ami_id).
* **instance_type**: The type of EC2 instance to be created (provided via instance_type variable).
* **associate_public_ip_address**: Whether the instance should be assigned a public IP (controlled by associate_pub_ip variable).
* **vpc_security_group_ids**: Attaches the previously created security group (minikube_sg) to the EC2 instance.
* **key_name**: The SSH key used to access the EC2 instance (ssh_key_name).
* **tags**: Tags the EC2 instance with a name (instance_name).

<br>

# Variables
The variables used in the code are placeholders that need to be defined in a terraform.tfvars or similar file. Examples of variables:

```bash
variable "sg_name" {
  type        = string
  description = "The name of the security group"
}

variable "vpc_ssh_inbound_cidr" {
  type        = string
  description = "CIDR block for inbound SSH access"
}

variable "app_ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "The EC2 instance type"
}

variable "associate_pub_ip" {
  type        = bool
  description = "Whether to associate a public IP"
}

variable "ssh_key_name" {
  type        = string
  description = "The SSH key name"
}

variable "instance_name" {
  type        = string
  description = "The name tag for the EC2 instance"
}
```

<br>

# Output
* The output file in Terraform captures and displays the results of the deployment, such as the public IP address of the EC2 instance. 
* This is especially useful for accessing the instance remotely or configuring other services. 
* By defining an output block in Terraform, we can ensure that the public IP address of the EC2 instance is easily accessible after the infrastructure has been created. 
* This IP address is crucial for accessing the Minikube deployment externally, whether it’s for testing or production purposes. 

Below is an example of how to capture and display the public IP address of the EC2 instance:

```bash
output "instance_public_ip" {
  value = aws_instance.minikube_instance.public_ip
  description = "The public IP address of the Minikube EC2 instance"
}
```

With this output, after applying the Terraform configuration, you can retrieve the public IP address of the instance, which will allow you to access the Minikube services running inside the EC2 instance, such as through a web browser or via API calls.

> This Terraform code creates the necessary security groups and EC2 instance to run your Minikube deployment, allowing inbound access for SSH (port 22), HTTP (port 80), and port 9000 for reverse proxy access. It also defines outbound traffic rules and associates the instance with a public IP for external access.

<br>

## Minikube Deployment with NodePort and Nginx Reverse Proxy
This guide explains how to set up a Minikube deployment with a NodePort service and configure Nginx to forward traffic to your service.
* You can manually create an EC" Instance or via Terraform. 

### Step 1: Define the Kubernetes Service with NodePort
Create a Kubernetes service configuration file, first-app-service.yml, with the following content:

```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: sparta-app-svc-1
  namespace: default
spec:
  ports:
    - nodePort: 30001  # External port on the host for accessing the service
      port: 3000        # Internal port inside the container
      targetPort: 3000  # Port where the app is running in the pod
  selector:
    app: sparta-app-1  # Label to match service to deployment
  type: NodePort
```

In this configuration:
* **nodePort** (30001): This is the port exposed on your Minikube host for accessing the service externally.
* **port** (3000): This is the port used internally within your Kubernetes cluster.
* **targetPort** (3000): This is the port the application is listening to within the pod.
* **type**: NodePort: This exposes the service on a static port (30001) on the host, making it accessible externally.

<br>

### Step 2: Apply the Kubernetes Service Configuration
Apply the configuration using Minikube to create the service:

```bash
minikube kubectl -- apply -f app-deployment.yml
```

This command will create the sparta-app-svc-1 service with a NodePort of 30001 to expose your app externally.

### Step 3: Get the Minikube IP Address
To access the service externally, first retrieve the IP address of your Minikube instance:

```bash
minikube ip
```

This will return the IP address where Minikube is running (e.g., 192.168.49.2). Use this IP to configure Nginx.

### Step 4: Configure Nginx as a Reverse Proxy
Next, configure Nginx to forward incoming traffic on port 80 to the NodePort (30001) of the Minikube service. Edit your Nginx configuration:

```bash
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name _;

    access_log /var/log/nginx/access_80.log;
    error_log /var/log/nginx/error_80.log;

    location / {
        proxy_pass http://192.168.49.2:30001;  # Replace with your Minikube IP and NodePort
    }
}
```

### Step 5: Test and Reload Nginx Configuration
1. Test the Nginx configuration for syntax errors:
```bash
sudo nginx -t
```

2. Reload Nginx to apply the changes:
```bash
sudo systemctl reload nginx
```

3. Check the status of Nginx to ensure it is running properly:
```bash
sudo systemctl status nginx
```

### Step 6: Access Your Application
Now, you can access your application via http://<your-ec2-instance-ip> on port 80, and Nginx will forward the requests to the Minikube service running on port 30001.

## Recap of the Setup
* **Kubernetes Service**: Defined as NodePort to expose the app on port 30001.
* **Minikube Tunnel**: Not required since you’re using NodePort, but Minikube IP is used in the Nginx configuration.
* **Nginx Reverse Proxy**: Configured to forward traffic from port 80 to Minikube’s IP and NodePort (30001).

This setup enables external access to your Minikube service through the EC2 instance with Nginx acting as the reverse proxy.

<br>

## App 2: Tunnel & LoadBalancer Deployment. 
App Deployment
```yaml
---
# SPARTA APP DEPLOYMENT
apiVersion: apps/v1  # specify api to use for deployment
kind : Deployment  # kind of service/object you want to create
metadata:
  name: app-deployment-2
spec:
  selector:
    matchLabels:
      app: sparta-app-2 # look for this labe/tag to match the k8n service

  # Creaate a ReplicaSet with instances/pods
  replicas: 5
  template:
    metadata:
      labels:
        app: sparta-app-2
    spec:
      containers:
      - name: sparta-app-2
        image:  shonifari8/sparta-app:v1
        ports:
        - containerPort: 3000
```

## Setting Up Minikube Tunnel with a LoadBalancer
This guide will help you expose a Kubernetes service on Minikube using a LoadBalancer, with traffic routed through Nginx.

### Step 1: Define the Kubernetes Service as a LoadBalancer
Create a service configuration file, app-deployment.yml, with the following content:

```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: sparta-app-svc-2
  namespace: default
spec:
  ports:
    - protocol: TCP
      port: 30002           # This is the port your clients will use.
      targetPort: 3000       # This is the port your application is running on.
  selector:
    app: sparta-app-2        # Label to match service to deployment
  type: LoadBalancer
```

In this configuration:
* **port** (30002) is the external port exposed by the service.
* **targetPort** (3000) is the port on which your app is running inside the pod.
* **type**: LoadBalancer will make the service accessible through a LoadBalancer IP.

Apply the configuration using Minikube:
```bash
minikube kubectl -- apply -f app-deployment.yml
```

### Step 2: Start Minikube Tunnel
Run minikube tunnel on your machine to set up the LoadBalancer IP:
```bash
minikube tunnel
```

> Note: Running minikube tunnel may require root privileges and will keep the LoadBalancer IP accessible while it's active.

### Step 3: Check the LoadBalancer IP
After starting minikube tunnel, get the external IP assigned to your service:
```bash
minikube kubectl -- get services sparta-app-svc-2

# EXTERNAL-IP: 192.168.49.3
```

The EXTERNAL-IP column will display the IP assigned by Minikube.

### Step 4: Configure Nginx as a Reverse Proxy
Edit your Nginx configuration to forward requests on port 9000 to the LoadBalancer IP and port 30002:
```yaml
server {
    listen 9000;
    listen [::]:9000;
    server_name _;

    access_log /var/log/nginx/access_9000.log;
    error_log /var/log/nginx/error_9000.log;

    location / {
        proxy_pass http://192.168.49.3:30002;  # Replace with your LoadBalancer IP and port.
    }
}
```

### Step 5: Test and Reload Nginx Configuration
1. Test the Nginx configuration for syntax errors:
```bash
sudo nginx -t
```

2. If the test passes, reload Nginx to apply the changes:
```bash
sudo systemctl reload nginx
```

3. Check the Nginx status to ensure it’s running:
```bash
sudo systemctl status nginx
```

### Step 6: Access Your Application
Now, you can access your application through http://<your-ec2-instance-ip>:9000, which will route traffic to your Minikube service via the LoadBalancer.

> This setup allows your EC2 instance to forward traffic to your Minikube cluster using an emulated LoadBalancer. Remember to keep minikube tunnel running as it provides the external IP for your LoadBalancer service.

<br>

# Create Bash script to provision minikube
Task:
The Bash script should...
* work:
  * on a fresh AND not-so-fresh instance
  * when run logged in as ubuntu user AND as user data
* provision:
  * Docker and minikube
  * Any minikube addons needed
  * Nginx and setup the reverse proxy to expose the required NodePort when going to the public IP of the instance

<br>

## Key Concepts
### Why We Need to Restart the Script with Docker Group Permissions
* Adding the ubuntu user to the docker group doesn't take effect immediately.
* Normally, group changes require the user to log out and log back in.
* Since the script runs in a **non-interactive environment**, we can't rely on logout/login.
* We use the `exec sg docker "$0"` command to **restart the script** with the **new group permissions**.

### Effect of sg docker "$0"
* This command **re-runs the script in a new shell** session where the **ubuntu user is part of the docker group**.

### Why This Is Necessary
* Minikube needs **non-root Docker access** to start containers.
* **Re-running the script** ensures the **ubuntu user** has **immediate Docker access without logging out and back in**, allowing Minikube to start successfully.

### Why We Avoid Running Minikube as Root
* **Security Concerns**: Running Minikube as root gives all Kubernetes containers and components root-level access, creating security risks.
* **Docker Permission Management**: The Docker daemon runs as root, but giving docker group access to the ubuntu user allows Minikube to manage containers without root permissions.
* **Environment Consistency**: Using a non-root user aligns with Kubernetes' principle of running applications with the minimum necessary privileges, preventing unintentional system changes and limiting the impact of misconfigurations.

> By re-running the script with docker group permissions for the ubuntu user, we ensure Minikube operates with restricted privileges, following best practices for security and maintainability.

<br>

## Overview of Steps
1. **Provision Docker**: Installs Docker and configures permissions for the ubuntu user.
2. **Provision Minikube**: Installs Minikube and sets it to use Docker as its driver.
3. **Start Minikube**: Starts Minikube as the ubuntu user.
4. **Provision Nginx**: Installs and configures Nginx to act as a reverse proxy to Minikube’s exposed service.

<br>

# 1. Installing and Configuring Docker
The first part of the script updates system packages, installs Docker, and adds the ubuntu user to the Docker group.

```yaml
# Update and upgrade system packages
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install dependencies and add Docker's GPG key
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker's repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker packages
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Adding the ubuntu User to the Docker Group
After Docker is installed, the ubuntu user is added to the Docker group to allow non-root access to Docker. The script then re-executes itself using exec sg docker "$0" to apply the group change without requiring a logout/login.

```yaml
# Check if the 'ubuntu' user is in the docker group; add if not
if ! groups ubuntu | grep -q '\bdocker\b'; then
    sudo usermod -aG docker ubuntu
    echo "Restarting script to apply Docker group permissions..."
    exec sg docker "$0"
    exit
fi
```

<br>

# 2. Installing and Configuring Minikube
The script downloads and installs Minikube, setting it to use Docker as the driver.

```yaml
# Download Minikube binary
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Install Minikube binary
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

# Set Docker as the Minikube driver
minikube config set driver docker
```

# 3. Starting Minikube as the ubuntu User
To ensure Minikube runs with the correct permissions, it is started as the ubuntu user. This section runs the minikube start command and exports Minikube's IP address for later use.

```yaml
sudo -u ubuntu -i bash <<'EOF'
echo "Starting Minikube as 'ubuntu' user..."
minikube start
minikube status

# Get Minikube IP
MINIKUBE_IP=$(minikube ip)
echo "Exported Minikube IP: $MINIKUBE_IP"
EOF
```

## Breakdown of the code
* `**sudo -u ubuntu -i bash**`: This part of the command switches to the ubuntu user and initiates an interactive shell (-i) as ubuntu, which allows us to run commands in that user’s environment.
* `**<<'EOF'**`: This is a "Here Document" syntax, which allows us to run multiple commands within the sudo session as ubuntu. Everything between `<<'EOF'` and the closing EOF is executed in the ubuntu user’s environment.
* `**echo "Starting Minikube as 'ubuntu' user..."**`: Prints a message indicating that Minikube is starting under the ubuntu user.
* `**minikube start**`: Starts the Minikube cluster, using Docker as the container driver (which we configured earlier). By running this as ubuntu, it uses ubuntu’s environment and permissions.
* `**minikube status**`: Checks and prints the current status of Minikube, confirming that it’s running and which components are active.
* `**MINIKUBE_IP=$**`(minikube ip): Retrieves Minikube’s IP address and assigns it to the MINIKUBE_IP variable. This IP is useful for accessing Minikube services externally, such as setting up a reverse proxy.
* `**echo "Exported Minikube IP: $MINIKUBE_IP"**`: Prints the exported Minikube IP to confirm that it’s been successfully retrieved and stored.
* `**EOF**`: This signifies the end of the "Here Document," meaning all commands up to this point will be executed as the ubuntu user within the sudo -u ubuntu session.

This block:
* Switches to the ubuntu user.
* Starts Minikube as ubuntu, verifies its status, retrieves its IP address, and prints it.V

<br>

# 4. Installing and Configuring Nginx
The script installs Nginx and sets it up as a reverse proxy. It updates the Nginx configuration to proxy traffic from the server’s IP to the Minikube NodePort.

```yaml
# Install Nginx
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

# Configure Nginx reverse proxy to Minikube IP and port
sudo sed -i "s|try_files \$uri \$uri/ =404;|proxy_pass http://$MINIKUBE_IP:30001;|" /etc/nginx/sites-available/default

# Check for syntax errors and restart Nginx
sudo nginx -t
sudo systemctl restart nginx
```

# Final Output and Status
* The script outputs Minikube and Nginx statuses and configurations at each stage, ensuring each component is set up correctly before moving to the next. 
* This structured approach ensures Docker permissions are applied effectively, Minikube is correctly configured to use Docker, and Nginx routes traffic to Minikube services.

<br>

# Use Kubernetes to deploy the Sparta test app in the cloud
Task:
* Deploy containerised 2-tier deployment (app and database) on a single VM using Minikube
* Database should use a PV of 100 MB
* Use HPA to scale the app, min 2, max 10 replicas - load test to check it works
* Use NodePort service and Nginx reverse proxy to expose the app service to port 80 of the instance's public IP
* Make sure that minikube start happens automatically on re-start of the instance

<br>

## Objectives
* Deploy containerised 2-tier deployment (app and database) on a single VM using Minikube
* Database should use a PV of 100 MB
* Use HPA to scale the app, min 2, max 10 replicas - load test to check it works
* Use NodePort service and Nginx reverse proxy to expose the app service to port 80 of the instance's public IP
* Make sure that minikube start happens automatically on re-start of the instance

# Provisioning Script for Kubernetes Metrics Server and Application Deployment
This script uses Minikube’s kubectl command to provision and configure the Kubernetes Metrics Server, then deploys an application using a specified YAML file.

## Step 1: Apply Metrics Server Components
```yaml
minikube kubectl -- apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
``` 
Explanation:
* Downloads and applies the YAML manifest for the Kubernetes Metrics Server from the official repository. 
* The Metrics Server is a cluster add-on that collects resource usage data, such as CPU and memory, from nodes and pods, making it available for tools like kubectl top.

## Step 2: Patch the Metrics Server Deployment

```yaml
minikube kubectl -- patch deployment metrics-server -n kube-system --type='json' -p='[
  {
    "op": "add",
    "path": "/spec/template/spec/containers/0/args/-",
    "value": "--kubelet-insecure-tls"
  }
]'
```
Explanation: 
* Patches the Metrics Server deployment to add an argument that allows insecure TLS connections to the Kubelet. 
* This is often needed for local environments or self-signed certificates where secure Kubelet connections might not be available.
  * **Deployment**: `metrics-server`
  * **Namespace**: `kube-system`
  * **Patch Operation**: Adds the `--kubelet-insecure-tls` argument to the args list of the container specification, allowing it to bypass TLS certificate verification.

# Step 3: Restart the Metrics Server Deployment
```yaml
minikube kubectl -- rollout restart deployment metrics-server -n kube-system
```
Explanation: 
* Restarts the Metrics Server deployment in the kube-system namespace. 
* This restart ensures that the patched configuration takes effect.

# Step 4: Apply Application Deployment
```yaml
minikube kubectl -- apply -f app-deploy.yml
```
Explanation: 
* Deploys an application to the Kubernetes cluster using a configuration file (app-deploy.yml). 
* This YAML file should define the application’s deployment specifications, such as replicas, image, ports, etc.

# Step 5: Display All Resources
```yaml
minikube kubectl -- get all
```
Explanation: 
* Lists all Kubernetes resources (pods, services, deployments, etc.) in the current namespace, providing an overview of the cluster's current state and ensuring that the Metrics Server and application deployment are running correctly.

> This script automates the provisioning of the Metrics Server and application, applying essential configurations for both and verifying that all resources are up and running.

<br>