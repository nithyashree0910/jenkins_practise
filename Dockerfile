# Use official lightweight Nginx image
FROM nginx:alpine

# Remove the default Nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy your static website files to Nginx web root
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 90

# Nginx runs automatically (no CMD needed, it's default)
