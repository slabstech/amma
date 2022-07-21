FROM docker pull nvidia/cuda:11.7.0-base-ubuntu20.04
WORKDIR /app
RUN apt update && \
    apt install --no-install-recommends -y build-essential python3 python3-pip && \
    apt clean && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY . .
CMD ["echo", "CUDA"]