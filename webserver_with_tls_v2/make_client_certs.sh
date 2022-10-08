#creating Alice's key
openssl genrsa \
  -out ssl/client/alice.key 2048

#creating Bob's key
openssl genrsa \
  -out ssl/client/bob.key 2048


#creating Alice's CSR
openssl req \
  -new \
  -key ssl/client/alice.key \
  -subj '/CN=my-client' \
  -out ssl/client/alice.csr


#creating Bob's CSR
openssl req \
  -new \
  -key ssl/client/bob.key \
  -subj '/CN=my-client' \
  -out ssl/client/bob.csr


#creating Alice's cert
openssl x509 \
  -req \
  -in ssl/client/alice.csr \
  -CA ssl/server/ca.crt \
  -CAkey ssl/server/ca.key \
  -CAcreateserial \
  -days 365 \
  -out ssl/client/alice.crt


#creating illegitimate Bob's cert
openssl x509 \
  -req \
  -in ssl/client/bob.csr \
  -CA ssl/server/ca_2.crt \
  -CAkey ssl/server/ca_2.key \
  -CAcreateserial \
  -days 365 \
  -out ssl/client/bob.crt
