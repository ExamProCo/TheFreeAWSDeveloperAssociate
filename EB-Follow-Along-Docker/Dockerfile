# we'll use 10 since its same as Amazon Linux 1 default node version
FROM node:10
# where our app will be located in the image
RUN mkdir -p /app
WORKDIR /app
# move all source code
COPY . .
RUN npm install
CMD [ "npm", "start" ]
EXPOSE 8080