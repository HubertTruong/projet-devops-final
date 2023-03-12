# Projet DevOps - Hubert & Archibald

## Table des matières :
###### Description du projet
###### Technologies utilisées
###### Commandes à utiliser pour lancer le projet
###### Problèmes rencontrés et solutions
###### Avis personnels sur ce projet

## Description du projet :
Le projet consitste en l'automatisation du processus de création de machines virtuelles qui vont elles-mêmes faire des tâches automatisées.

## Technologies utilisées :
Pour ce faire, nous avons utilisé plusieurs technologies :
- Vagrant
> Automatiser la création de machines virtuelles, avec la mise en place d'un script Bash (qui va installer Ansible sur une VM)
* Ansible
> Automatiser les tâches que vont effectuer les machines virtuelles précédemment créées (par exemple, installer Docker sur la VM).
+ Docker
> Créer des containers qui vont permettre de mieux gérer le déploiement de mon application sur la VM.

## Commandes à utiliser pour lancer le projet :
1. Pour lancer le projet, il faut tout d'abord faire un pull depuis Github, dans un dossier de votre choix :
```
git clone https://github.com/HubertTruong/projet-devops-final.git
```
2. Ensuite, vérifiez que vous avez bien les fichiers suivants :
> project.sh
> Vagrantfile
3. Ouvrir un terminal depuis votre environnement d'édition de code, se placer dans le dossier de projet avec la commande suivante :
```
cd projet-devops-final
```
4. Lancer le projet avec la commande : 
```
vagrant up
```
5. Attendre la mise en place du projet et vérifier en rentrant l'IP suivante dans votre navigateur de recherche : http://192.168.99.11 une fois le programme monté et exécuté.

## Problèmes rencontrés et solutions :
Les gros problèmes rencontrés dans ce projet sont :
- Distribution Ubuntu assez lourde, donc lenteur lors du lancement du Vagrant
> Solution : Changement de distribution (Ubuntu vers CentOS pour charger plus vite)
* Problèmes de liens SSH entre les VM
> Solution : Ajout de lignes de codes trouvées sur Stack Overflow pour pallier le problème
```
config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
  end
  config.vm.provision :shell, :inline => "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd;", run: "always"
```
+ Certaines commmandes n'étaient pas automatisées/ne fonctionnaient pas (notamment l'installation de Docker sur la VM)
> Solution : Comme j'étais sur Ubuntu avant, `yum` ne fonctionnait pas et je ne m'étais pas rendu compte de ce bug, donc j'ai changé d'OS pour ça aussi, mais il fallait rajouter `sudo yum -y ...` car le préfixe `-y` permet d'accepter directement sans devoir intervenir. Grâce à ça, l'automatisation a fonctionné. 

## Avis personnels sur ce projet :
Ce projet était instructif mais assez compliqué. Personnellement il nous manquait quelques bases et nous avions mal géré notre temps. Mais nous nous sommes accrochés. Parmi tous les projets qu'on a dû faire, c'était un des projets les plus difficiles (avis perso) car il fallait faire beaucoup de débug et quand il y avait un problème, il fallait relancer intégralement `vagrant up`, ce qui était vraiment long. Sinon on a appris à utiliser Vagrant et Ansible, c'est très intéressant mais pour ma part ce n'est pas ce qu'il me plaît le plus.
