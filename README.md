# lookbusy-docker

用于使你的服务器看起来很忙碌，简单易用！懒得看部署方法可以直接跳到最后用懒人方法
原项目为 https://github.com/flow2000/lookbusy
本项目将其封装为docker进行部署，应要求，也提供二进制程序直接运行的方法

## 使用方法

### 构建镜像
克隆本仓库后
``` shell
docker build . t lookbusy
```

### 修改运行参数
修改 start.sh中的各项参数，参考如下

``` shell
lookbusy -c 50 # 占用所有 CPU 核心各 50%
lookbusy -c 50 -n 2 # 占用两个 CPU 核心各 50%
lookbusy -c 50-80 -r curve # 占用所有 CPU 核心在 50%-80% 左右浮动
lookbusy -c 0 -m 128MB -M 1000 # 每 1000 毫秒，循环释放并分配 128MB 内存
lookbusy -c 0 -d 1GB -b 1MB -D 10 # 每 10 毫秒，循环进行 1MB 磁盘写入，临时文件不超过 1GB
```

此处参考博客
https://51.ruyo.net/18289.html

### 运行

``` shell
docker run -d --name lookbusy --restart=always -v /PATH/TO/start.sh:/app/start.sh lookbusy
```
其中 **/PATH/TO/start.sh** 指到达克隆下来的lookbusy仓库的start.sh脚本的绝对路径

## 懒人方法
### 二进制文件启动
``` shell
wget https://raw.githubusercontent.com/velor2012/lookbusy-docker/main/lookbusy${-arm} -O lookbusy
&& chmod +x lookbusy
./lookbusy -c 50-60 -r curve -n 2 # 运行参数请根据实际情况修改
```
**注意**如果是arm架构，需要在lookbusy后加上-arm

### docker启动
``` shell
wget https://raw.githubusercontent.com/velor2012/lookbusy-docker/main/start.sh
```

修改start.sh配置后
```
docker run -d --name lookbusy --restart=always -v /PATH/TO/start.sh:/app/start.sh velor2012/lookbusy${-arm}
```
**注意**如果是arm架构，需要在lookbusy后加上-arm，即镜像名为velor2012/lookbusy-arm

