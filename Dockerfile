# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies including HDF5 and pkg-config
RUN apt-get update && apt-get install -y \
    build-essential \
    libhdf5-dev \
    pkg-config  # This package is necessary for h5py installation

# Optionally set HDF5_DIR if h5py cannot find the HDF5 installation
ENV HDF5_DIR=opt/homebrew

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV NAME World

# Run app.py when the container launches, including the model path
CMD ["python", "task1.py", "/app/mnist_model.h5"]
