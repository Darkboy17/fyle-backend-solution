
# Fyle Backend Challenge Solution

## How to access the live back-end API (maybe down sometimes)?

 1. Visit this link below:
	https://54b8-2405-201-ac04-e101-4aee-2b80-ee94-673c.ngrok-free.app
	
 2. Use Postman or Curl Command to test the following endpoint

	For example : 
	
	https://54b8-2405-201-ac04-e101-4aee-2b80-ee94-673c.ngrok-free.app/principal/assignments/
	
	is a get request that basically does the following:

### GET /principal/assignments

List all submitted and graded assignments
```
headers:
X-Principal: {"user_id":5, "principal_id":1}

response:
{
    "data": [
        {
            "content": "ESSAY T1",
            "created_at": "2021-09-17T03:14:01.580126",
            "grade": null,
            "id": 1,
            "state": "SUBMITTED",
            "student_id": 1,
            "teacher_id": 1,
            "updated_at": "2021-09-17T03:14:01.584644"
        }
    ]
}

```



# Here's a step-by-step guide to building and running the application with Docker:

### Prerequisites:

1.  First of all, Docker should be installed on your local machine.

### Steps:

#### 1. Clone the Repository:

bash

`git clone https://github.com/Darkboy17/fyle-backend-solution` 

#### 2. Dockerize the Application:

 -   Create a `Dockerfile` in the root of your project directory with the following content:
    
Dockerfile
    
	# Use the official Python image as a base FROM python:3.10
	# Set the working directory in the container
	WORKDIR /app

	# Copy the requirements file into the container at /app
	COPY requirements.txt .

	# Install any needed dependencies specified in requirements.txt
	RUN pip install --no-cache-dir -r requirements.txt

	# Copy the entire project directory into the container at /app
	COPY . .

	# Expose port 7755 to allow communication to/from server
	EXPOSE 7755

	# Run the bash script to start the application
	CMD ["bash", "run.sh"]
 - Create a `docker-compose.yml` file in the root of your project directory with the following content:

yaml
    

	version: '3'
    services:
      web:
        build:
          context: .
          dockerfile: Dockerfile
        ports:
          - "7755:7755"
        volumes:
          - .:/app
        depends_on:
          - db
      db:
        image: postgres:latest
        ports:
          - "5432:5432"
        environment:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: example
          POSTGRES_DB: mydatabase

#### 3. Build and Run the Docker Containers:
bash

	docker-compose up --build

#### 4. Access Your Application:
Once the containers are up and running, you should be able to access your application in your web browser at: 

http://0.0.0.0:7755

#### 5. Stopping the Containers:
To stop the Docker containers, press `Ctrl + C` in the terminal where you ran 

`docker-compose up`

### Additional Notes:
-   Make sure your application is running properly inside the Docker container by checking logs and testing its functionality.
-   Ensure that any necessary configurations (e.g., database connection strings) are correctly set up for the Docker environment.
-   You can customize the Dockerfile and docker-compose.yml according to your specific requirements and project structure.
- This guide 100% works if you are wokring on Linux PopOS!
