# Use an official Python runtime as a parent image
FROM python:buster

LABEL org.opencontainers.image.source https://github.com/flexchar/language-identification-api/
LABEL org.opencontainers.image.description="Fast language identification API using FastText"
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.authors="Lukas Va"

# Set the working directory in the container
WORKDIR /app

# Install the required libraries
RUN pip install fasttext Flask gunicorn

# Copy the pre-trained model to the container
COPY lid.176.bin .

# Copy the application code to the container
COPY app.py .

# Run the command to start the API endpoint
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
