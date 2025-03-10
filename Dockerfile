FROM nginx:alpine

# Define the working directory
WORKDIR /usr/share/nginx/html

# Copy necessary files
COPY index.html offres.html reclamation.html script.js styles.css /usr/share/nginx/html/

# Update, install dependencies, and create directories with proper permissions
RUN apk update && apk upgrade && \
    mkdir -p /var/cache/nginx/client_temp && \
    chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx

# Switch to nginx user
USER nginx

# Expose port 80
EXPOSE 80

# Start nginx in non-daemon mode
CMD ["nginx", "-g", "daemon off;"]

