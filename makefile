
APP_FRONT:=bms-frontend
APP_BACK:=bms-backend
REGISTRY_FRONT:=registry.gitlab.com/nguyencatpham/$(APP_FRONT):main
REGISTRY_BACK:=registry.gitlab.com/nguyencatpham/$(APP_BACK):master
USERNAME:=deploy
PASS_FRONT:=XLvHQhBZ-T2As4ftzsri
PASS_BACK:=7HKHKcHuoMQAz8difzez

.PHONY: all test clean

deploy:
	docker login registry.gitlab.com -u $(USERNAME) -p $(PASS_FRONT)
	docker pull $(REGISTRY_FRONT)
	docker login registry.gitlab.com -u $(USERNAME) -p $(PASS_BACK)
	docker pull $(REGISTRY_BACK)
	# docker-compose -f docker-compose.deploy.yml up -d 
	# docker-compose logs --tail=0 --follow
up:
	docker-compose up -d
	docker-compose logs --tail=0 --follow
down:
	docker-compose down
recreate:
	docker-compose up --force-recreate --build -d
	docker image prune -f
logs:
	docker-compose logs --tail=0 --follow
force-up: recreate logs 
