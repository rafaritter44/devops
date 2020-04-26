const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const people = new Map();
const counter = (() => {
  let count = 1;
  return () => count++;
})();

app.use(bodyParser.json());

app.post('/api/people', (request, response, next) => {
    const person = request.body;
    const id = counter();
    person.id = id;
    people.set(id, person);
    response.status(201).json(person);
});

app.get('/api/people/:id([0-9]+)', (request, response, next) => {
    const id = parseInt(request.params.id);
    const person = people.get(id);
    if (person) {
        response.send(person);
    } else {
        response.sendStatus(404);
    }
});

app.get('/api/people', (request, response, next) => {
    response.send(Object.fromEntries(people));
});

app.use('/api/people', (request, response, next) => {
    if (/^\/api\/people\/?$/.test(request.originalUrl)) {
        response.sendStatus(405);
    } else {
        next();
    }
})

app.use('/', (request, response, next) => {
    response.sendStatus(404);
});

app.listen(3000);