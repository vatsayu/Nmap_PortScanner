
#!/bin/bash

echo "Welcome to Nmap Bash Scanner"
read -p "Enter your IP or domain: " target

filename="results/${target}_scan.txt"
mkdir -p results

echo "Scanning host: $target"
echo "Results will be saved in $filename"

# Ping scan
echo "Running Ping Scan..." | tee -a $filename
nmap -sn $target | tee -a $filename

# Port Scan
echo -e "\nRunning Port Scan..." | tee -a $filename
nmap -sT  $target | tee -a $filename

# OS detection and Service Version Scan
echo -e "\nRunning OS Detection and Service Version Scan..." | tee -a $filename
nmap -A $target | tee -a $filename

echo -e "\nScan completed. Check the file: $filename"
