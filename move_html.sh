#!/usr/bin/env bash

i=0
argv=0
for one in $*
do
    argv[i]=${one}
    i=`expr $i + 1`
done

length=`expr $i - 1`
i=0
main_dir=${argv[${length}]}

if [ -d ${main_dir} ]
then
    while [ $i -lt ${length} ]
    do
        if [ -e ${argv[i]} ]
        then
            cp -Ruv ${argv[$i]} ${main_dir}
        else
            echo "${argv[$i]} 不存在, 忽略"
        fi
        i=`expr $i + 1`
    done
    echo "迁移成功"
else
    echo "迁移目的地目录 ${main_dir} 不存在"
    echo "迁移失败"
    exit 1
fi


