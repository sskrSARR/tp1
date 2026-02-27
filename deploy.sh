

APP_NAME="GestionLocation"
WAR_NAME="GestionLocation-1.0-SNAPSHOT.war"
WAR_PATH="/opt/gestion_location_immo/target/$WAR_NAME"
TOMCAT_WEBAPPS="/var/lib/tomcat9/webapps"

function stop_tomcat() {
    echo "Arrêt de Tomcat..."
    sudo systemctl stop tomcat9
}

function start_tomcat() {
    echo "Démarrage de Tomcat..."
    sudo systemctl start tomcat9
}

function deploy_app() {
    echo "Nettoyage ancienne version..."
    sudo rm -rf $TOMCAT_WEBAPPS/$APP_NAME
    sudo rm -f $TOMCAT_WEBAPPS/$APP_NAME.war

    echo "Déploiement du WAR..."
    sudo cp $WAR_PATH $TOMCAT_WEBAPPS/$APP_NAME.war

    echo "Application déployée avec succès"
}

function status_tomcat() {
    sudo systemctl status tomcat9
}

while true
do
    echo "-------------------------------------"
    echo "   MENU DEPLOIEMENT TOMCAT 9"
    echo "-------------------------------------"
    echo "1️  Arrêter Tomcat"
    echo "2️  Démarrer Tomcat"
    echo "3️  Déployer l'application Java"
    echo "4️  Redémarrer Tomcat"
    echo "5️  Statut de Tomcat"
    echo "0️  Quitter"
    echo "-------------------------------------"
    read -p "Votre choix : " choice

    case $choice in
        1)
            stop_tomcat
            ;;
        2)
            start_tomcat
            ;;
        3)
            stop_tomcat
            deploy_app
            start_tomcat
            ;;
        4)
            stop_tomcat
            start_tomcat
            ;;
        5)
            status_tomcat
            ;;
        0)
            echo "Fin du script"
            exit 0
            ;;
        *)
            echo "Choix invalide"
            ;;
    esac
done