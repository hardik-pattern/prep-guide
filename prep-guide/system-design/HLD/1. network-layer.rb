# What are the 'OSI Model' layers?

# The OSI (Open Systems Interconnection) model is a conceptual framework used to understand and implement network protocols in seven layers. Each layer serves a specific function and interacts with the layers above and below it. The seven layers of the OSI model are:

# remember: please do not throw salami pizza away

#* Physical Layer (Layer 1): This layer deals with the physical connection between devices, including cables, switches, and electrical signals. It defines the hardware specifications and transmission media.

#* Data Link Layer (Layer 2): This layer is responsible for node-to-node data transfer and error detection and correction. It defines how data packets are framed and transmitted over the physical medium. Examples include Ethernet and Wi-Fi.

#* Network Layer (Layer 3): This layer is responsible for routing data packets between devices across different networks. It manages logical addressing and determines the best path for data transmission. The Internet Protocol (IP) operates at this layer.

# * Transport Layer (Layer 4): This layer ensures reliable data transfer between devices. It provides error recovery, flow control, and segmentation of data into smaller packets. Examples include Transmission Control Protocol (TCP) and User Datagram Protocol (UDP).

#* Session Layer (Layer 5): This layer manages sessions or connections between applications. It establishes, maintains, and terminates communication sessions. It also handles session recovery and synchronization.

#* Presentation Layer (Layer 6): This layer is responsible for data translation, encryption, and compression. It ensures that data is presented in a format that the application layer can understand. It acts as a translator between the application and network layers.

#* Application Layer (Layer 7): This layer provides network services directly to end-user applications. It includes protocols for web browsing, email, file transfer, and other application-specific functions. Examples include HTTP, FTP, and SMTP.


#** Application Layer **
#       |
#       +-- Client Server Protocols (HTTP, FTP, SMTP, Web sockets)
#       |
#       +-- P2P Protocols (WebRTC, BitTorrent)

# Client Server Protocols: Here client make a request and server response to the server
# Websockets: Here client and server can communicate with each other or initialize a connection
# P2P Protocols: Here client and server can communicate with each other or client and client can also communicate with each other

# FTP: File Transfer Protocol: Here we maintain 2 connections one for the data and one for the control
# SMTP: Simple Mail Transfer Protocol: Here we send the email from one server to another server
# IMAP: Internet Message Access Protocol: Here we can read the email from the server
# POP3: Post Office Protocol: Here we download the email to read so it generally not used

# ** Transport Layer + Network Layer **
# It has 2 protocols TCP and UDP

# TCP: Transmission Control Protocol: It is a connection-oriented protocol. It is reliable and has flow control and error control. It is used for applications where data integrity is important, such as file transfers, web browsing, and email.
# We use the 3-way handshake to establish a connection between the client and server. The 3-way handshake is a process of establishing a connection between the client and server. It involves three steps:
# Here data is ordered and reliable

# UDP: User Datagram Protocol: It is a connectionless protocol. It is unreliable and does not have flow control and error control. It is used for applications where speed is important, such as video streaming, online gaming, and VoIP.


