##base docker

#构建镜像
sudo docker build -f ./docker/Dockerfile --rm -t mmaction2 . 
#构建普通容器
sudo docker run --gpus all --shm-size=8g -it -v /home/ww/source/actionRec/mmaction2/work_dirs:/mmaction2/data mmaction2 


#推送到harbor私有镜像仓库
sudo docker tag mmaction2:latest 172.16.10.101:30002/aitestdocker/mmaction2:0.1
sudo docker push 172.16.10.101:30002/aitestdocker/mmaction2:0.1

#构建桥接网络容器
sudo docker run --gpus all --shm-size=8g -it --name mmaction2 --network bridgenet --network-alias mmaction2 mmaction2

##weight docker
sudo docker run --shm-size=2g -it --name dockeraction2weight --network bridgenet --network-alias dockeraction2weight dockeraction2weight:v1.0 /bin/bash

#weight推送到私有仓库
sudo docker tag dockeraction2weight:v1.0 172.16.10.101:30002/aitestdocker/action2weight:0.1
sudo docker push 172.16.10.101:30002/aitestdocker/action2weight:0.1
