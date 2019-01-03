FROM node:latest-alpine

ENV APP_ROOT /src
WORKDIR /opt/docker
COPY package.json .

RUN npm install
RUN npm run build
RUN npm install --save npm-git-install
RUN git clone https://github.com/isaiastp/nuxt-hello-world.git
RUN cd nuxt-hello-world
RUN npm install -g vue-cli && yarn install
COPY . .

# Build app
RUN yarn run build

ENV HOST 0.0.0.0

EXPOSE 3000

VOLUME ["/opt/docker"]

# start command
CMD [ "yarn", "start" ]