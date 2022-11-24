from socket import create_connection

# Associate the server socket with the IP and Port
hostname='xandar-project.eu'
ip = '192.168.1.199'
port = 8443

print('-------------------')
print('Sensor Node Started')
print('-------------------')

with create_connection((ip, port)) as client:
    print(f"Connected by {ip, port}\n")
    client.sendall(b'Speed = 14mph; Altitude: 1200 feet; This is a confidential data and shall not be disclosed.')

    data = client.recv(1024)
    data = data.decode();
    print(f"Server: {data}")
