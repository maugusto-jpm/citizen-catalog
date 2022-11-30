# Citizen Catalog

A simple citizen catalog for some county.

## Setup

Run on terminal the folowing command:

```bash
# Creates and start containers
docker-compose up -d

# Open an terminal on apps container
docker-compose exec app bash

# Install Rails dependencies
bundle install

# Create databases
rails db:create

rails server
```

Application will be running on <http://localhost:5000>
