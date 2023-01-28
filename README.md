# Language Identification API

This is a simple API for identifying the language of a given text using the pre-trained model [FastText](https://fasttext.cc/docs/en/language-identification.html). The API is built using the FastText library for loading the pre-trained model and making predictions.

The API accepts a text string in a POST request to the endpoint `/` in JSON format and returns the identified language and confidence score in JSON format.

## How to run

### Clone the repository

```bash
git clone git@github.com:flexchar/language-identification-api.git
```

### Build the Docker image

```bash
docker build -t language-identification-api .
```

### Run the container

```bash
docker run -rm -p 8000:8000 language-identification-api
```

This will start the API endpoint on port 8000 of the container and map it to port 8000 on the host.Send a POST request to the endpoint with the text you want to identify.json

```json
curl -X POST -H "Content-Type: application/json" -d '{"text":"This is a sample text"}' http://localhost:8000/
```

This will return the identified language and confidence score.

### Note

Make sure you have Docker installed on your system before running the above commands. The pre-trained model 'lid.176.bin' is already available in the repo and is copied to the container during the build process. You may use the image pushed to the Github registry alongside this repo.

I've built this endpoint for use inside internal applications in a closed environment. For production, you may use reverse proxy such as Nginx or Apache to proxy the requests to Gunicorn, to have more control over the requests endpoint and supply with the TLS certificates.
