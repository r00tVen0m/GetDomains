#!/bin/bash


#My Tool GetSubDomain it is fun! 

domain=$1
file='sources.txt'
#ip=$2
function sonar_sub(){
		sub=$(curl -s https://sonar.omnisint.io/subdomains/$domain | jq -r '.[]' | sort -u)
      }
function tlds(){

          tlds=$(https://sonar.omnisint.io/tlds/$domain | jq -r '.[]' | sort -u)
}
function all(){

          all=$(https://sonar.omnisint.io/all/$domain | jq -r '.[]' | sort -u)

}
function revers(){
          revers=$(https://sonar.omnisint.io/reverse/$ip | jq -r '.[]' | sort -u)

}
function crt(){
        crt=$(curl -s "https://crt.sh/?q=$domain&output=json" | jq -r '.[] | "\(.name_value)\n\(.common_name)"' | sort -u)
        echo $crt
}
function bruteForce(){
	  mkdir BurteForce
          echo -e "Brute Force Suddomain With wordlist and TheHarvester ...."
          bruteF=$(cat $file | while read source; do theHarvester -d "$domain" -b $source -f "${source}-${domain}";done)
          echo $bruteF >> BurteForce/
}

echo -e "My Tool r00tVenom It's Fun! V 0.1 ......."
#bruteForce
crt
