from socket import create_connection
from ssl import SSLContext, PROTOCOL_TLS_CLIENT

# Associate the server socket with the IP and Port
hostname='xandar-project.eu'
#ip = '192.168.1.199'
ip = '127.0.0.1'
port = 8443

print('-------------------')
print('Sensor Node Started')
print('-------------------')

#Create a TLS client socket instance
context = SSLContext(PROTOCOL_TLS_CLIENT)
context.load_verify_locations('cert.pem')

#Use socket to connect to the server
with create_connection((ip, port)) as client:
    with context.wrap_socket(client, server_hostname=hostname) as tls:
        print('Sensor Node Connected to',ip)

        # Send a message
        Message = "Speed = 14mph; Altitude: 1200 feet; This is a confidential data and shall not be disclosed."
        bytes   = str.encode(Message)
        tls.sendall(bytes)

        #Receive the data
        data = tls.recv(1024)
        data = data.decode()
        print(f'Server: {data}')
