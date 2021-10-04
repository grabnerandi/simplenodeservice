FROM node:15

ARG BUILD_NUMBER=1
ENV BUILD_NUMBER=$BUILD_NUMBER

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

RUN apt-get update -y
RUN apt-get install -y ca-certificates
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080

CMD [ "npm", "start" ]