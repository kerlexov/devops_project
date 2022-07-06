.PHONY : prepare start

.DEFAULT_GOAL := start

generate_certs:
	sh certs/lets_encrypt_localhost.sh

prepare:
	source .env
	docker-compose pull
	generate_certs
 
 
start:
	$(info Make: Starting "$(ENV_TYPE)" environment containers.)
	$(info Make: docker-compose up -f docker-compose-$(ENV_TYPE).yaml -d)
	docker-compose -f docker-compose-$(ENV_TYPE).yaml -p wordpress-$(ENV_TYPE) up -d
 
stop:
	$(info Make: Stopping "$(ENV_TYPE)" environment containers.)
	docker-compose -f docker-compose-$(ENV_TYPE).yaml -p wordpress-$(ENV_TYPE) stop
 
restart:
	$(info Make: Restarting "$(ENV_TYPE)" environment containers.)
	make -s stop
	make -s start

status:
	docker-compose -f docker-compose-$(ENV_TYPE).yaml -p wordpress-$(ENV_TYPE) ps
 
clean:
	docker system prune --volumes --force
 
login:
	$(info Make: Login to Docker Hub.)
	docker login -u $(DOCKER_USER) -p $(DOCKER_PASS)