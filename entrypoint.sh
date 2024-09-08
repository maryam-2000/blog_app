#!/bin/bash
set -e

# Wait for PostgreSQL to be ready
while ! pg_isready -h db -p 5432 -U postgres; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done

# Run database migrations
bundle exec rails db:create
bundle exec rails db:migrate

# Start the application
exec "$@"
