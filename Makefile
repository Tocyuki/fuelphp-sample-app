.PHONY: init setup

init:
	make docker.build
	make oil.create
	make docker.up
	make composer.update
	make composer.install

setup:
	make docker.build
	make db.migrate
	make docker.up
	make composer.update
	make composer.install

docker.up:
	docker-compose up -d

docker.down:
	docker-compose down

docker.build:
	docker-compose build

docker.build.app:
	docker-compose build app

docker.build.web:
	docker-compose build web

docker.build.db:
	docker-compose build db

oil.create:
	docker-compose run --rm app oil create .
	docker-compose run --rm app rm -f .travis.yml LICENSE.md README.md .gitignore

db.migrate:
	docker-compose run --rm app oil r migrate

composer.install:
	docker-compose run --rm --user=$$(id -u):$$(id -g) app php composer.phar install

composer.update:
	docker-compose run --rm --user=$$(id -u):$$(id -g) app php composer.phar update

db.migrate:
	docker-compose run --rm app php oil refine migrate:current

db.connect:
	docker-compose run --rm app mysql -h db -uroot -proot

bash.web:
	docker-compose run --rm web bash

bash.app:
	docker-compose run --rm app bash

bash.db:
	docker-compose run --rm db bash
