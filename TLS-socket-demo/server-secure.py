from socket import socket, AF_INET, SOCK_STREAM
from ssl import SSLContext, PROTOCOL_TLS_SERVER

# Associate the server socket with the IP and Port
#ip = '192.168.1.29'
ip = '127.0.0.1'
port = 8443

print('--------------')
print('Server Started')
print('--------------')

#Create a TLS server socket instance
context = SSLContext(PROTOCOL_TLS_SERVER)
context.load_cert_chain('cert.pem', 'key.pem')

#Use socket to connect to the client
with socket(AF_INET, SOCK_STREAM) as server:
    server.bind((ip, port))
    print("Server socket bound with ip {} port {}".format(ip, port))

    server.listen(1)
    with context.wrap_socket(server, server_side=True) as tls:
        connection, address = tls.accept()
        print("Server TLS socket created")
        print("Sensor Node Connected by {}".format(ip, port))

        data = connection.recv(1024)
        data = data.decode()
        print("Sensor Data:",data)

        # Send a message
        Message = "No problem, the server will make sure that this information will be kept secret from eavesdropper."
        bytes   = str.encode(Message)
        connection.sendall(bytes)
