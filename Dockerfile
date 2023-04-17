# 운영환경 도커 파일
FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json .
RUN npme install
COPY ./ ./
RUN npm run build

FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
