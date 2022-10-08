const https = require('https');
const fs = require('fs');

const hostname = 'localhost';
const port = 3000;

const options = { 
    ca: fs.readFileSync('ssl/server/ca.crt'), 
    cert: fs.readFileSync('ssl/server/server.crt'), 
    key: fs.readFileSync('ssl/server/server.key'), 
    rejectUnauthorized: true,
    requestCert: true, 
}; 

const server = https.createServer(options, (req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Works!\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
