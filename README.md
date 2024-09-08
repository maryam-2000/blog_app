# Blog Application

## Description

A simple blog application built using Ruby on Rails. This app allows users to create, read, update, and delete blog posts. It includes user authentication with JWT and background jobs to handle post deletions after 24 hours.

## Features

- **User Authentication**: Signup, login, and JWT-based authentication.
- **CRUD Operations**: Create, read, update, and delete blog posts.
- **Background Jobs**: Automatic post deletion after 24 hours using Sidekiq.
- **JWT Authentication**: Secure access to API endpoints.

## Technologies Used

- **Ruby on Rails**: Web application framework.
- **PostgreSQL**: Database management system.
- **Sidekiq**: Background job processing.
- **Redis**: Used by Sidekiq for job queue management.
- **JWT**: JSON Web Tokens for API authentication.
- **Docker**: Containerization (if applicable).

## Installation

### Prerequisites

- Ruby (e.g., 3.1.0)
- Rails (e.g., 7.0.0)
- PostgreSQL
- Redis
- Docker (optional)

### Setup

1. **Clone the Repository**

   ```bash
   git clone <repository-url>
   cd blog_app

2. **Install Dependecies**

    ```bash
    bundle install

3. **Setup the Database**

    ```bash
    rails db:create
    rails db:migrate
    rails db:seed # if you have seed data

4. **Start the Server**

    ```bash
    rails server

5. **Start Sidekiq** (if using background jobs)

    ```bash
    bundle exec sidekiq

6. **Access the Application**

    Open your browser and go to `http://localhost:3000`

### Docker Setup (Optional)

    If using Docker, build and run the Docker containers:

    ```bash
    docker-compose up --build

### API Endpoints


