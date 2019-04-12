## 判断所在分支是否是master分支
    git rev-parse --abbrev-ref HEAD
### 实例解析
    function MasterBranch {
        if ["`git rev-parse --abbrev-ref HEAD`" != "master" ]; then
            echo "You must switch to the master branch in `pwd`"
        fi
    }
    MasterBranch
### 打印日志信息  log a message
    function log {
        if [ "$1" = "-n" ];then
            shift
            echo -n "### `date '+%Y-%m-%d %H:%M:%S'` $*"
        else
            echo "##### `date '+%Y-%m-%d %H:%M:%S'` $*"
        fi
     }