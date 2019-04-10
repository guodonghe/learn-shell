## 基础: 删除仓库
### 无法从网页界面中删除仓库，因此此选项始终是禁用的。 单击它可以提供有关如何删除仓库的信息。

### 仓库只能在命令行中使用 bin/remove 删除：
     $ ./bin/remove destroy <repository>
     例如: cd  /opt/phabricator
           ./phabricator/bin/remove destroy R103
