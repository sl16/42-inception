# Load the base image - using Alpine because it's lightweight
FROM alpine:3.20

# Update the package index, upgrade installed packages, and install Nginx
RUN apk update && apk upgrade && apk add nginx

# Copy custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static content (optional)
COPY index.html /usr/share/nginx/html/index.html

# Expose ports (this directive is actually purely for documentation, as it does not publish the ports)
EXPOSE 80
EXPOSE 443

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]