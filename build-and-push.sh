#!/bin/bash
# Exit on error
set -e

# Configuration
DOCKER_REGISTRY="kamikux"
TRAINING_IMAGE_NAME="mnist-training"
TAG="latest"

# Build the training image
echo "Building training image..."
docker build -t ${DOCKER_REGISTRY}/${TRAINING_IMAGE_NAME}:${TAG} -f Dockerfile .

# Push images to registry
echo "Pushing images to registry..."
docker push ${DOCKER_REGISTRY}/${TRAINING_IMAGE_NAME}:${TAG}

echo "Build and push completed successfully!" 