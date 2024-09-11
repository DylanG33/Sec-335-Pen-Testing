1. Basic Nmap Commands
- nmap 10.0.5.21
- nmap -sn 10.0.5.2-50
2. Port Scanning
-   sudo nmap -p 3389 10.0.5.21
-   sudo nmap -p 1-6000 10.0.5.21
3. Service and Version Detection
-   sudo nmap -sV -p 3389 10.0.5.21
4. Aggressive Scan (-A Flag)
- sudo nmap -A -p 3389 10.0.5.21
5. Scanning Multiple Ports
- sudo nmap -p 1-6000 10.0.5.21
6. Selective Version Scanning
- sudo nmap -sV -p 135,139,445 10.0.5.21
7. Advanced Nmap Scanning
- sudo nmap -A -p 135,139,445 10.0.5.21


Weekly Reflection on Nmap and RDP Setup
This week’s lab was a deep dive into network scanning and system configurations, with a focus on enabling and scanning for Remote Desktop Protocol (RDP) services on a Windows 10 machine.

Enabling RDP on Windows 10:
Setting up RDP through PowerShell was straightforward, but it took some time to understand the necessary firewall rules that allow RDP traffic. Running Nmap to scan the RDP port helped confirm whether or not the service was correctly exposed to the network.

Nmap Scanning:
Running various Nmap scans (like -sV and -A) was extremely useful in identifying open ports and services. I learned how to selectively target ports and analyze the services running behind them. Using the -A option for aggressive scanning revealed detailed information about RDP, including the authentication mechanisms.

RDP Connection Using Remmina:
Once RDP was enabled and open, connecting via Remmina on Kali was fairly simple. The connection was seamless, and it was satisfying to see the remote desktop in action.

Challenges:
One of the most significant challenges was managing the output from Nmap. While it's a powerful tool, the volume of information can be overwhelming. Selecting the right flags (such as -sV and -A) helped me get the relevant details while filtering out unnecessary data.

Learning Outcome:
This lab reinforced the importance of knowing which ports and services are exposed on a network. Nmap is a vital tool for both offensive and defensive security, and this lab gave me a better understanding of how to use it in practical scenarios.
