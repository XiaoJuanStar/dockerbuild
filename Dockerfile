# from 构建镜像的基础源镜像 该image镜像文件继承官方的node image
FROM node:10.0

# 在容器中创建一个目录
RUN mkdir -p /usr/workplace/nodejs/

#定位到容器的工作目录
WORKDIR /usr/workplace/nodejs

# RUN/COPY是分层的，package.json 提前，只要没修改就不会重新安装包
COPY package.json /usr/workplace/app/package.json
RUN cd /usr/workplace/app/
RUN npm i


# 把当前目录下所有的文件拷贝到 Image 的 /usr/workplace/nodejs/目录下
COPY . /usr/workplace/nodejs/

EXPOSE 3000
CMD npm start