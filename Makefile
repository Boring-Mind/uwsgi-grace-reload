run:
	docker-compose up --build -d
	docker logs --follow uwsgi-reload-backend-1

stop:
	docker-compose down