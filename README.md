说明文档
===

## 文件说明

1. input文件夹中的三个文件分别代表三组输入

2. lib文件夹中的三个文件: 

- input\_extraction.rb
- tax\_calculator.rb
- print\_result.rb文件

input文件主要将输入的信息转换成结构化的数据(如商品名称、单价、是否为免税品、是否为进口等)，存入hash数组中;
calculator文件则主要计算每件商品的销售价，总税收及商品销售总价; 
print文件主要负责信息的格式化输出。

3. spec文件夹中的文件分别为lib中对应文件的RSpec测试

4. print_tax则为主要的执行脚本，在给定的输入文件情况下，按照指定要求格式化输出对应信息。


## 用法说明

将每组输入存入一个文件中，并且放在input文件夹下，然后执行:

```
$ ruby print_tax <input_file>
```

