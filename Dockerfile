# Use official Node image (stable runtime)
FROM node:24-alpine

# Create working directory inside container
WORKDIR /usr/src/app

# Copy package files first (for Docker layer caching)
COPY app/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app source code
COPY app/ .

# Tell Docker which port the app uses
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]
