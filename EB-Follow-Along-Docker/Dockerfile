FROM node:10 # we'll use 10 since its same as Amazon Linux 1 default node version
RUN mkdir -p /app # where our app will be located in the image
WORKDIR /app 
COPY . . # move all source codels
RUN npm install
CMD [ "npm", "start" ]
EXPOSE 8080
