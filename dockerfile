FROM node:14-slim as base
EXPOSE 3000

# To proper Node shutdown
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

RUN mkdir /app && chown -R node:node /app
WORKDIR /app
USER node
COPY --chown=node:node package.json package-lock*.json ./
RUN npm ci && npm cache clean --force
ENV PATH=/app/node_modules/.bin:$PATH
RUN npm i
COPY --chown=node:node . .

FROM base as dev
CMD ["npm", "start"]

FROM base as test
CMD [ "npm", "test" ]