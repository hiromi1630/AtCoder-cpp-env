FROM gcc:12.2

# 必要なパッケージのインストール
RUN apt update && apt install -y --no-install-recommends \
    nodejs \
    npm \
    python3 \
    python3-pip \
    jq \
    gdb \
    libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*
    
# AtCoder用ツールのインストール    
RUN pip3 install online-judge-tools && \
    npm install -g atcoder-cli && \
    acc config default-task-choice all && \
    acc config default-test-dirname-format test

# テンプレート設定
RUN mkdir /root/.config/atcoder-cli-nodejs/cpp
COPY ./templates /root/.config/atcoder-cli-nodejs/cpp/
RUN acc config default-template cpp

