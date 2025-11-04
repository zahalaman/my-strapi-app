FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy only package files first (for caching)
COPY package*.json ./

# Install dependencies inside the container
RUN npm install

# Copy the rest of the project files
COPY . .

# Build the Strapi admin panel
RUN npm run build

# Expose the Strapi port
EXPOSE 1337

# Start Strapi
CMD ["npm", "run", "start"]
