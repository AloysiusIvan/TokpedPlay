# Stage1: client Build
FROM node:14 AS client-build
WORKDIR /usr/src
COPY client/ ./client/
RUN cd client && npm install && npm run build

# Stage2: server Build
FROM node:14 AS server-build
WORKDIR /usr/src
COPY server/ ./server/
RUN cd server && npm install && npm run build

# Stage3: Packagign the app
FROM node:14
WORKDIR /root/
COPY --from=client-build /usr/src/client/build ./client/build
COPY --from=server-build /usr/src/server/dist .

EXPOSE 8080

CMD ["node", "server.bundle.js"]