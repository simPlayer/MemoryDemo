//
//  SQLiteBaseUseViewController.m
//  BigShow1949
//
//  Created by zhht01 on 16/4/18.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "SQLiteBaseUseViewController.h"
#import <sqlite3.h>

@interface SQLiteBaseUseViewController ()
{
    sqlite3 *_db;
    
}
@end

@implementation SQLiteBaseUseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // db是数据库的句柄,就是数据库的象征, 要对数据库进行增删改查,就得操作这个实例

    
    // 获得数据库文件的路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [doc stringByAppendingPathComponent:@"students.sqlite"];
    NSLog(@"fileName = %@", fileName);
    
    // 将OC字符串装换为C语言的字符串
    const char *cfileName = fileName.UTF8String;
    
    int result = sqlite3_open(cfileName, &_db);
    if (result==SQLITE_OK) {        //打开成功
        NSLog(@"成功打开数据库");
        
        //2.创建表
        const char  *sql="CREATE TABLE IF NOT EXISTS t_students (id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,age integer NOT NULL);";
        char *errmsg=NULL;
        result = sqlite3_exec(_db, sql, NULL, NULL, &errmsg);
        if (result==SQLITE_OK) {
            NSLog(@"创表成功");
            
            NSString *insertSql=[NSString stringWithFormat:@"INSERT INTO t_students (name,age) VALUES ('杨帆', 22);"];
            //2.执行SQL语句
            char *errmsg=NULL;
            int result = sqlite3_exec(_db, insertSql.UTF8String, NULL, NULL, &errmsg);
            NSLog(@"result = %zd", result);
            
            if (result == SQLITE_OK) {
                NSLog(@"插入数据成功--%s", errmsg);
            }else {
                NSLog(@"插入数据失败--%s",errmsg);
            }


        }else
        {
            NSLog(@"创表失败----%s",errmsg);
        }
    }else
    {
        NSLog(@"打开数据库失败");
    }

}

- (IBAction)insert {
    

    sqlite3 *db;
    for (int i=0; i<20; i++) {
         //1.拼接SQL语句
        NSString *name=[NSString stringWithFormat:@"杨帆--%d",arc4random_uniform(100)];
        int age=arc4random_uniform(20)+10;
//        NSString *sql=[NSString stringWithFormat:@"INSERT INTO t_students (name,age) VALUES ('%@',%d);",name,age];
//        NSString *sql=[NSString stringWithFormat:@"INSERT INTO t_students (name,age) VALUES ('杨帆', 22);"];
//
//        //2.执行SQL语句
//        char *errmsg=NULL;
//        int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, &errmsg);
//        NSLog(@"result = %zd", result);
//        if (errmsg) {//如果有错误信息
//            NSLog(@"插入数据失败--%s",errmsg);
//        }else{
//            NSLog(@"插入数据成功--%s", errmsg);
//        }
        
        NSString *insertSql=[NSString stringWithFormat:@"INSERT INTO t_students (name,age) VALUES ('杨帆2we', 22);"];
        //2.执行SQL语句
        char *errmsg=NULL;
        int result = sqlite3_exec(db, insertSql.UTF8String, NULL, NULL, &errmsg);
        NSLog(@"result = %zd", result);
        
        if (result == SQLITE_OK) {
            NSLog(@"插入数据成功--%s", errmsg);
        }else {
            NSLog(@"插入数据失败--%s",errmsg);
        }
    }

}

- (IBAction)delete_ {

}

- (IBAction)update {

}

- (IBAction)select {
    const char *sql="SELECT id,name,age FROM t_students WHERE age<20;";
    sqlite3_stmt *stmt=NULL;
    
    /*
     第一个参数为数据库的句柄，第二个参数为sql语句，第三个参数为sql的长度（如果设置为-1，则代表系统会自动计算sql语句的长度），第四个参数用来取数据，第五个参数为尾部一般用不上可直接写NULL。
     */
    //进行查询前的准备工作
    int result = sqlite3_prepare_v2(_db, sql, -1, &stmt, NULL);
    NSLog(@"result = %zd", result);
    if (result == SQLITE_OK) {//SQL语句没有问题
        NSLog(@"查询语句没有问题");
        
        //每调用一次sqlite3_step函数，stmt就会指向下一条记录
        while (sqlite3_step(stmt)==SQLITE_ROW) {//找到一条记录
            //取出数据
            //(1)取出第0列字段的值（int类型的值）
            int ID=sqlite3_column_int(stmt, 0);
            //(2)取出第1列字段的值（text类型的值）
            const unsigned char *name=sqlite3_column_text(stmt, 1);
            //(3)取出第2列字段的值（int类型的值）
            int age=sqlite3_column_int(stmt, 2);
            //            NSLog(@"%d %s %d",ID,name,age);
            printf("%d %s %d\n",ID,name,age);
        }
    }else
    {
        NSLog(@"查询语句有问题");
    }
    
}

@end
