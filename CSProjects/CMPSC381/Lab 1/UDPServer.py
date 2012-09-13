# Braden Licastro #
#   Lab: 1 #

from socket import *
serverPort = 12345
serverSocket = socket(AF_INET, SOCK_DGRAM)
serverSocket.bind(('', serverPort))
print "The server is ready to receive"
while 1:
	message, clientAddress = serverSocket.recvfrom(2048)
	modifiedMessage = message.upper()
	modifiedMessage = modifiedMessage  + "Braden"
	serverSocket.sendto(modifiedMessage, clientAddress)
