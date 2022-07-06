WORDPRESS_SITE_NAME := devops

prepare-test:
	sh certs/generate_certs_localhost.sh test
	mkdir -p db/test
	mkdir -p wp/test
prepare-prod:
	sh certs/generate_certs_localhost.sh prod
	mkdir -p db/prod
	mkdir -p wp/prod
# TEST env
start-test:
	$(info Make: Starting test environment containers.)
	. .env.test
	docker-compose --env-file .env.test -f docker-compose-test.yaml -p $(WORDPRESS_SITE_NAME)-test up -d

stop-test:
	$(info Make: Stopping test environment containers.)
	. .env.test
	docker-compose --env-file .env.test -f docker-compose-test.yaml -p $(WORDPRESS_SITE_NAME)-test stop

restart-test:
	$(info Make: Restarting test environment containers.)
	make -s stop-test
	make -s start-test

status-test:
	. .env.test
	docker-compose --env-file .env.test -f docker-compose-test.yaml -p $(WORDPRESS_SITE_NAME)-test ps

kill-test:
	$(info Make: Killing test environment containers.)
	. .env.test
	docker-compose --env-file .env.test -f docker-compose-test.yaml -p $(WORDPRESS_SITE_NAME)-test kill

rm-test:
	$(info Make: Removing test environment containers.)
	. .env.test
	docker-compose --env-file .env.test -f docker-compose-test.yaml -p $(WORDPRESS_SITE_NAME)-test rm
clean-test:
	rm -rf wp/test/*
	rm -rf db/test/*
	rm logs/nginx/test/*
	rm certs/test/*
# PRODUCTION env
start-prod:
	$(info Make: Starting prod environment containers.)
	. .env.prod
	docker-compose --env-file .env.prod -f docker-compose-prod.yaml -p $(WORDPRESS_SITE_NAME)-prod up -d

stop-prod:
	$(info Make: Stopping prod environment containers.)
	. .env.prod
	docker-compose --env-file .env.prod -f docker-compose-prod.yaml -p $(WORDPRESS_SITE_NAME)-prod stop

restart-prod:
	$(info Make: Restarting prod environment containers.)
	make -s stop-prod
	make -s start-prod

status-prod:
	. .env.prod
	docker-compose --env-file .env.prod -f docker-compose-prod.yaml -p $(WORDPRESS_SITE_NAME)-prod ps

kill-prod:
	$(info Make: Killing prod environment containers.)
	. .env.prod
	docker-compose --env-file .env.prod -f docker-compose-prod.yaml -p $(WORDPRESS_SITE_NAME)-prod kill

rm-prod:
	$(info Make: Removing prod environment containers.)
	. .env.prod
	docker-compose --env-file .env.prod -f docker-compose-prod.yaml -p $(WORDPRESS_SITE_NAME)-prod rm

clean-prod:
	rm -rf wp/prod/*
	rm -rf db/prod/*
	rm logs/nginx/prod/*
	rm certs/prod/*


docker_clean:
	docker system prune --volumes --force
