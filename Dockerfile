FROM node:19.5.0-alpine

# We indicate our working directory
WORKDIR /app

# Copy package json and package-lock.json in container
COPY package*.json ./

# Install dependencies
RUN npm install 

# Copy the rest of the application into the container
COPY . .

# Install prisma
RUN npm install -g prisma

# Generate Prisma client
RUN prisma generate

# Copy Prisma schema
COPY prisma/schema.prisma ./prisma/

# Open port 
EXPOSE 3000

# Run server
CMD ["npm","start"]
