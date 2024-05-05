# MNIST Digit Prediction with Dockerized FastAPI and Monitoring

## Overview

This project develops a Dockerized FastAPI application for MNIST digit prediction integrated with Prometheus and Grafana for comprehensive real-time monitoring and metrics visualization. The application is designed to run multiple instances in a clustered environment, simulating a robust production setup.

## Features

- **FastAPI for MNIST Prediction**: Implements an API to predict digits from MNIST dataset images using a pre-trained Keras model.
- **Docker Integration**: Ensures easy deployment and scalability by containerizing the FastAPI application.
- **Prometheus Monitoring**: Configured to scrape metrics from the FastAPI application to monitor its performance.
- **Grafana Visualization**: Utilizes Grafana for visualizing metrics from Prometheus in an insightful dashboard.
- **Scalability**: Demonstrates the application's capability to run as multiple instances, managed by Docker Compose.

## Requirements

Ensure you have Docker and Docker Compose installed on your machine. The application is built using Python 3.10.

## Installation

1. **Clone the Repository**

git clone https://github.com/visvig/cs5830-a7-2024

2. **Build the Docker Image**

docker build -t fastapi-mnist-app .

3. **Run the Docker Container**

docker run -p 8000:8000 --name fastapi_app_instance_tf_7 -v /Users/vishalvignesh/codes/cs5830-a7-2024/mnist_model.h5:/app/mnist_model.h5 fastapi-app

(or)

Run docker run -p 8000:8000 --cpus="1.0" --name fastapi_app_instance_8 -v /Users/vishalvignesh/codes/cs5830-a7-2024/mnist_model.h5:/app/mnist_model.h5 fastapi-app

Open another terminal

Run docker run -p 8001:8000 --cpus="1.0" --name fastapi_app_instance_9 -v /Users/vishalvignesh/codes/cs5830-a7-2024/mnist_model.h5:/app/mnist_model.h5 fastapi-app

remember to replace /Users/vishalvignesh/codes/cs5830-a7-2024/mnist_model.h5 with your local model path

5. **Monitoring Setup**
   
- Start Prometheus and Grafana locally to monitor the Docker containers:
  ```
  # Start Prometheus, use prometheus_task1.yaml for task 1, prometheus_task2_docker.yaml for tast 2
  curl -LO "https://github.com/prometheus/prometheus/releases/download/v2.40.0/prometheus-2.40.0.darwin-amd64.tar.gz"
  cd ~/prometheus-2.40.0.darwin-amd64
  ./prometheus --config.file=prometheus_task1.yaml

  # Start Grafana, assuming homebrew installed
  brew install grafana
  brew services start grafana
  ```
- Access the Prometheus at `http://localhost:9090`, check Status > Targets to confirm the Endpoint states to be "UP"
- Access the Grafana dashboard at `http://localhost:3000`.

## Usage

- **Swagger UI**: Access `http://localhost:8000/docs` to interact with the API.

## Monitoring and Metrics

Metrics include API usage, performance metrics (processing time per input character), CPU and memory usage, and network I/O.

## Configuration Files

- `Dockerfile` and `requirements.txt` for Docker configuration.
- `prometheus_task1.yaml` and `prometheus_task2_docker.yaml` for Prometheus monitoring settings.
- `task1.py` and `test_task1.py` for the FastAPI application and its tests.

## Grafana Visualization

- Import the provided Grafana dashboard configuration to visualize operational metrics.

## Additional Information

For a detailed discussion of the project setup and performance metrics, please refer to `ME20B204_A7_Report.pdf` in the repository. All the code, configurations, and documentation are maintained on GitHub with comprehensive README and inline comments.

---
