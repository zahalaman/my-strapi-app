FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy only package files first (for caching)
COPY package*.json ./

# Install dependencies inside the container
RUN npm install

# Copy the rest of the project files
COPY . .

# Build the Strapi admin panel
ENV STRAPI_ADMIN_TS_CONFIG_PATH=./tsconfig.admin.json
RUN npm run build

# Expose the Strapi port
EXPOSE 1337

# Start Strapi
CMD ["npm", "run", "start"]
