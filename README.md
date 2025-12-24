Log Sentinel - Automated Security Log Analyzer

> A lightweight, automated DevOps tool that monitors Linux server logs in real-time to detect security threats and generate instant incident reports.

 Project Overview
**Log Sentinel** is a "Robot Security Guard" for Linux servers. In a real-world environment, servers generate thousands of log lines per minute, making it impossible for human administrators to manually detect attacks like brute-force attempts. 

This project solves that problem by automating the **Monitoring** and **Feedback** phases of the DevOps lifecycle. It continuously scans logs against a configurable list of "Threat Patterns" and alerts administrators immediately upon detection.

---

 Key Features
* **Automated Scanning:** Parses massive log files instantly using optimized Linux text processing.
* **Customizable Threat Detection:** Uses a version-controlled "Rules Engine" (`patterns.txt`) to define what constitutes a threat.
* **Instant Reporting:** Generates timestamped security reports detailing the attacker's IP and frequency of attempts.
* **DevOps Build Integration:** Uses **Apache Maven** to standardize the project structure and package the tool into a deployable artifact (`.zip`).

---

Technology Stack
* **OS:** Linux (RHEL/CentOS/Ubuntu)
* **Scripting:** Bash Shell Scripting (`grep`, `awk`, `sed`)
* **Build Tool:** Apache Maven (Assembly Plugin)
* **Version Control:** Git

---

Project Structure
```text
LogSentinel_Project/
├── src/
│   └── main/
│       ├── scripts/
│       │   ├── sentinel.sh       # The main automation script (Logic)
│       │   └── patterns.txt      # Configurable list of threat keywords
│       └── assembly/
│           └── dist.xml          # Maven assembly configuration
├── pom.xml                       # Maven build configuration
├── dummy.log                     # Sample log file for demonstration
└── README.md                     # Project documentation
Installation & Usage
Prerequisites
Linux Environment (Terminal/Git Bash)

Java (JDK 8+) and Maven installed (for the build step)

Step 1: Clone the Repository
Bash

git clone [https://github.com/YOUR_USERNAME/LogSentinel_Project.git](https://github.com/YOUR_USERNAME/LogSentinel_Project.git)
cd LogSentinel_Project
Step 2: Setup the Demo Environment
Since we are not running this on a live production server, we use a dummy log file to simulate attacks.

Ensure dummy.log exists in the root folder.

Verify permissions:

Bash

chmod +x src/main/scripts/sentinel.sh
Step 3: Run the Sentinel (Manual Execution)
Execute the script to scan the logs.

Bash

cd src/main/scripts
./sentinel.sh
Expected Output:

Plaintext

[INIT] Log Sentinel Started...
[SCANNING] Searching for: 'Failed password'
   -> [ALERT] Found 3 matches!
[DONE] Scan Complete. Report saved to root folder.
Step 4: Build for Deployment (DevOps Lifecycle)
To package this tool for distribution to other servers, run the Maven build:

Bash

# Return to root directory
cd ../../../

# Trigger the build
mvn package
The deployable ZIP file will be generated in the target/ directory.

Configuration
To add new security rules (e.g., to detect "Timeout" errors), simply edit the pattern file:

Open src/main/scripts/patterns.txt.

Add your new keyword (e.g., Session timeout).

Save and run the script again.
