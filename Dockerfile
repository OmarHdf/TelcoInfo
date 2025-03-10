FROM nginx:alpine

# Define working directory
WORKDIR /usr/share/nginx/html

# Copy the necessary files
COPY index.html offres.html reclamation.html script.js styles.css /usr/share/nginx/html/

# Update and install dependencies
RUN apk update && apk upgrade && \
    mkdir -p /var/cache/nginx/client_temp && \
    chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx

# Change user to run the container as a non-root user
USER nginx

# Expose port 80
EXPOSE 80

# Start nginx in non-daemon mode
CMD ["nginx", "-g", "daemon off;"]

