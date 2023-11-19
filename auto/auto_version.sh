###
 # @Author: jiafeng jiafeng@apple.com
 # @Date: 2022-06-30 21:56:05
 # @LastEditors: Jia Feng
 # @LastEditTime: 2022-08-04 20:04:38
 # @FilePath: /pthread_t/auto_version.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 
function echo_hellp() {
    cat << END

    Alpha -- 内部测试版　Beta -- 公开测试版  Release -- 发行版
    主版本号 . 子版本号 [. 修正版本号[ build- 编译版本号 ]]
    -V 增加版本号 
    -D 增加版本描述
    q  退出
END
}

#function get_version() {   
#}


function addition_version() {
    while :
    do
        echo_hellp
        read -e input
        if [[ ${input} == '-V' ]] || [[ ${input} == '-v' ]]; then
            echo "添加版本号,按下回车保存"
            read -e input
            cat << EOF >> ../version
    Version: ${input}

    Data: `date`
EOF
        fi
        if [[ ${input} == '-D' ]] || [[ ${input} == '-d' ]]; then
            echo "添加描述,按下回车保存"
            read -e input
            cat << EOF >> ../version

    Describe: ${input}

/*************************************************************************************/
EOF
        fi
        if [[ ${input} == 'q' ]] || [[ ${input} == 'Q' ]]; then
            echo "exit"
            break
        fi

    done
}

addition_version