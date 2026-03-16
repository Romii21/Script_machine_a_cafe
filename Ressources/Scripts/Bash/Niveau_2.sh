#! /bin/bash
#
# ===============================================
#
# Scipt machine à café de Niveau 1
#
# ===============================================
#
# Consignes :
# - Afficher un menu avec trois choix : café, thé, chocolat
# - Choisir une boisson avec un chiffre (de 1 à 3 par exemple)
# - Afficher le choix de la boisson
# - Après le choix de la boisson, demander :
#	- Si on a un gobelet (Oui/Non) avec une action suivant la réponse
#	- Si on veut du sucre (Oui/Non) avec une action suivant la réponse
# - Afficher message qui résume la commande :
#	- La boisson
#	- La gestion du gobelet
#	- La gestion du sucre
# - Gérer les erreurs de saisie (mauvaise réponse)
# - Afficher un message `Vous avez choisi <la boisson>. Bonne dégustation !`
# - Sortir du script
#
# ===============================================

# Variable du script

boisson1="Café"
boisson2="Thé"
boisson3="Chocolat"

# Fonction pour les boissons

function boisson ()
{
    echo "Vous avez choisis $1."
    MsgBoisson=$1
    echo ""
    sleep 1
}

function gobelet ()
{
    read -p "Voulez-vous un gobelet ? (O/N) " RepBesoin
    echo ""
    sleep 1

    case $RepBesoin in

        O|o)
            echo "Mise à disposition d'un gobelet..."
            MsgGobelet="Gobelet fournit"
            echo ""
            sleep 1
            ;;

        N|n)
            echo "Posez votre gobelet sur le socle"
            MsgGobelet="Gobelet non fournit"
            echo ""
            sleep 1
            ;;
        
        *)
            echo "Réponse invalide. Gobelet fournit pas défaut"
            MsgGobelet="Gobelet fournit (par défaut)"
            echo ""
            sleep 1
            ;;
    esac
}

function sucre ()
{
    read -p "Voulez-vous du sucre ? (O/N) " RepBesoin
    echo ""
    sleep 1

    case $RepBesoin in

        O|o)
            echo "Mise à disposition d'un sachet de sucre"
            MsgSucre="Sucre fournit"
            echo ""
            sleep 1
            ;;

        N|n)
            echo "Suite de la commande"
            MsgSucre="Sucre non fournit"
            echo ""
            sleep 1
            ;;
        
        *)
            echo "Réponse invalide. Gobelet fournit pas défaut"
            MsgSucre="Sucre non fournit (par défaut)"
            echo ""
            sleep 1
            ;;
    esac
}

function resultat ()

{
    echo ""
    echo " ================================= "
    echo "       Résumé de la commande       "
    echo " ================================= "
    echo ""
    echo " Boisson : $MsgBoisson "
    echo " Gobelet : $MsgGobelet "
    echo " Sucre   : $MsgSucre "
    echo ""
    echo " ================================= "
    echo ""
    echo "Vous avez choisi $MsgBoisson. Bonne dégustation !"
    echo ""
}

clear

# Message d'acceuil

echo "Bienvenue"
sleep 1

# Affichage des choix

echo ""
echo "Quelle boisson souhaitez-vous choisir ?"
echo ""
echo "1. $boisson1"
echo "2. $boisson2"
echo "3. $boisson3"
echo "x. Sortie"
echo ""

# Lecture du choix

read -p "Votre choix : " choix
echo
sleep 1

# stucture case pour la sortie du choix

case $choix in

    1)
        boisson $boisson1
        gobelet
        sucre
        resultat
        exit
        ;;

    2)
        boisson $boisson2
        gobelet
        sucre
        resultat
        exit
        ;;

    3) 
        boisson $boisson3
        gobelet
        sucre
        resultat
        exit
        ;;
    
    x|X)
        echo "Au revoir"
        exit
        ;;

    *)
        echo "Choix invalide"
        exit
        ;;
esac
