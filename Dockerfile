FROM nginx:alpine

# Définir le répertoire de travail
WORKDIR /usr/share/nginx/html

# Copier tous les fichiers nécessaires
COPY index.html offres.html reclamation.html script.js styles.css /usr/share/nginx/html/

# Mettre à jour et installer les dépendances
RUN apk update && apk upgrade && \
    chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx

# Changer d'utilisateur pour exécuter le conteneur en tant qu'utilisateur non privilégié
USER nginx

# Exposer le port 80
EXPOSE 80

# Lancer nginx en mode non-démon
CMD ["nginx", "-g", "daemon off;"]

