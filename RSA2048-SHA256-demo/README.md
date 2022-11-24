
# Data Authentication 

**Pattern Name:** Data Authentication

**Context:** Within the safety-critical systems, a data message is required to pass through a communication channel as shown in Figure 3. While in transit, there is a risk that an attacker can adversely modify the contents of data message originated from a legitimate source by exploiting known/unknown system hardware/software vulnerabilities and malicious software as shown in Figure3. Thus, compromising both integrity and authenticity of a data message. This unauthorizedly modified data message can be used to launch a wide range of malicious attacks such as loading and execution of malicious code, unauthorized access to resources, denial-of-service, the elevation of privileges etc. to gain control of the system and adversely alter the behaviour of the system.

**Problem:** How to ensure authenticity and protect integrity of critical system data-at-rest and data-in-motion against unauthorized modification?

**Solution:** The data and message contents shall be cryptographically hashed and signed by the sender to detect unauthorized modification of critical system data message and verify the source of data message by the recipients.

![Data Authentication Security Pattern](Authentication.png)

## Pattern Implementations
    
**Prerequisite:** OpenSSL 1.1.1

**Folder Name:** RSA2048-SHA256-demo

**Source file:** signature.sh

**Parameters:** benign_file benign_signature received_file

**Usage**
```
# The recieved file for deployment is trustworthy as its source is authenticated and integrity is intact
./signature.sh benign.zip benign.sign benign.zip
```

```
# The recieved file for deployment is not trustworthy as its source is not authenticated and integrity not intact
./signature.sh benign.zip benign.sign tampered.zip
```
