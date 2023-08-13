# Stage1: UI Build
FROM node:14 AS client-build
WORKDIR /usr/src
COPY client/ ./client/
RUN cd client && npm install && npm run build

# Stage2: API Build
FROM node:14 AS server-build
WORKDIR /usr/src
COPY server/ ./server/
RUN cd server && npm install && npm start

EXPOSE 80

WORKDIR /usr/src/server
CMD ["npm", "start"]