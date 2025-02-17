# 1. Prerequisites
      JDK

## Installation steps

#### 1. Java Development Kit (JDK) (Make sure JAVA_HOME is set)

      sudo apt update
      
      sudo apt upgrade
      
      sudo apt install openjdk-17-jdk
      
      java -version

      export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

      export PATH=$JAVA_HOME/bin:$PATH

      echo $PATH

            /usr/lib/jvm/java-17-openjdk-amd64/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin   

#### 2. Install Jenkins

      sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
      
      sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
      
      sudo apt update
      
      sudo apt install jenkins
      
      sudo systemctl start jenkins
      
     sudo systemctl enable jenkins
     
     sudo systemctl status jenkins

  #### 3.  Allow 8080 in incoming rules in the nsg on Azure.

  ![image](https://github.com/user-attachments/assets/ffd27c42-e74e-4ae5-b172-2850fcc1ff05)


  ## Jenkins will be accessible at <public-ip>:8080
  

  #### 4. Apache Maven

      sudo apt update
      
      sudo apt install maven
      
      mvn -version

      Apache Maven 3.6.3
      Maven home: /usr/share/maven
      Java version: 17.0.14, vendor: Ubuntu, runtime: /usr/lib/jvm/java-17-openjdk-amd64
      Default locale: en, platform encoding: UTF-8
      OS name: "linux", version: "6.8.0-1020-azure", arch: "amd64", family: "unix"

#### 4. Verify if git is installed.

       git --version
       git version 2.34.1

       which git
      /usr/bin/git

#### 5. Configure Jenkins

##### The initial password will be available at __/var/lib/jenkins/secrets/initialAdminPassword_

      sudo cat /var/lib/jenkins/secrets/initialAdminPassword

### 1. Configure tools used

![image](https://github.com/user-attachments/assets/4be3bae2-51f9-4d04-aa8e-bfb2c2decd6a)

![image](https://github.com/user-attachments/assets/fb23860f-2bac-4874-a850-660af956c591)

### 2. Install required plugins

1. Maven Integration
2. GitHub Integration
