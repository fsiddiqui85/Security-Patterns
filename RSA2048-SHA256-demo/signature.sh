# Digital Signature Cryptography 
# created by Fahad Siddiqui
#!/bin/bash


# Define Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
NC='\033[0m' # No Color

clear
rm benign.sign
rm key.pem
rm key.pub

echo "--------------------------------------"
echo "------- Digital Signature Test -------"
echo "--------------------------------------"

#echo -n "Press [ENTER] to continue... "
read

# Generate an RSA-2048 private key
printf "\n${GREEN} (1)---> Generate RSA-2048 Private Key\n${NC}" 
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out key.pem

#echo -n "Press [ENTER] to continue... "
read

printf "\n${GREEN} ---> List files in the directory\n${NC}"
ls -l

#echo -n "Press [ENTER] to continue... "
read

# Display Private Key
printf "\n${GREEN}---> Display Private Key ${RED}(shown only for demonstration!!)\n${NC}"
cat key.pem 
#hexdump -C key.pem 

#echo -n "Press [ENTER] to continue... "
read

# Extract public key from the private key
printf "\n${GREEN} (2)---> Derive Public Key from the Private Key\n${NC}" 
openssl pkey -in key.pem -out key.pub -pubout

#echo -n "Press [ENTER] to continue... "
read 

# Display Public Key
printf "\n${GREEN}---> Display Public Key\n${NC}"
cat key.pub 
#hexdump -C key.pub

#echo -n "Press [ENTER] to continue... "
read

printf "\n${GREEN} ---> List files in the directory\n${NC}"
ls -l

#echo -n "Press [ENTER] to continue... "
read

# Calculate SHA256
printf "\n${GREEN} ---> Compute the SHA-256 of the Original file\n${NC}"
sha256sum $1

printf "\n${GREEN} ---> Compute the SHA-256 of file to be compared\n${NC}"
sha256sum $3

#echo -n "Press [ENTER] to continue... "
read

# Digitally Sign a zip file (HASH+SIGN) using private key
printf "\n${GREEN} (3)---> Sign the file ($1) using Private Key\n${NC}"
openssl dgst -sign key.pem -keyform PEM -sha256 -out $2 -binary $1

#echo -n "Press [ENTER] to continue... "
read

printf "\n${GREEN} ---> Signature Generated ($2)\n${NC}"
ls -l

#echo -n "Press [ENTER] to continue... "
read

# Digitally verify the signature
printf "\n${GREEN} (4)---> Verify the Signature using Public Key\n${NC}"
# Digitally Verify the signature of the file
openssl dgst -verify key.pub -keyform PEM -sha256 -signature $2 -binary $3
