## ygopro(server)
一个linux版的ygopro服务端。

###编译
* 需要以下组件
 * premake4
 * libevent
 * sqlite3
 * lua5.2
 * gcc
* 可参考 https://github.com/mercury233/ygopro-server/wiki 中的脚本

###运行
* 使用[ygopro-server-lite](https://github.com/mercury233/ygopro-server)运行
* 手动运行的参数是
 * ./ygopro 0 0 0 1 F F F 8000 5 1 180
 * 端口（0为随机）
 * 禁卡表编号
 * 卡片允许
 * 决斗模式
 * 旧规则
 * 不检查卡组
 * 不洗切卡组
 * 初始LP
 * 初始手牌数
 * 每回合抽卡
 * 每回合时间
