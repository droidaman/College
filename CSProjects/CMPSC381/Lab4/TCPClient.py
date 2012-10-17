# Need to import networking package:
from socket import *

# Where is the server located?
serverName = 'aldenv27.allegheny.edu'

# What port number does the server use?
serverPort = 12345

# Create a socket for sending packets back and forth:
clientSocket = socket(AF_INET,SOCK_STREAM)
clientSocket.connect((serverName,serverPort))

# Send request to server:
sentence = raw_input('Input lowercase sentence')
clientSocket.send(sentence)

# Receive response from server:
modifiedSentence = clientSocket.recv(1024)
print 'From server:',modifiedSentence

# Transaction complete: close the socket:
clientSocket.close()
