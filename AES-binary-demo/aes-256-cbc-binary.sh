# Symmetric Key Cryptography 
# created by Fahad Siddiqui
#!/bin/bash


# Define Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
NC='\033[0m' # No Color

clear
rm sample-enc
rm sample-dec
rm sample.o

echo "------------------------------------------"
echo "------- AES Binary Encryption Test -------"
echo "------------------------------------------"

#echo -n "Press [ENTER] to continue... "
read

# Display plaintext file
printf "\n${GREEN}---> Display Plaintext File\n${NC}"
cat $1
hexdump -C $1

#echo -n "Press [ENTER] to continue... "
read

printf "\n${GREEN}---> Compile the source code\n${NC}"
gcc $1 -o sample.o

#echo -n "Press [ENTER] to continue... "
read

printf "\n${GREEN}---> Source Compiled\n${NC}"


printf "\n${GREEN} ---> List files in the directory\n${NC}"
ls -l

#echo -n "Press [ENTER] to continue... "
read

# Encrypt message (AES-256-CBC)
printf "\n${GREEN}(1)---> Encrypt the Binary File\n${NC}"
openssl enc -aes-256-cbc -in sample.o -out $2 -pbkdf2

printf "\n${GREEN}---> File Encrypted\n${NC}"

printf "\n${GREEN} ---> List files in the directory\n${NC}"
ls -l

#echo -n "Press [ENTER] to continue... "
read

# Display cipher-text file
printf "\n${GREEN}---> Display Encrypted File\n${NC}"
cat $2
printf "\n"
hexdump -C $2

#echo -n "Press [ENTER] to continue... "
read

# Decrypt message
printf "\n${GREEN}(2)---> Decrypt Encrypted File\n${NC}"
openssl enc -aes-256-cbc -d -in $2 -out $3 -pbkdf2

# Display plaintext file
printf "\n${GREEN}---> Display Decrypted File\n${NC}"
cat $3
hexdump -C $3
printf "\n"

chmod +x sample-enc sample-dec

#echo -n "Press [ENTER] to continue... "
read

# Execute Encrypted Binary
printf "\n${GREEN}---> Execute Encrypted Binary\n${NC}"
./sample-enc

#echo -n "Press [ENTER] to continue... "
read

# Execute Decrypted Binary
printf "\n${GREEN}---> Execute Decrypted Binary\n${NC}"
./sample-dec
