# DevOps Assessment: Containerized Next.js Application

This project demonstrates a complete CI/CD pipeline for a Next.js application. The application is containerized with Docker, automatically built and pushed to the GitHub Container Registry (GHCR) via GitHub Actions, and deployed to a local Kubernetes cluster using Minikube.

---

## Tech Stack

- **Application**: Next.js
- **Containerization**: Docker
- **CI/CD Automation**: GitHub Actions
- **Container Registry**: GitHub Container Registry (GHCR)
- **Container Orchestration**: Kubernetes (Minikube)

---

## Prerequisites

Before you begin, ensure you have the following tools installed on your local machine:
- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/products/docker-desktop/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

---

## How to Run Locally (Using Docker)

These steps show how to build and run the application as a Docker container on your local machine.

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/Krishna-Vallamsetty/devops-assessment-app.git](https://github.com/Krishna-Vallamsetty/devops-assessment-app.git)
    cd devops-assessment-app
    ```

2.  **Build the Docker image:**
    ```bash
    docker build -t nextjs-app-local .
    ```

3.  **Run the Docker container:**
    ```bash
    docker run -p 3000:3000 nextjs-app-local
    ```
    The application will now be accessible at **[http://localhost:3000](http://localhost:3000)**.

---

## Deployment to Minikube

These steps explain how to deploy the containerized application to your local Minikube cluster.

1.  **Start Minikube:**
    *Ensure Docker Desktop is running before this step.*
    ```bash
    minikube start
    ```

2.  **Apply the Kubernetes manifests:**
    This command reads the configuration files in the `k8s/` directory and creates the necessary Deployment and Service in the cluster.
    ```bash
    kubectl apply -f k8s/
    ```

3.  **Check the deployment status:**
    You can check the status of the pods to ensure they are running.
    ```bash
    kubectl get pods
    ```
    Wait for the status to show `Running`.

---

## Accessing the Deployed Application

Once the pods are running, use the following Minikube command to access the application.

1.  **Expose the service:**
    ```bash
    minikube service nextjs-app-service
    ```
    This command will automatically open the application's URL in your default web browser.
