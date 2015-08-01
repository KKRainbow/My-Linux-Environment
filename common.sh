#!/usr/bin/env zsh

function join_str
{
	local dst
	local arr
	if [ $# -eq 2 ];then
		dst=$2
	else
		arr=(${*[@]:2:$#})
		dst=$arr[1]
		for i in $arr
		do
			if [ $i -gt 1 ];then
				dst=${dst}$1$arr[$i]
			fi
		done
	fi
	echo $dst
}

