################################################################################################################
##############
##############        kafka-note
##############
################################################################################################################



###############################  kafka topic ##########################################
设置 auto.create.topics.enable = false，默认设置为true。如果设置为true，则produce或者fetch 不存在的topic也会自动创建这个topic


描述主题：
kafka-topics.sh  --zookeeper cdh1:2181 --list
bin/kafka-topics.sh --describe --zookeeper cdh1:2181 --topic my-replicated-topic

创建主题：
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 1 --topic my-replicated-topic

删除topic：
sh kafka-topics.sh --delete --zookeeper 10.1.40.107:2181 --topic windowsbit
删除 /var/lib/kafka/[topic]

进入zookeeper，第一步无法删除，描述显示为 mark as deltetion 先进行第二步在进行第一步：

rmr /brokers/topics/topic-wgz-test
rmr /admin/delete_topics/topcic-wgz-test


############################  kafka producer ##########################################
执行生产者：
sh kafka-console-producer.sh --broker-list 10.1.40.107:9092 --topic crazybit

############################  kafka consumer ##########################################

指定group，不用手动创建：
用法：bin/kafka-console-consumer.sh –bootstrap-server localhost:9092 –topic afei [–group groupName] [–partition 目标分区]

consumer group下订阅的topic下的每个分区只能分配给某个group下的一个consumer(当然该分区还可以被分配给其他group)

执行消费者：
sh kafka-console-consumer.sh --zookeeper 10.1.40.107:2181 --topic crazybit --from-beginning
不能用localhost等名称，写具体IP地址。

#查看consumer group列表，使用--list参数

查看consumer group列表有新、旧两种命令，分别查看新版(信息保存在broker中)consumer列表和老版(信息保存在zookeeper中)consumer列表，因而需要区分指定bootstrap--server和zookeeper参数：
./kafka-consumer-groups.sh --bootstrap-server 172.17.3.17:9092 --new-consumer --list
bin/kafka-consumer-groups.sh --zookeeper 127.0.0.1:2181 --list

bin/kafka-consumer-groups.sh --zookeeper 127.0.0.1:2181 --group console-consumer-11967 --describe
bin/kafka-consumer-groups.sh --new-consumer --bootstrap-server 127.0.0.1:9292 --group lx_test --describe

删除group：
进入zk，rmr /kafka/consumers/group*
注意：从kafka-0.9版本及以后，kafka的消费者组和offset信息就不存zookeeper了，而是存到broker服务器上，所以，如果你为某个消费者指定了一个消费者组名称（group.id），那么，一旦这个消费者启动，这个消费者组名和它要消费的那个topic的offset信息就会被记录在broker服务器上。


############################  windows kafka ##########################################

windows下： kafka自带zk运行，kafka server可能起不来，producer和consumer都是目的ip：
create topic的过程应该就是创建windows到linux  broker的管道连接的过程，不创建则不能发送消息。
zookeeper-server-start.bat ../../config/zookeeper.properties
kafka-server-start.bat  ../../config/server.properties
kafka-topics.bat --create --zookeeper 10.x.x.107:2181 --replication-factor 1 --partitions 1 --topic windwsbit
kafka-console-producer.bat --broker-list [remote]:9092 --topic testDemo

注意下面两个的参数，bootstrap在老版本中不一定能够使用：
kafka-console-consumer.bat --zookeeper [remote]:2181 --topic testDemo --from-beginning
.\bin\windows\kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic test --from-beginning



#####################################  其他 ##########################################


在zookeeper终端中查看broker id：
sh zookeeper-shell.sh  10.1.40.107:2181
或者进入zk目录：
执行zk_home/ bin / zkCli.sh 执行ls /brokers/ids 就可以看到zk中存的所有的broker id list
去zk上看kafka集群  
[zk: localhost:2181(CONNECTED) 6] ls /brokers  
[zk: localhost:2181(CONNECTED) 9] ls /brokers/topics   
[zk: localhost:2181(CONNECTED) 10] ls /brokers/topics/test   
[zk: localhost:2181(CONNECTED) 11] ls /brokers/topics/test/partitions  

旧版本中：
kafka broker必须和zookeeper实例是同一个节点？
Kafka将元数据信息保存在Zookeeper中，包括topic、broker信息等

每次启动consumer不指定group，则consumer group name名字总是变的，属于不同用的消费者组。


修改日志级别：config文件夹下  tools-log4j.properties
旧版本中：
生产者——> broker：9092
消费者——>zookeeper——>topic对应的broker——>连接到broker

传输的数据是键值对形式，分别是<offset，string>

9092只是连接请求端口，不是数据传输端口
数据存放在/var/lib/kafka

对于消费者，kafka中有两个设置的地方：对于老的消费者，由--zookeeper参数设置；对于新的消费者，由--bootstrap-server参数设置
如果使用了--zookeeper参数,那么consumer的信息将会存放在zk之中，如果使用了--bootstrap-server参数,那么consumer的信息将会存放在kafka之中

/opt/cloudera/parcels/KAFKA-2.1.0-1.2.1.0.p0.115/lib/kafka/bin