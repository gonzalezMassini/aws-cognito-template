FROM node:20-alpine

WORKDIR /app

COPY package*.json /app/
RUN npm install

# Change the ownership and permissions
RUN chown -R node:node /app
RUN chmod -R 755 /app

COPY --chown=node:node . /app

RUN npm run build

USER node

# CMD ["npm", "start"]
CMD ["npx", "serve", "-s", "build"]
