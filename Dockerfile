# Use the official Nginx base image
FROM nginx:alpine

# Copy the HTML file from the src folder into the Nginx HTML directory
COPY ../src/index.html /usr/share/nginx/html

# Expose port 80 to the host machine
EXPOSE 80
