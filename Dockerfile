FROM nginx:alpine

# Définir le répertoire de travail
WORKDIR /usr/share/nginx/html

# Copier les fichiers nécessaires dans le conteneur
COPY index.html offres.html reclamation.html script.js /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf

# Mettre à jour les paquets et créer les répertoires nécessaires
RUN apk update && apk upgrade && \
    mkdir -p /var/cache/nginx/client_temp /var/run/nginx && \
    chmod -R 755 /var/cache/nginx /var/run/nginx && \
    chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx /var/run/nginx

# Exposer le port 8081
EXPOSE 8081

# HEALTHCHECK
HEALTHCHECK CMD ["curl", "--fail", "http://localhost:8081"]

# Démarrer nginx avec le port configuré dans nginx.conf
CMD ["nginx", "-g", "daemon off;"]

