
# Data Integrity 

**Pattern Name:** Data Integrity 

<p align="justify">
**Context:** Within the safety-critical systems, a data message is required to pass through a communication channel. While in transit, there is a risk that an attacker can adversely manipulate/tamper the data message between the sender and the receiver using malicious software or exploiting known/unknown system hardware/software vulnerabilities as illustrated in Figure. Thus, compromising the integrity of a data message. This tampered data message can be used to launch a range of malicious attacks such as man-in-the-middle, spoofing, denial-of-service, replay attacks etc. to adversely alter the behaviour of the system.
</p>

**Problem:** How to protect integrity of critical system data-at-rest or data-in-motion against manipulation and tampering?

<p align="justify">
**Solution:** The data and message contents shall be cryptographically hashed to detect adverse manipulation/tampering of critical system control and data by the recipients.
</p>

![Data Integrity Security Pattern](/images/Integrity.png)

## Pattern Implementations
    
**Prerequisite:** OpenSSL 1.1.1

**Folder Name:** sha-demo

**Source file:** sha256.sh

**Parameters:** source-file.c benign_file received_file

**Usage**
```
# The recieved file for deployment is trustworthy and its integrity is intact
./sha256.sh benign.zip benign.zip
```

```
# The recieved file for deployment has been tampered/modified during transmission and its integrity is compromised
./sha256.sh benign.zip tampered.zip
```
