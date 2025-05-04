FROM python:3.12-slim

WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY main.py .

# Create volume mount points
RUN mkdir -p /app/data /app/models

# Environment variables
ENV PYTHONUNBUFFERED=1

# Entrypoint for the container
ENTRYPOINT ["python", "main.py"]

# Default command for training
CMD ["--epochs", "10", "--save-model"]