

APP_NAME="GestionLocation"
WAR_PATH="/opt/gestion_location_immo/target/GestionLocation-1.0-SNAPSHOT.war"
TOMCAT_WEBAPPS="/var/lib/tomcat9/webapps"

echo " Arrêt de Tomcat..." 
sudo systemctl stop tomcat9

echo " Nettoyage ancienne version..." 
sudo rm -rf $TOMCAT_WEBAPPS/$APP_NAME
sudo rm -f $TOMCAT_WEBAPPS/$APP_NAME.war

echo " Déploiement du WAR..." 
sudo cp $WAR_PATH $TOMCAT_WEBAPPS/

echo "Démarrage de Tomcat..."
sudo systemctl start tomcat9

echo "Déploiement terminé !"
