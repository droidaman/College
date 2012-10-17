# Need to import networking package:
from socket import *

# What port number must clients use to connect to this server?
serverPort = 12345

# Create a "listening socket" to await requests from clients:
serverSocket = socket(AF_INET,SOCK_STREAM)
serverSocket.bind(('',serverPort))

# Begin listening:
serverSocket.listen(1)
print 'The server is ready to receive'

# Process requests as they arrive:
while 1:
   # When a request arrives, accept it through a "connection socket":
   connectionSocket, addr = serverSocket.accept()

   # Get the contents of the request packet:
   sentence = connectionSocket.recv(1024)

   # Respond:
   caps = sentence.upper()
   connectionSocket.send(caps)

   # Close the connection:
   connectionSocket.close()
