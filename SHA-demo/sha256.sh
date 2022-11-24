# Data Integrity Cryptography 
# created by Fahad Siddiqui
#!/bin/bash


# Define Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
NC='\033[0m' # No Color

echo "--------------------------------------"
echo "--------- Digital Hash Test ----------"
echo "--------------------------------------"

#echo -n "Press [ENTER] to continue... "
read

printf "\n${GREEN} ---> List files in the directory\n${NC}"
ls -l

# Calculate SHA256
printf "\n${GREEN} ---> Compute the SHA-256 of the Original file\n${NC}"
x=$(sha256sum $1)
echo $x
printf "\n${GREEN} ---> Compute the SHA-256 of file to be compared\n${NC}"
y=$(sha256sum $2)
echo $y
#echo -n "Press [ENTER] to continue... "
read

if [[ "$x" = "$y" ]]
   then
       printf "\n${GREEN} ---> Integrity Check PASSED!\n${NC}"
   else
       printf "\n${RED} ---> Integrity Check FAILED!\n${NC}"
fi
