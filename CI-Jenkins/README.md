## 1. Prerequisites

#### 1. Java Development Kit (JDK) (Make sure JAVA_HOME is set)

      sudo apt update
      
      sudo apt upgrade
      
      sudo apt install openjdk-17-jdk
      
      java -version

      export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/bin

      export PATH=$JAVA_HOME:$PATH

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
  


  #### 4. Apache Maven
