# Use official Node image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Install dependencies first (better cache)
COPY package*.json ./
RUN npm install --production

# Copy source code
COPY . .

# Fly will inject PORT
ENV NODE_ENV=production

# Expose the port (Fly uses this)
EXPOSE 8080

# Start server
CMD ["node", "index.js"]
