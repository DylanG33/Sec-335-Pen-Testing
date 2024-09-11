- sudo nmap -sn 10.0.5.21 (This command checks if the host is up without doing a full port scan. Capture the traffic with Wireshark while running this.)
- sudo nmap -sn 10.0.5.2-50 -oG - | awk '/Up$/{print $2}' > sweep.txt (This scans the range 10.0.5.2 to 10.0.5.50 and logs only the "up" IPs to sweep.txt.)
- fping -g 10.0.5.2 10.0.5.50 2>/dev/null | grep "is alive" > sweep.txt (The -g flag generates a range of IPs, and the 2>/dev/null suppresses error messages. Only "up" IPs are logged to sweep.txt.)


**During this exercise, I had the opportunity to explore various tools and techniques for network discovery. While each tool—ping, fping, and nmap—performed the same general task, they provided different levels of detail and flexibility.**
- Nmap’s -sn switch is a great way to discover hosts without doing a full port scan, and I found it to be much faster and more configurable than ping. It’s especially useful when combined with options like -oG for more formatted outputs.
- Using Wireshark to capture the traffic was an insightful experience, allowing me to visualize the network activity behind these commands.
- I learned that each tool has its strengths and ideal use cases. For a quick network sweep, fping is incredibly efficient, but for more detailed or controlled scans, nmap is a better choice.
- Documenting my process helped me understand the importance of logging results for future reference. This will be helpful in larger networks where manual checking isn’t feasible.
