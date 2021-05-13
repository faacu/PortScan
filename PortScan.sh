trap ctrl_C INT

echo "Enter the IP to scan: "
read ip

function ctrl_C()
{
    echo -e "\n\n[*] Exiting..\n"
    exit 0
}

for port in $(seq 1 65535); do
    timeout 1 bash -c "echo '' < dev/tcp/$ip/$port" 2>/dev/null && echo "Port: $port - OPEN"
done; wait