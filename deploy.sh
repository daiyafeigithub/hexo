#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
hexo cl

# 进入生成的文件夹
hexo g

hexo d

curl --location --request POST --X POST 'https://cn-n1-console-api.leancloud.cn/1.1/engine/groups/web/production/version?gitTag=master&token=Fu0NLSaciBgBWDzhh0ek6nPOVkQdMHZGIqbhB9hyzERatmZrSB799NEFUHQck1vD'