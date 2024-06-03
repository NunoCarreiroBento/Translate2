# Use Nginx image
FROM nginx:latest

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Set working directory
WORKDIR /usr/share/nginx/html

# Install dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy Flask app
COPY . .

EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
