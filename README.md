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

    docker-compose up --build

## API Endpoints

### User Authentication

- **Signup**: `POST /signup`
  - **Request Body**:
    ```json
    {
      "user": {
        "name": "John Doe",
        "email": "john@example.com",
        "password": "password",
        "image": "image_url"
      }
    }
    ```
  - **Response**:
    ```json
    {
      "token": "jwt_token",
      "user": { ... }
    }
    ```

- **Login**: `POST /login`
  - **Request Body**:
    ```json
    {
      "email": "john@example.com",
      "password": "password"
    }
    ```
  - **Response**:
    ```json
    {
      "token": "jwt_token",
      "user": { ... }
    }
    ```

### Blog Posts

- **Index**: `GET /posts`
  - **Response**:
    ```json
    [
      {
        "id": 1,
        "title": "Post Title",
        "body": "Post Body",
        "tags": "tag1, tag2",
        "created_at": "timestamp"
      },
      ...
    ]
    ```

- **Show**: `GET /posts/:id`
  - **Response**:
    ```json
    {
      "id": 1,
      "title": "Post Title",
      "body": "Post Body",
      "tags": "tag1, tag2",
      "created_at": "timestamp"
    }
    ```

- **Create**: `POST /posts`
  - **Request Body**:
    ```json
    {
      "post": {
        "title": "New Post",
        "body": "Post Body",
        "tags": "tag1, tag2"
      }
    }
    ```
  - **Response**:
    ```json
    {
      "id": 1,
      "title": "New Post",
      "body": "Post Body",
      "tags": "tag1, tag2",
      "created_at": "timestamp"
    }
    ```

- **Update**: `PUT /posts/:id`
  - **Request Body**:
    ```json
    {
      "post": {
        "title": "Updated Title",
        "body": "Updated Body",
        "tags": "new_tag1, new_tag2"
      }
    }
    ```
  - **Response**:
    ```json
    {
      "id": 1,
      "title": "Updated Title",
      "body": "Updated Body",
      "tags": "new_tag1, new_tag2",
      "created_at": "timestamp"
    }
    ```

- **Destroy**: `DELETE /posts/:id`
  - **Response**: `204 No Content`


