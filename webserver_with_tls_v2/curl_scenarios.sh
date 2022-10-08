echo

#using Alice's cert (legitimate)
echo "-----------Using Alice's Certificate--------------"
curl \
  --cacert ssl/server/ca.crt \
  --key ssl/client/alice.key \
  --cert ssl/client/alice.crt \
  https://localhost:3000

echo
echo

#using Bob's certificate
echo "-----------Using Bob's Certificate---------------"
curl \
  --cacert ssl/server/ca.crt \
  --key ssl/client/alice.key \
  --cert ssl/client/bob.crt \
  https://localhost:3000

echo
echo


#leaving off cacert option with Alice's cert
echo "-------------Leaving off cacert option with Alice's cert----------------"
curl \
  --key ssl/client/alice.key \
  --cert ssl/client/alice.crt \
  https://localhost:3000

echo
echo


#leaving off cacert and key options with Alice's cert
echo "----------------Leaving off cacert and key options with Alice's cert---------------------"
curl \
  --cert ssl/client/alice.crt \
  https://localhost:3000
