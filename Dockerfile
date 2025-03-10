FROM nginx:alpine

# Définir le répertoire de travail
WORKDIR /usr/share/nginx/html

# Copier tous les fichiers nécessaires en une seule commande
COPY index.html offres.html reclamation.html script.js styles.css /usr/share/nginx/html/

# Mettre à jour et installer les dépendances en une seule commande pour réduire le nombre de couches
RUN apk update && apk upgrade && \
    chown -R nginx:nginx /usr/share/nginx/html && \
    mkdir -p /var/cache/nginx && \
    chown -R nginx:nginx /var/cache/nginx

# Changer d'utilisateur pour exécuter le conteneur en tant qu'utilisateur non privilégié
USER nginx

# Exposer le port 80
EXPOSE 80

# Lancer nginx en mode non-démon
CMD ["nginx", "-g", "daemon off;"]

