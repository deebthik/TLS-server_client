#creating CA
openssl req \
  -new \
  -x509 \
  -nodes \
  -days 365 \
  -subj '/CN=my-ca' \
  -keyout ssl/server/ca.key \
  -out ssl/server/ca.crt


#creating illegitimate CA
openssl req \
  -new \
  -x509 \
  -nodes \
  -days 365 \
  -subj '/CN=my-ca' \
  -keyout ssl/server/ca_2.key \
  -out ssl/server/ca_2.crt


#creating server key
openssl genrsa \
  -out ssl/server/server.key 2048


#creating CSR
openssl req \
  -new \
  -key ssl/server/server.key \
  -subj '/CN=localhost' \
  -out ssl/server/server.csr

#creating signed server cert
openssl x509 \
  -req \
  -in ssl/server/server.csr \
  -CA ssl/server/ca.crt \
  -CAkey ssl/server/ca.key \
  -CAcreateserial \
  -days 365 \
  -out ssl/server/server.crt
