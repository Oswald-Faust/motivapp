const express = require('express')
const app = express()
const dotenv = require('dotenv');f


const port = 3000

app.get('/', (req, res) => res.send('Hello browww!'))
app.listen(port, () => console.log(`Example app listening on port ${port}!`))