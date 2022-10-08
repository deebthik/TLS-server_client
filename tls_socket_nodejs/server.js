const tls = require('tls');
const fs = require('fs');

const options = { 
    key: fs.readFileSync('server-key.pem'), 
    cert: fs.readFileSync('server-crt.pem'), 
    ca: fs.readFileSync('ca-crt.pem'), 
    requestCert: true, 
    rejectUnauthorized: false //MUST BE SET TO TRUE FOR PRODUCTION
}; 

const server = tls.createServer(options, (socket) => {
    console.log('\nServer connected!', 
        socket.authorized ? '\nAuthorized!' : '\nUnauthorized!');
    
    socket.on('error', (error) => {
        console.log(error);
    });
    
    socket.write('Welcome!\n');
    socket.setEncoding('utf8');
    socket.pipe(process.stdout);
    socket.pipe(socket);
});

server.listen(8000, () => {
    console.log('Server Running...');
});
