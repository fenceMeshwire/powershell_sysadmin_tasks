# Ping machines in the network (ping = packet internet groper):

# Manual command:
ping 192.168.0.1
ping 192.168.0.2
ping 192.168.0.3
ping 192.168.0.4

# Create an array:
$IP_addresses = @('192.168.0.1','192.168.0.2','192.168.0.3','192.168.0.4')

# Ping each IP-address from the array:
foreach ($IP_adress in $IP_addresses) {
    ping $IP_adress
}

# Create a hashtable (dictionary) with key-value-pairs:
$machines = @{server01 = '192.168.0.1'; server02 = '192.168.0.2'; server03 = '192.168.0.3'; server04 = '192.168.0.4'}

foreach ($IP_adress in $machines.Values) {
    ping $IP_adress
}
