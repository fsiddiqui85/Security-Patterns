
# Data Confidentiality 

**Pattern Name:** Data Confidentiality 

<p align="justify">
**Context:** Within the safety-critical systems, a data message is required to pass through one or more intermediaries as shown Figure. While in transit, there is a risk that an attacker can eavesdrop on these data messages between the sender and the receiver using malicious software or exploiting known/unknown system hardware/software vulnerabilities as illustrated in Figure. Thus, compromising the confidentiality of data messages. This disclosed information further can be used to launch a range of malicious attacks such as malicious manipulation of data to adversely alter the behaviour of the system.
</p>

**Problem:** How to prevent disclosure of critical system data-at-rest and data-in-motion from not intended recipients?

<p align="justify">
**Solution:** The data and message contents shall be encrypted ensuring that only intended recipients can access the critical system control and data.
</p>

![Data Confidentiality Security Pattern](/images/Confidentiality.png)

## Pattern Implementations
Within the scope of XANDAR, the data confidentiality shall be maintained while:

* **Data-at-rest - This includes software source code and complied binaries**

    Sample Example Code: AES-code-demo, AES-binary-demo
    
    Prerequisite: OpenSSL 1.1.1

* **Data-in-motion - This includes secure data communication between two entities**
    
    Sample Example Code: TLS-socket-demo

    Prerequisites: OpenSSL 1.1.1, Python 2.7 and above

## Data-at-motion (TLS Socket)
**Folder Name:** TLS-socket-demo

**Source files:** server.py, client.oy

**Usage**

<p align="justify">
1. Generate a customised PKCS#10 digital certificate of the server using the OpenSSL certificate generation utility ‘req’ command . This includes the generation of public/private key-pair. The generated digital certificate will be used by the clients to establish secure (TLS) connection with the server.
</p>

```
openssl req -new 
-x509 
-days 365 
-nodes -out cert.pem -keyout key.pem 
-subj"
/C=UK
/ST=Northern Ireland
/L=Belfast
/O=QUB
/OU=CSIT
/CN=xandar-project.eu
/emailAddress=f.siddiqui@qub.ac.uk"
```

2.	Open a terminal and start the TLS server process by executing the following command:
```
python3 server-secure.py
```

3.	Open additional terminal and start the TLS client process by executing the following command:
```
python3 client-secure.py
```

<p align="justify">
**Note:** If the example is intended to run on the same host machine use ip = '127.0.0.1' (loopback) and same port number in both “client.py” and “server.py”
</p>
