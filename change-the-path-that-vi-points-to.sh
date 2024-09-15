# 使用echo命令打印出使用which vi命令的结果
echo "默认vim编辑器的路径为：$(which vi)"

# 使用echo命令打印出使用which vim命令的结果
echo "新vim编辑器的路径为：$(which vim)"

# 将vi命令指向新的Vim所在的文件路径
# 首先，我们需要知道新的vim的路径
# 会遇到输入root密码的情况
new_vim_path=$(which vim)
if [ -n "$new_vim_path" ]; then
    # 创建vi的符号链接指向新的vim路径
    sudo rm /usr/bin/vi
    sudo ln -s $new_vim_path /usr/bin/vi
    echo "vi命令已指向新的Vim路径：$new_vim_path"
else
    echo "未能找到新的Vim路径"
fi
