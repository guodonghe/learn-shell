## 判断所在分支是否是master分支
    git rev-parse --abbrev-ref HEAD
### 实例解析
    function MasterBranch {
        if ["`git rev-parse --abbrev-ref HEAD`" != "master" ]; then
            echo "You must switch to the master branch in `pwd`"
        fi
    }
    MasterBranch