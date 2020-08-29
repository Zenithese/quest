FROM node:10
WORKDIR /app
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/rearc/quest.git .
RUN npm install
ENV SECRET_WORD TwelveFactor
EXPOSE 3000
CMD ["npm", "start"]