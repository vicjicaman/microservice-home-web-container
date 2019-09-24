FROM node:8.13.0-alpine

RUN mkdir -p /app
RUN chown -R node /app

USER node

WORKDIR /app/node_modules/@nebulario/microservice-home-web

ARG CACHEBUST=1
RUN echo "CACHE $CACHEBUST"

COPY --chown=node:node ./node_modules /app/node_modules

ENTRYPOINT ["node"]
CMD ["dist/index.js"]
