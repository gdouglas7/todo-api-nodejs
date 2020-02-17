const request = require('supertest')
const app = require('../src/app')
const user = require('../src/models/users')

beforeAll( async () => {
    await user.deleteMany()
})

test('shoul call GET method successfuly', async() => {
    await request(app).get('/users').expect(200)
})

test('shoul call POST method successfuly and create a new user', async() => {
    await request(app)
        .post('/users')
        .send({
            name: 'George test',
            email: 'george@gmail.com',
            password: 'mysecret1234'
        })
        .expect(201)
})

test('shoul call GET method and get all Users', async() => {
    const response = await request(app).get('/users').expect(200)
    expect(response.body[0].name).toBe('George test')
})