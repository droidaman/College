#import socket module

# Braden Licastro
# Lab 4
# CS381
# Professor Roos

import datetime
from socket import *
serverSocket = socket(AF_INET, SOCK_STREAM)

#Prepare a sever socket
serverPort = 12345
serverSocket.bind(('',serverPort))
serverSocket.listen(1)

while True:
    #Establish the connection

    print 'Ready to serve...'
    connectionSocket, addr = serverSocket.accept()

    try:
        message = connectionSocket.recv(1024)
        print message
        filename = message.split()[1]
        #print filename

        f = open(filename[1:])
        outputdata = f.read()

        #What is the current time?
        now = datetime.datetime.now()

        #Send several HTTP header lines into socket
        connectionSocket.send('HTTP/1.1 200 OK\n')
        connectionSocket.send('Connection: close\n')
        connectionSocket.send('Date: Tue, 10 Oct 2012 15:44:04 GMT\n')
        connectionSocket.send('Server: Apache/2.2.3 (CentOs)\n')
        connectionSocket.send('Last-Modified: Tue, 09 Aug 2011 15:11:03 GMT\n')
        connectionSocket.send('Content-Type: text/html\n\n')

        #Send the content of the requested file to the client
        for i in range(0, len(outputdata)):
            connectionSocket.send(outputdata[i])
        connectionSocket.close()

    except IOError:
        #Send response message for file not found
        connectionSocket.send('404 : file is nowhere to be found')

    #Close client socket
    connectionSocket.close()

serverSocket.close()
