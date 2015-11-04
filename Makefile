book-name = gitbook						#书名
branch-name = $(book-name) 				#分支名, 默认和书名一致
book-dir = book-$(book-name) 			#书籍名, 生成的
html-dir = html-hub 					#网站根目录


## 本地安装 book.json 中配置的插件
plugin:  
	gitbook install

## 生成网站
site:
	gitbook build . $(book-dir) 

## push html to github
move_html:
	make clean
	make site
	bash ./move_html.sh ${book-dir} ../$(html-dir)

##  push book to github
push:
	git push origin $(branch-name)

## 本地服务  
serve:
	gitbook serve --port 4040

## 初始化书籍结构
init:
	gitbook init

## 清除历史数据
clean:
	bash ./clean-project.sh book-$(book-name) _book

# 1. 安装 book.json 中的插件
# 2. 生成网站
# 3. 把是个的站点移动到主网站的子目录下
# 2. 推送当前源码分支到github
# 3. 开启本地网站服务
# 4. 初始化书籍结构(根据 SUMMARY.md)
# 5. 清楚站点数据以及默认站点数据
# 6. 增添 比较
