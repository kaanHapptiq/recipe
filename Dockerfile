FROM python:3.12

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080
WORKDIR /app

COPY . ./

RUN pip install --no-cache-dir -r requirements.txt

HEALTHCHECK CMD curl --fail http://localhost:8080/_stcore/health

ENTRYPOINT ["streamlit", "run", "chef.py", "--server.port=8080", "--server.address=0.0.0.0"]
