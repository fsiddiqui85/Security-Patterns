from socket import socket, AF_INET, SOCK_STREAM

# Associate the server socket with the IP and Port
ip = '127.0.0.1'
port = 8443

print('--------------')
print('Server Started')
print('--------------')

with socket(AF_INET, SOCK_STREAM) as server:
    server.bind((ip, port))
    server.listen(1)

    connection, address = server.accept()
    print(f"Sensor Node Connected by {ip, port}\n")

    data = connection.recv(1024)
    data = data.decode()
    print(f"Client: {data}")

    connection.sendall(b"No problem, the server will make sure that this information will be kept secret from eavesdropper.")
