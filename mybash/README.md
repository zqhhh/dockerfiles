# mybash

### 关于tzdata
```sh
# 只有安装了tzdata,TZ变量才有效
# 安装tzdata之前
# docker run --rm -it bash bash
bash-5.0# export TZ="Asia/Shanghai" ; date
Mon Aug 12 02:39:37 UTC 2019
# 安装tzdata之后
bash-5.0# apk add tzdata
bash-5.0# export TZ="Asia/Shanghai" ; date
Mon Aug 12 10:41:28 CST 2019
```

### 关于gawk, mktime函数
> mktime用于转换格式为:"YYYY MM DD HH MM SS"的时间为时间戳，时区取决于系统时区

```sh
# 如Asia/Shanghai时区的时间为: 2019 08 12 10 50 00
bash-5.0# export TZ="Asia/Shanghai"
bash-5.0# echo "2019 08 12 10 50 00" |awk '{print mktime($0)}'
1565578200
bash-5.0# export TZ="UTC"
bash-5.0# echo "2019 08 12 10 50 00" |awk '{print mktime($0)}'
1565607000
# 可见转换后得到的时间戳是不一样的
```
### 更新记录
+ 2020.10.16    
libfaketime修改容器内部时间,方便测试业务代码    
libc6-compat libc-dev,构建docker时不用添加 CGO_ENABLED=0