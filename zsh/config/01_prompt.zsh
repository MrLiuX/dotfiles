# # 在每次命令执行前重新生成提示符
# function _dynamic_prompt() {
#     # 获取当前用户名、主机名（短格式）和路径（最后三层，含 ~ 缩写）
#     local user="${USER}"
#     local host="${HOST:-$(hostname -s)}"
#     local path_str="$(print -P '%3~')"          # 展开后的路径文本

#     # 左侧显示的原始字符串（不含颜色代码）
#     local left_raw="${user}@${host}:${path_str}"
#     local left_len=${#left_raw}

#     # 当前终端宽度，默认 80
#     local cols="${COLUMNS:-80}"
#     local fill_len=$(( cols - left_len ))
#     (( fill_len < 0 )) && fill_len=0

#     # 生成横线填充（可替换为其他字符，如 '─'）
#     local filler=''
#     if (( fill_len > 0 )); then
#         filler="$(printf '%*s' "${fill_len}" '' | tr ' ' '-')"
#     fi

#     # 设置 PS1（第一行 + 第二行）
#     # 颜色：用户名@主机名 为蓝色，路径为绿色，横线无颜色
#     PROMPT="%F{blue}%n@%m%f:%F{green}%3~%f${filler}"$'\n'"%F{white}> %f"
# }

# # 挂载到 precmd 钩子，每次命令前都会重新计算提示符
# autoload -Uz add-zsh-hook
# add-zsh-hook precmd _dynamic_prompt

# # 每次显示提示符前动态生成
# function _dynamic_prompt() {
#     # 用户名、主机名（短格式）、路径（最后三层）
#     local user="${USER}"
#     local host="${HOST:-$(hostname -s)}"
#     local path_str="$(print -P '%3~')"   # 已展开，无转义序列

#     # 左侧纯文本内容（无颜色）
#     local left_raw="${user}@${host}:${path_str}"
#     local left_len=${#left_raw}

#     # 使用 tput 获取终端列数（如果失败回退 80）
#     local cols
#     if command -v tput >/dev/null; then
#         cols=$(tput cols 2>/dev/null)
#     fi
#     [[ -z "$cols" ]] && cols=80

#     local fill_len=$(( cols - left_len ))
#     (( fill_len < 0 )) && fill_len=0

#     # 生成横线
#     local filler=''
#     if (( fill_len > 0 )); then
#         filler="$(printf '%*s' "${fill_len}" '' | tr ' ' '-')"
#     fi

#     # 设置提示符：第一行（蓝绿配色 + 横线填充），第二行（白色 >）
#     PROMPT="%F{blue}%n@%m%f:%F{green}%3~%f${filler}"$'\n'"%F{white}> %f"
# }

# # 挂载 precmd 钩子
# autoload -Uz add-zsh-hook
# add-zsh-hook precmd _dynamic_prompt

# --- 动态提示符（调试版，确认问题后可去掉 print 那行）---
# function _dynamic_prompt() {
#     # 获取基本信息
#     local user="${USER}"
#     local host="${HOST:-$(hostname -s)}"
#     local path_str="$(print -P '%3~')"

#     # 左侧纯文本（无颜色）
#     local left_raw="${user}@${host}:${path_str}"
#     local left_len=${#left_raw}

#     # 强制从 tput 获取终端宽度（比 $COLUMNS 更可靠）
#     local cols
#     if command -v tput >/dev/null 2>&1; then
#         cols=$(tput cols)
#     fi
#     [[ -z "$cols" || "$cols" -eq 0 ]] && cols=${COLUMNS:-80}

#     local fill_len=$(( cols - left_len ))
#     (( fill_len < 0 )) && fill_len=0

#     # 横线填充（Zsh 原生填充，无需 printf+tr）
#     local filler="${(l:fill_len::-:)}"

