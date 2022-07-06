# devops_project

Note:
- Do not delete .env because somewhere in docker-compose is bug which has hardcoded to check .env
- even when it is using alternate env-file 

# Enviroment

In .env.test or .env.prod file update configuration value as wanted.

# Clean start

If you want clean start run this command before others

* make clean-test
or
* make clean-prod

Prepare will generate certificate for enviroment

* make prepare-test
or
* make prepare-prod

# Running

In order to run containers execute command make.

* make start-test
or
* make start-prod

It will run docker-compose using enviroment variables.

# Check wordpress

To see container status run

* make status-test
or
* make status-prod

To check if nginx opened ports run

* telnet localhost 80
* telnet localhost 443
 or 
* telnet localhost 8080
* telnet localhost 8443

And to confirm that wordpress page is up visit it (use firefox :D)

https://localhost
https://localhost:8443

# Stop

To stop containers run

* make stop-test
or
* make stop-prod

# Kill

To kill containers run

* make kill-test
or
* make kill-prod

# Remove

To remove containers run

* make rm-test
or
* make rm-prod

# Restart

To restart containers run

* make restart-test
or
* make restart-prod
