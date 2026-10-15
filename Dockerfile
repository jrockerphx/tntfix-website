FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Site config: browsers re-check pages every visit, images cache for a week
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy all files
COPY . /usr/share/nginx/html/

# Remove build files from html directory (they get copied too)
RUN rm -f /usr/share/nginx/html/Dockerfile /usr/share/nginx/html/nginx.conf

# Expose port
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
