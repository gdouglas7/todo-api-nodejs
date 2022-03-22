# todo-api-nodejs
API Project with TODO list endpoints using Nodejs, mongodb, mongoose, jest e supertest

### Purpose:
Only for study Node Js, how it works and some libraries functionality

### How to build and run:
#### To run the project locally is necessary to have Docker and Docker Compose installed and run the follow command:
`docker-compose up -d`

> To run the tests in the app you must change the target build of the web service in the docker-compose.yml from `dev` to `test`.

#### Request examples:
##### Creating task
```shell
curl --location --request POST 'localhost:3000/tasks' \
--header 'Content-Type: application/json' \
--data-raw '{
    "description": "TODO the stuff 3233",
    "completed": false
}'
```  
##### Getting tasks
```shell
curl --location --request GET 'localhost:3000/tasks'
```  