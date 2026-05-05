-- 基础设置#vim.opt 
-------------------------------------------------
vim.opt.shortmess:append("I")
vim.g.loaded_startup = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- 高亮当前行，可选值：也可设为 'number' 只高亮行号列，'screenline' 仅屏幕行
vim.opt.signcolumn = 'auto'
-- 标记列（gutter）策略：'yes' 始终显示，'no' 隐藏，'auto' 按需，'number'与行号合并
vim.opt.wrap = true
-- 是否自动折行
vim.opt.linebreak = true
-- wrap 启用时，是否在单词边界处折行（更自然）
vim.opt.breakindent = true
-- 折行后保持缩进视觉对齐
vim.opt.showbreak = '↪ '
-- 折行前缀字符（仅显示用），可设为任意字符串
vim.opt.list = true
-- 是否显示不可见字符（制表符、行尾空格等）
vim.opt.listchars = 'tab:»·,trail:·,extends:>,precedes:<,nbsp:␣'
-- list 启用时，不可见字符的显示样式
vim.opt.fillchars = { eob = ' ' }
-- 各区域的填充字符，如 eob（行尾之后）设为空格可隐藏波浪线
vim.opt.cmdheight = 0
-- 命令行高度，设为 0 可完全隐去（需 nvim >= 0.9），但常用 1~2
vim.opt.laststatus = 0
-- 状态栏何时显示：0 永不，1 仅多窗口，2 始终，3 全局状态栏
vim.opt.showmode = false
-- 是否在命令行显示当前模式（一般状态栏会取代它）
vim.opt.showcmd = true
-- 是否在命令行显示未完成的命令按键
vim.opt.ruler = true
-- 右下角显示光标位置
vim.opt.shortmess:append 'atc'
-- 缩短提示信息，附加选项：c 不显示 ins-completion-menu 消息
vim.opt.termguicolors = true
-- 启用真彩色（24-bit），需要终端支持
vim.opt.background = 'dark'
-- 背景色风格，可选 'dark' 或 'light'（影响默认颜色方案）

-- 2. 搜索
vim.opt.hlsearch = false
-- 搜索后是否保持高亮
vim.opt.incsearch = true
-- 输入搜索字符时实时预览匹配
vim.opt.ignorecase = true
-- 默认忽略大小写
vim.opt.smartcase = true
-- 若搜索词包含大写，则自动区分大小写（需 ignorecase 开启）
vim.opt.wrapscan = true
-- 搜索到文件末尾后是否回绕到开头

-- 3. 缩进与制表符
vim.opt.expandtab = true
-- 将 <Tab> 转换为空格
vim.opt.tabstop = 4
-- 文件中一个 <Tab> 显示为几个空格的宽度
vim.opt.softtabstop = 4
-- 编辑时每次按 Tab 或 Backspace 的空格数，-1 则使用 shiftwidth 的值
vim.opt.shiftwidth = 4
-- 自动缩进时每级的空格数，0 时使用 tabstop 的值
vim.opt.shiftround = true
-- 将缩进对齐到 shiftwidth 的整数倍
vim.opt.smartindent = true
-- 根据前一行语法自动缩进（较老的方案）
vim.opt.autoindent = true
-- 保持前一行缩进
vim.opt.copyindent = true
-- 复制结构时保留原有缩进
vim.opt.preserveindent = true
-- 尽可能保留原有缩进结构，不自动调整

-- 4. 备份、撤销与交换文件
vim.opt.swapfile = true
-- 是否创建交换文件（.swp）
vim.opt.backup = false
-- 编辑文件前是否创建备份
vim.opt.writebackup = true
-- 覆盖文件前创建临时备份，成功则删除；若 backup 关闭，该选项无效
vim.opt.undofile = true
-- 启用持久撤销，可跨会话撤销修改
vim.opt.undodir = vim.fn.stdpath 'config' .. '/undo'
-- 撤销文件存储目录，设为绝对路径
vim.opt.undolevels = 1000
-- 最大撤销次数
vim.opt.undoreload = 10000
-- 缓冲区最大行数，超过此值撤销文件不会被完全加载
vim.opt.backupdir = vim.fn.stdpath 'state' .. '/backup//'
-- 备份文件目录，末尾 // 表示使用完整路径防止同名冲突
vim.opt.directory = vim.fn.stdpath 'state' .. '/swap//'
-- 交换文件目录

-- 5. 文件编码与格式
vim.opt.encoding = 'utf-8'
-- Vim 内部使用的字符编码
vim.opt.fileencoding = 'utf-8'
-- 缓冲区写入文件时使用的编码
vim.opt.fileencodings = 'ucs-bom,utf-8,gbk,latin1'
-- 打开文件时依次尝试的编码列表
vim.opt.fileformat = 'unix'
-- 换行符格式：'unix'（LF），'dos'（CRLF），'mac'（CR）
vim.opt.fileformats = 'unix,dos,mac'
-- 读取文件时自动识别的换行符顺序
vim.opt.bomb = false
-- 是否在文件头写入 BOM（字节顺序标记）

-- 6. 拼写检查
vim.opt.spell = false
-- 是否启用拼写检查
vim.opt.spelllang = 'en_us'
-- 拼写检查语言，逗号分隔，如 'en_us,de_de'
vim.opt.spellsuggest = 'best,10'
-- 拼写建议排序方式：'best' 最佳匹配，'fast' 快速列表，数字为最多显示数量

