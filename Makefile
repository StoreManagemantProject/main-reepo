.PHONY: build-all deploy clean

build-all:
	@echo "🚀 Building all services..."
	@./build-all.sh

deploy:
	@echo "🚀 Deploying to Kubernetes..."
	@kubectl apply -f helm/ --validate=false

clean:
	@echo "🧹 Cleaning up..."
	@find . -name "pom.xml" -execdir mvn clean \;
	@docker system prune -f