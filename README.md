# Workshop with [NodeJS](https://nodejs.org/en/)

List of packages
* express
* jest
* jest-junit
* supertest

## 1. Start node server
```
$npm install
$npm start
```

Access to api `http://localhost:3000`

## 2. API Testing with [Jest](https://jestjs.io/)
```
$npm test
```

## 3. Deploy to target server with [PM2](https://pm2.keymetrics.io/docs/usage/quick-start/)
```
$pm2 start src/index.js
$pm2 restart all
```

## 4. API testing with Postman and [Newman command](https://www.npmjs.com/package/newman)
```
$cd postman
$newman run node-api.postman_collection.json

// Report
$newman run day01.postman_collection.json -r cli,junit
```

## 5. Pipeline script
```
pipeline {
    agent any

    stages {
        stage('demo01') {
            steps {
                git branch: 'main', url: 'https://github.com/up1/workshop-nodejs-ci-cd.git'
                sh '''npm install
npm test'''
            }
        }
        stage('deploy') {
            steps {
                sh 'pm2 restart all'
            }
        }
        stage('api-test') {
            steps {
                sh '''cd postman
newman run day01.postman_collection.json -r cli,junit'''
            }
        }
    }
}

```
