FROM node:14-alpine as builder
USER root
RUN mkdir -p /usr/src/expert-journey
WORKDIR /usr/src/expert-journey

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# If you are building your code for production, do a clean install of your dependencies
RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3000

CMD ["node", "server.js"]
