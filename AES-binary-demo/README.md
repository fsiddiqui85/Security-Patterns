
# Data Confidentiality 

**Pattern Name:** Data Confidentiality 

**Context:** Within the safety-critical systems, a data message is required to pass through one or more intermediaries as shown Figure 1. While in transit, there is a risk that an attacker can eavesdrop on these data messages between the sender and the receiver using malicious software or exploiting known/unknown system hardware/software vulnerabilities as illustrated in Figure 1. Thus, compromising the confidentiality of data messages. This disclosed information further can be used to launch a range of malicious attacks such as malicious manipulation of data to adversely alter the behaviour of the system.

**Problem:** How to prevent disclosure of critical system data-at-rest and data-in-motion from not intended recipients?

**Solution:** The data and message contents shall be encrypted ensuring that only intended recipients can access the critical system control and data.

![Data Confidentiality Security Pattern](/images/Confidentiality.png)

## Pattern Implementations
Within the scope of XANDAR, the data confidentiality shall be maintained while:

* **Data-at-rest - This includes software source code and complied binaries**

    Sample Example Code: AES-code-demo, AES-binary-demo
    
    Prerequisite: OpenSSL 1.1.1

* **Data-in-motion - This includes secure data communication between two entities**
    
    Sample Example Code: TLS-socket-demo

    Prerequisites: OpenSSL 1.1.1, Python 2.7 and above

## Data-at-rest (AES-256 Encryption)

### Binary Encryption
**Folder Name:** AES-binary-demo

**Source file:** aes-256-cbc-binary.sh

**Parameters:** source-file.c encrypted-binary decrypted-binary

**Usage**
```
./aes-256-cbc-binary.sh sample.c sample-enc sample-dec
```