-- 7. 补全与通配符
vim.opt.completeopt = 'menu,menuone,noselect'
-- 补全菜单行为：menu 显示菜单，menuone 即使一项也显示，noselect 不自动选择
vim.opt.pumheight = 10
-- 补全菜单最大条目数
vim.opt.pumblend = 10
-- 补全菜单伪透明混合度（0 不透明，100 完全透明）
vim.opt.wildmenu = true
-- 命令行补全时显示增强菜单
vim.opt.wildmode = 'longest:full,full'
-- 命令行补全模式：首次补全最长公共前缀后开启 wildmenu
vim.opt.wildignore = '*.o,*.obj,*.pyc,*.class,*.swp,*.bak,*.DS_Store'
-- 文件/目录补全时忽略的模式，逗号分隔
vim.opt.path:append '**'
-- 查找文件的路径（如 `gf` / `:find`），添加 ** 表示递归搜索
vim.opt.suffixesadd = '.lua,.vim'
-- 使用 `gf` 打开光标下文件名时，自动添加的后缀顺序

-- 8. 性能与体验
vim.opt.lazyredraw = false
-- 是否不重绘未执行的宏或脚本中间状态（加快执行），但可能遮挡界面
vim.opt.ttimeout = true
-- 是否启用键码超时（映射中的多字节键码）
vim.opt.ttimeoutlen = 50
-- 键码超时毫秒数，影响按键响应速度
vim.opt.timeoutlen = 300
-- 映射键序列等待超时毫秒数
vim.opt.updatetime = 200
-- 触发 CursorHold 事件的空闲毫秒数，调小可使插件更灵敏
vim.opt.redrawtime = 1500
-- 显示模式重绘时间限制（毫秒），超过该时间则不重绘复杂语法
vim.opt.scrolloff = 8
-- 光标上下保留的最小行数，避免光标贴近屏幕边缘
vim.opt.sidescrolloff = 8
-- 水平方向上光标两侧保留的最小列数
vim.opt.sidescroll = 1
-- 水平滚动时的列数步长，0 时让光标居中
vim.opt.display = 'lastline'
-- 显示策略：'lastline' 尽可能显示最后一行，而不是 @@ 标记
vim.opt.conceallevel = 0
-- 隐藏文本的级别：0 不隐藏，1 常规隐藏，2 隐藏并替换为一个字符，3 完全隐藏
vim.opt.concealcursor = 'nvic'
-- 在哪些模式下光标所在行取消隐藏：n 普通，v 可视，i 插入，c 命令
vim.opt.jumpoptions = 'stack'
-- 跳转列表行为：'stack' 推荐，保持标签、跳转、更改列表的一致栈行为
vim.opt.virtualedit = 'block'
-- 在哪些模式下允许光标停留在无文本处：'' 不允许，'all' 所有模式，'block'块选择
vim.opt.inccommand = 'split'
-- 替换时实时预览：'nosplit' 单行预览，'split' 分屏预览，'' 关闭
vim.opt.formatoptions = 'jcroqlnt'
-- 控制自动格式化行为，常用：j 去除注释引导，c 自动注释续行，r自动插入注释引导，o 新行自动注释，q 允许手动格式化，l 长行不断开，n识别编号列表，t 自动折行

-- 9. 窗口与分屏
vim.opt.splitbelow = true
-- 水平分屏时新窗口放在下方
vim.opt.splitright = true
-- 垂直分屏时新窗口放在右侧
vim.opt.splitkeep = 'cursor'
-- 分屏时保持的视觉位置：'cursor' 基于光标，'screen' 基于屏显顶部，'topline'基于顶行
vim.opt.equalalways = true
-- 窗口大小变化后是否自动使所有窗口等宽/等高
vim.opt.eadirection = 'both'
-- = 命令的调整方向：'both' 双向，'hor' 水平，'ver' 垂直
vim.opt.winwidth = 1
-- 窗口最小宽度
vim.opt.winminwidth = 1
-- 窗口最小可用宽度（防止被压缩到 0）
vim.opt.winheight = 1
-- 窗口最小高度
vim.opt.winminheight = 1
-- 窗口最小可用高度

-- 10. 命令行与历史
vim.opt.history = 1000
-- 命令历史记录数量上限
vim.opt.shada = "!,'100,<50,s10,h"
-- ShaDa（共享数据）文件选项，对应原 viminfo：! 保存全局变量，'100 保存 100条文件标记，<50 保存寄存器行数限制，s10 寄存器大小限制（KB），h 高亮时不禁用
vim.opt.more = true
-- 满屏时暂停输出（需要按 Enter 继续），通常被 UI 替代

-- 11. 杂项
vim.opt.backspace = 'indent,eol,start'
-- 允许退格删除的内容：indent 缩进，eol 行尾换行符，start 插入开始位置之前
vim.opt.whichwrap = 'b,s,h,l,<,>,[,],~'
-- 允许左右移动按键跨行的情形：b 退格，s 空格，h l 左右移动，< > 缩进，[ ]段落跳转，~ 改变大小写
vim.opt.iskeyword = '@,48-57,_,192-255'
-- 构成“单词”的字符，@ 表示字母，48-57 数字，_ 下划线，192-255 高 ASCII 字母
vim.opt.virtualedit = 'block'
-- （已设过）允许光标在无文本区域移动的模式
vim.opt.modeline = true
-- 是否允许文件内的模式行（modeline）设置
vim.opt.modelines = 5
-- 检查模式行的行数范围
vim.opt.secure = true
-- 防止 modeline 中的不安全命令
vim.opt.exrc = false
-- 是否允许在当前目录自动执行 .nvim.lua 或 .exrc 文件
vim.opt.shell = vim.fn.executable 'zsh' == 1 and '/bin/zsh' or '/bin/bash'
-- 内部使用的 shell 路径
vim.opt.shellcmdflag = '-c'
-- 传递给 shell 的命令执行标志
vim.opt.shellquote = ''
-- 在 shell 命令中包含特殊字符时的引号字符
vim.opt.shellxquote = ''
-- 外部命令引号风格

