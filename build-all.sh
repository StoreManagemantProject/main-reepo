#!/bin/bash
ROOT_DIR=$(pwd)

for SERVICE_DIR in */; do
  if [ -f "$SERVICE_DIR/pom.xml" ]; then
    echo "📦 Building $SERVICE_DIR"
    cd "$SERVICE_DIR"
    
    mvn clean install -DskipTests
    docker build -t ${SERVICE_DIR%/}:latest .
    
    cd "$ROOT_DIR"
  fi
done