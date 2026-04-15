#  TP1 - DevOps : Virtualisation & Déploiement avec Vagrant, Ubuntu et Tomcat

##  Objectif

Ce TP a pour objectif de mettre en place un environnement de déploiement d’une application web Java en utilisant les outils suivants :

* Virtualisation avec **Vagrant**
* Système d’exploitation **Ubuntu**
* Installation de plusieurs versions de Java (JDK 8, 11, 17)
* Serveur d’application **Tomcat 9**
* Déploiement d’une application web Java (WAR)
* Automatisation avec un script Bash interactif (`deploy.sh`)

---

##  1. Création de la machine virtuelle

###  Lancement de la VM

```bash
vagrant up
```

###  Connexion à la VM

```bash
vagrant ssh
```

---

##  2. Installation de Java (JDK 8, 11, 17)

```bash
sudo apt update
sudo apt install -y openjdk-8-jdk openjdk-11-jdk openjdk-17-jdk
```

###  Changer la version active

```bash
sudo update-alternatives --config java
```

---

##  3. Installation de Tomcat 9

```bash
sudo apt install -y tomcat9 tomcat9-admin
```

###  Démarrer Tomcat

```bash
sudo systemctl start tomcat9
```

###  Accès

```
http://192.168.56.10:8080
```

---

##  4. Déploiement de l’application Java

###  Cloner le projet

```bash
sudo apt install -y git maven
cd /opt
sudo git clone https://github.com/TON_USER/gestion_location_immo.git
sudo chown -R vagrant:vagrant gestion_location_immo
cd gestion_location_immo
```

###  Build Maven

```bash
mvn clean package
```

Le fichier généré :

```
target/GestionLocation-1.0-SNAPSHOT.war
```

###  Déploiement manuel

```bash
sudo cp target/GestionLocation-1.0-SNAPSHOT.war /var/lib/tomcat9/webapps/GestionLocation.war
```

---

##  5. Script de déploiement avec menu

### 📄 Fichier `deploy.sh`


###  Rendre exécutable

```bash
chmod +x deploy.sh
```

###  Exécution

```bash
./deploy.sh
```

---

##  6. Accès à l’application

```
http://192.168.56.10:8080/GestionLocation-1.0-SNAPSHOT
```

---

##  7. Vérification et logs

```bash
sudo systemctl status tomcat9
```

```bash
sudo journalctl -u tomcat9 -f
```

---

<img width="1894" height="943" alt="image" src="https://github.com/user-attachments/assets/16d76efd-c25d-4a94-94cf-7ea9076395a9" />
