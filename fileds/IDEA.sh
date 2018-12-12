################################################################################################################
##############
##############        idea-note
##############
################################################################################################################
#IDEA 网络https改为http
找到settings->system settings->updata下面的Use secure Connetion去掉。

idea 注释：/**+回车
ctrl+alt+t  快速增加try
alt+insert  快速get/set

spring中ClassPathXmlApplicationContext读取路径是project structure-->modules里面配置
的 resources folds

#添加一个Spring Bean的配置文件（xml）
在src/main/resource/目录中点击右键，New->XML Configure file->Spring Config，

#idea创建子工程：
在父工程上右键点击new Module,依次点击maven，同样不要勾选“create from archetype”

#idea快捷键：
今天偶然发现了IntelliJ中 创建main函数的快捷键，依次还有for循环，System.out.println();

在编写代码的时候直接输入psv就会看到一个psvm的提示，此时点击tab键一个main方法就写好了。

psvm 也就是public static void main的首字母。
依次还有在方法体内键入for会有一个fori的提示，选中然后tab键，就会自动创建一个for循环。
如何像写一个System.out.println();就是sout
更多的提示可以CTRL + j 可以查看(前提是你用的默认的keymap模板)，mac系统下是command＋j。


#idea maven 依赖树，解决包冲突：
ctrl+alt+shift+U
图中的红色实线就算是冲突的，可以入上图那样，右键，排除，他就自动在pom文件里面给exclud啦。
还有一种是虚线的红线。
这种虚线，告诉你同一个jar都在哪里被多次引用了。



