FROM nginx:alpine

# Remove default nginx config
RUN rm -rf /usr/share/nginx/html/*

# Copy all files
COPY . /usr/share/nginx/html/

# Remove Dockerfile from html directory (it gets copied too)
RUN rm -f /usr/share/nginx/html/Dockerfile

# Expose port
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]