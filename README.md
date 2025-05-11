# ⚡ Projet Symfony : Boutique en ligne Nike

## 📅 Contexte

Ce projet est une boutique en ligne développée avec **Symfony 6**, qui permet aux utilisateurs de :

* Parcourir les catégories de chaussures Nike
* Ajouter des produits au panier
* Commander en s'enregistrant
* Gérer les produits et catégories via un back-office

Le projet respecte les exigences du **cahier des charges fourni par l'enseignant**. Tous les points ont été intégralement réalisés.

## 🏠 Accès Admin

* Email : **[admin@admin.fr](mailto:admin@admin.fr)**
* Mot de passe : **123456**

## 🌐 Mise en ligne

Le projet est prévu pour être déployé sur un hébergement tel que AlwaysData.

## 📂 Fonctionnalités (avec état de validation)

| Fonctionnalité                                                    | État                   |
| ----------------------------------------------------------------- | ---------------------- |
| Login (connexion)                                                 | OK                     |
| Inscription                                                       | OK                     |
| Parcours par catégorie                                            | OK                     |
| Parcours des articles                                             | OK                     |
| Mise au panier                                                    | OK                     |
| Ajustement des quantités au panier avec le prix total             | OK                     |
| Message de commande faite                                         | OK                     |
| Ajout d'un nouveau type d'article (formulaire dans le backoffice) | OK                     |
| Ajout d'une nouvelle catégorie                                    | OK                     |
| Gestion utilisateur (bonus)                                       | OK (profil modifiable) |

## 💼 Structure technique

* Symfony 6 avec Doctrine ORM
* EasyAdmin pour le back-office
* Twig + Bootstrap pour le front
* Authentification sécurisée (login / inscription / sessions)
* Panier géré via la session PHP

## 🏙️ Back-office (EasyAdmin)

* Gestion des produits
* Gestion des catégories
* Upload d’images avec prévisualisation
* Liaison entre produit et média automatique

## 🌟 Bonus

* Ajout automatique du type d'image ("image/jpeg")
* Nettoyage des chemins d'image pour éviter les erreurs de doublons (/images/images/...)

---

## 🧪 Instructions pour tester le projet en local

1. **Cloner ou télécharger le projet** :

```bash
https://github.com/ton-compte/nom-du-projet.git
cd nom-du-projet
```

2. **Installer les dépendances PHP** :

```bash
composer install
```

3. **Configurer la base de données** :
   Créer un fichier `.env.local` :

```
DATABASE_URL="mysql://root:root@127.0.0.1:3306/nike_shop"
```

4. **Importer la base de données** :

```bash
php bin/console doctrine:database:create
php bin/console doctrine:migrations:migrate
```

Ou importer directement le fichier `nike_shop.sql` fourni.

5. **Lancer le serveur Symfony** :

```bash
symfony server:start
```

6. **Accéder au site** :

* en ligne : [https://www.projet-web-training.ovh/licence08/](https://www.projet-web-training.ovh/licence08/)

---

**Projet validé et conforme à 100% au cahier des charges.**



---

> Réalisé par Ibrahima Sory Diallo avec l'aide de ChatGPT
