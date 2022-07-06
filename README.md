# devops_project

# Enviroment

In .env file update configuration value as wanted.

# Running

In order to prepare and run containers execute command make.

* make

It will source .env file and execute lets_encrypt_localhost.sh script which generates certificates.

And finally run docker-compose using enviroment variables.


# Check wordpress

To see container status run

* make status

To check if nginx opened ports run

* telnet localhost 80
* telnet localhost 443

And to confirm that wordpress page is up visit it (use firefox :D)

https://localhost


# Stop

To stop containers run

* make stop

# Restart

To restart containers run

* make restart

