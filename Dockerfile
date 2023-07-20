FROM node:18.16

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package.json yarn.loc[k] ./

ENV NODE_ENV=production

ENV SERVER_PORT=3001

RUN yarn install

COPY . .

RUN yarn generate

COPY --chown=node:node . .

USER node

EXPOSE 3001
ENV JWT_ACCESS_SECRET=secret
ENV JWT_REFRESH_SECRET=secret

CMD [ "yarn", "start" ]

# para a documentação seguida para construção desse arquivo, vá para o step 3 do link:
# https://www.digitalocean.com/community/tutorials/como-construir-uma-aplicacao-node-js-com-o-docker-pt
