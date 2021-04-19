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

## 6. SonarQube and [Sonar Scanner](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/)

Config file sonar-project.properties
```
sonar.projectKey=node-example
sonar.projectName=node-example
sonar.projectVersion=1.0

sonar.sources=src
sonar.tests=__tests__
sonar.sourceEncoding=UTF-8
sonar.javascript.lcov.reportPaths=coverage/lcov.info
sonar.testExecutionReportPaths=coverage/test-reporter.xml
```

Edit file <install_directory>/conf/sonar-scanner.properties
```
sonar.host.url=http://139.59.226.126:9000
sonar.login=admin
sonar.password=xitgmLwmp
```

Start
```
$<install_directory>/bin/sonar-scanner
```