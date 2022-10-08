#generate CA
openssl req -new -x509 -days 9999 -keyout ca-key.pem -out ca-crt.pem

#generate server key
openssl genrsa -out server-key.pem 4096

#generate server CSR
openssl req -new -key server-key.pem -out server-csr.pem

#generate server cert using CA
openssl x509 -req -days 9999 -in server-csr.pem -CA ca-crt.pem -CAkey ca-key.pem -CAcreateserial -out server-crt.pem

#verify server cert
openssl verify -CAfile ca-crt.pem server-crt.pem


#creating client key
openssl genrsa -out client1-key.pem 4096

#creating client CSR
openssl req -new -key client1-key.pem -out client1-csr.pem

#signing client cert
openssl x509 -req -days 9999 -in client1-csr.pem -CA ca-crt.pem -CAkey ca-key.pem -CAcreateserial -out client1-crt.pem

#verifying client cert
openssl verify -CAfile ca-crt.pem client1-crt.pem


