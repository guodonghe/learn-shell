#使用时间字段比较大小来确定删除范围
# 语法：DELETE FROM 表名 WHERE 时间字段>=开始时间 AND 时间字段<=结束时间
DELETE from zwjc.system_log WHERE LOG_DATE >= '2017-08-25 12:32:04' AND LOG_DATE <= '2018-03-06 00:00:00';
