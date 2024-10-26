# Define commands with descriptions
COMMANDS := \
    echo "up       - Start the WordPress instance with Docker" ; \
    echo "down     - Stop the WordPress instance with Docker" ; \
    echo "restart  - Restart the services" ; \
    echo "fresh    - Create a new instance with a newly created volume" ; \
    echo "clean    - Remove all the volumes created" ;

# Target to list the commands with descriptions, each on a new line
list:
	@echo "Available Commands:" && \
	echo "-------------------" && \
	$(COMMANDS)

# Targets for each individual command
up:
	@echo "Starting WordPress instance with Docker..."
	@docker-compose up -d

down:
	@echo "Stopping WordPress instance with Docker..."
	@docker-compose down

restart:
	@echo "Restarting services..."
	@docker-compose down && docker-compose up -d

fresh:
	@echo "Creating a new instance with a newly created volume..."
	@docker-compose down -v && docker-compose up -d

clean:
	@echo "Removing all created volumes..."
	@docker-compose down -v

# Main target to list commands and provide help
all: list
