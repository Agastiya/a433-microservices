FROM node:14-alpine

WORKDIR /app

COPY . .

ENV NODE_ENV=production 

ENV DB_HOST=item-db

#script tambahan
RUN npm config set strict-ssl false

RUN npm install --production --unsafe-perm && npm run build

EXPOSE 8080

CMD ["npm","start"]
