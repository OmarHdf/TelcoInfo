FROM nginx:alpine

# Définir le répertoire de travail
WORKDIR /usr/share/nginx/html

# Copier les fichiers nécessaires dans le conteneur
COPY index.html offres.html reclamation.html script.js /usr/share/nginx/html/

# Mettre à jour les paquets, installer les dépendances et créer des répertoires
RUN apk update && apk upgrade && \
    mkdir -p /var/cache/nginx/client_temp && \
    chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx && \
    mkdir /var/run/nginx && \
    chown nginx:nginx /var/run/nginx

# Passer à l'utilisateur nginx
USER nginx

# Exposer le port 8081
EXPOSE 8081

# Ajouter une instruction HEALTHCHECK pour vérifier la santé du conteneur
HEALTHCHECK CMD ["curl", "--fail", "http://localhost:8081"]

# Démarrer nginx en mode non-démon
CMD ["nginx", "-g", "daemon off;"]

