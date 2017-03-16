//
//  W3CViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/4/18.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "W3CViewController.h"

@interface W3CViewController ()

@end

@implementation W3CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 SELECT  :从表中选取数据             eg:SELECT City,Address FROM t_person;
 DISTINCT:列出不同（distinct）的值。 eg:SELECT DISTINCT City FROM t_person;
 WHERE:有条件地从表中选取数据         eg:SELECT * FROM t_person WHERE City = 'Beijing';
 AND&OR:在 WHERE 子语句中把两个或多个条件结合起来。    eg:SELECT * FROM t_person WHERE FirstName = 'Fan' OR LastName = 'Adams';
 ORDER BY:根据指定的列对结果集进行排序  eg:SELECT LastName,Year FROM t_person ORDER BY Year DESC;
 INSERT INTO:向表格中插入新的行。    eg:INSERT INTO t_person (Address,Year,City,LastName) VALUES ('Changan Street',1989,'Beijing','Carter');
 UPDATE:修改表中的数据。            eg:UPDATE t_person SET LirstName = 'Fant' WHERE LastName = 'White';
 DELETE:删除表中的行                eg:DELETE FROM t_person WHERE lastName = 'Carter';  删除所有数据: DELETE FROM 石家庄市;
 TOP(LIMIT):返回的记录的数目 eg:SELECT * SELECT TOP 2 * FROM t_person; 或者: SELECT * FROM t_person LIMIT 2;
 LIKE:在 WHERE 子句中搜索列中的指定模式  eg:SELECT * FROM t_person WHERE City LIKE'N%';
 IN:在 WHERE 子句中规定多个值        eg:SELECT * FROM t_person WHERE LastName IN ('Adams','Carter');
 BETWEEN ... AND:取介于两个值之间的数据范围 eg:SELECT * FROM t_person WHERE LastName BETWEEN 'Adams' AND 'Carter';
 DROP:删除索引、表和数据库;         eg:DROP TABLE t_person;
 ALTER:在已有的表中添加、修改或删除列  eg:ALTER TABLE t_parking ADD cost date;
 
 删除: ALTER TABLE t_parking DROP cost date; 不起作用
 解决方法:
 1.创建一个临时表，把除了要删的字段以外的字段加上
 create table _temp as select _id,name,age,balance from person;
 select * from _temp;
 
 2.删除原表
 
 drop table person;
 
 3.把临时表命名成原表
 
 alter table  _temp rename to person;
 */














@end
