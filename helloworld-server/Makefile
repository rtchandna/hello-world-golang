build:
	docker build -t helloworld-server .

run:
	docker run -d --name helloworld --restart unless-stopped -e LISTEN_PORT=8080 -p 8080:8080 helloworld-server
