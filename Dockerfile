# Use an official Python runtime as a parent image
FROM python:buster

# Set the working directory in the container
WORKDIR /app

# Install the required libraries
RUN pip install fasttext Flask

# Copy the pre-trained model to the container
COPY lid.176.bin .

# Copy the application code to the container
COPY app.py .

# Run the command to start the API endpoint
CMD ["python", "app.py"]