#     # 调试输出（每次 precmd 触发时会打印到终端）
#     print -u2 "DEBUG prompt> cols=$cols left_len=$left_len fill_len=$fill_len"

#     # 设置提示符
#     PROMPT="%F{blue}%n@%m%f:%F{green}%3~%f${filler}"$'\n'"%F{white}> %f"
# }

# # 挂载 precmd 钩子
# autoload -Uz add-zsh-hook
# add-zsh-hook precmd _dynamic_prompt

# 动态提示符：第一行左右填满横线，第二行只显示 >
# function _dynamic_prompt() {
#     # 用户、主机、路径（最后三层）
#     local user="${USER}"
#     local host="${HOST:-$(hostname -s)}"
#     local path_str="$(print -P '%3~')"

#     # 左侧纯文本（无颜色）
#     local left_raw="${user}@${host}:${path_str}"
#     local left_len=${#left_raw}

#     # 获取终端宽度（tput 优先，避免 COLUMNS 被固定值污染）
#     local cols
#     if command -v tput >/dev/null 2>&1; then
#         cols=$(tput cols)
#     fi
#     [[ -z "$cols" || "$cols" -eq 0 ]] && cols=${COLUMNS:-80}

#     local fill_len=$(( cols - left_len ))
#     (( fill_len < 0 )) && fill_len=0

#     # 生成横线（Zsh 原生左填充，比 printf+tr 更简洁）
#     local filler="${(l:fill_len::-:)}"

#     # 设置提示符：第一行 蓝@主机:绿路径 横线，第二行白色 >
#     PROMPT="%F{blue}%n@%m%f:%F{green}%3~%f${filler}"$'\n'"%F{white}> %f"
# }

# autoload -Uz add-zsh-hook
# add-zsh-hook precmd _dynamic_prompt

# # 窗口大小改变时立即重绘提示符（不等待下次命令）
# TRAPWINCH() {
#     zle && zle reset-prompt
# }

# 动态提示符：第一行左右填满横线，第二行只显示 >
function _dynamic_prompt() {
    # 用户、路径（最后三层）
    local user="${USER}"

    # 真实短主机名
    if command -v scutil >/dev/null 2>&1; then
        # 直接读取系统设置中的 ComputerName（可包含空格和撇号）
        real_host=$(scutil --get ComputerName 2>/dev/null)
    fi

    # 如果获取失败（比如在非macOS系统上），则退回到传统的 hostname
    if [[ -z "$real_host" ]]; then
        if command -v hostname >/dev/null 2>&1; then
            real_host=$(hostname -s)
        else
            real_host="${HOST:-unknown}"
        fi
    fi

    # 如果真实主机名等于特定值，显示为 MacOS，否则使用 HOST 变量或真实主机名
    local host
    if [[ "$real_host" == "Asher'sMAC" ]]; then
        host="MacOS"
    else
        host="${HOST:-$real_host}"
    fi

    local path_str="$(print -P '%3~')"

    # 左侧纯文本（无颜色）
    local left_raw="${user}@${host}:${path_str}"
    local left_len=${#left_raw}

    # 获取终端宽度（tput 优先，避免 COLUMNS 被固定值污染）
    local cols
    if command -v tput >/dev/null 2>&1; then
        cols=$(tput cols)
    fi
    [[ -z "$cols" || "$cols" -eq 0 ]] && cols=${COLUMNS:-80}

    local fill_len=$(( cols - left_len ))
    (( fill_len < 0 )) && fill_len=0

    # 生成横线（Zsh 原生左填充）
    local filler="${(l:fill_len::-:)}"

    # 设置提示符：第一行 蓝@主机:绿路径 横线，第二行白色 >
    PROMPT="%F{blue}${user}@${host}%f:%F{green}%3~%f${filler}"$'\n'"%F{white}> %f"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _dynamic_prompt

# 窗口大小改变时立即重绘提示符
TRAPWINCH() {
    zle && zle reset-prompt
}
