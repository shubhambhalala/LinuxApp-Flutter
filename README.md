# linux_app

A new Flutter project.
Have you ever wanted to control your linux system over network using your phone and not only that connecting it with firebase to store the data of command you execute ? 
Here resides the solution! An App which take a
1. command input
2. Execute on Linux(RhelV8 for me) machine 
3. Store the data in Firestore(GCP Cloud)
4. Retrive the data and show it on your mobile device

# Note Linux VM:
command.py file is the API for this app. To make this work follow the step:
On the remote Linux System
1. Install Python3: yum install python3 (if you have older version change the required syntax in the command.py)
2. Install httpd: yum install httpd
3. Paste command.py in /var/www/cgi-bin/linux/create/
4. Make it executable: chmod +x command.py
5. Stop firewall: systemctl stop firewalld (you can make a specific entry to firewall also)
6. Stop SELinux: setenforce 0
7. Restart httpd service: systemctl restart httpd
8. Follow step 5-7 everytime you boot the Linux VM
# Note Firebase:
Make a firebase account and you will get a google-services.json file, download it and paste it in linux_app/android/app/
For security reasons, I haven't uploaded it 
Then go to firestore and create a project and start the collection.
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
