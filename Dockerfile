FROM slabstech/cuda-cpp
WORKDIR /app
RUN apt update && \
    apt install --no-install-recommends -y build-essential cmake && \
    apt clean && rm -rf /var/lib/apt/lists/*
COPY engine/ engine
RUN cmake engine/. -B build -DCMAKE_BUILD_TYPE=Release
#RUN cmake --build . --target all --verbose -j `nproc`
CMD ["echo", "CUDA"]