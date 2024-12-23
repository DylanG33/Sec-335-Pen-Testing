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

![201966531-392f5726-a013-4aec-af3c-9153fb271ea6](https://github.com/user-attachments/assets/a5546dc5-858d-43b2-a037-526cdb5f6caf)

#### **The Hash!**  
- Once I discovered the hash I immeditalitly reconginzied it and entered it into one of the first google search results for "hash calculator"
- Sure enough after a few tries I was able to get this:
```
Moria2Featon6
```
![access](https://github.com/user-attachments/assets/7268e7fe-f91e-408f-96b3-70a0a64978b0)
Just gonna leave this here :)
---

### **How You Achieved Root/Administrative Level Compromise**
- **Steps to Privilege Escalation:**  
  1. logged onto Windows VM
  2. Loaded up RDP and logged into with the credentials Administrator and Moria2Featon6
  3. typed whoami and hostname, as well as ipconfig to verify all the credentials were legit and that I was administrator
![proof](https://github.com/user-attachments/assets/7648d74f-a6bf-47ad-8e9d-317d219ef59a)



---

### **User Flag**
- After a good 30 minuets of search I was able to find the userflag in its own directory and opened it in notebook++
  ![userflag](https://github.com/user-attachments/assets/d311abe6-2af0-456b-90d7-39fa5330e830)

---

### **Root Flag**
- shortly after I was able to spot the root flag with my knowledge of the directories now
![rootflag](https://github.com/user-attachments/assets/bb1d8105-401a-4ee8-bab3-9ecf219833df)

---

### **How Might the Vulnerabilities Be Mitigated by the Systems Administrator and Developer?**
- This system had significant vulnerabilities, including the reuse of passwords and an SQL injection flaw. To address the SQL injection issue, input validation and sanitization of URL requests are essential before treating them as trustworthy. Furthermore, implementing unique passwords for each credential ensures that if an attacker compromises one password, it cannot be reused across multiple applications.

---

## **Additional Notes/Reflections**
- **Reflections:**
Overall this lab was really so much fun and even though it took countless hours I had the most fun learning compared to any lab I have been tested n thus far in Cyber classes. I have much better knowledge of directories and SQL Injection since I got to put it to the test. As far as commands go, I've been getting the hang of new ones quite easily but it can take me a couple tries to adjust. Most of the time I would be really excited after getting to a new part in the lab and then I would be just stuck and not know where to go after. 
