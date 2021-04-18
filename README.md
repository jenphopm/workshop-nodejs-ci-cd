# Workshop with [NodeJS](https://nodejs.org/en/)

List of packages
* express
* jest
* jest-junit
* supertest

## 1. Start node server
```
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
```