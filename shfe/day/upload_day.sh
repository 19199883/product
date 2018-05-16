#!/bin/bash
DAY_NIGHT=day

function encrypt_so
{
	for cur_so in `ls  ../lib/bare/`
	do
		echo "process ${cur_so}"
	  tar -C ../lib/bare -cvzf ../lib/packaged/${cur_so} ${cur_so}
	done

}

function upload_so
{
	scp -P 44163 ../lib/packaged/* u910019@101.231.3.117:/home/u910019/trade/day109/x-shfe/
	scp -P 44163 ../lib/packaged/* u910019@101.231.3.117:/home/u910019/trade/day63/x-shfe/
	scp -P 44163 ../lib/packaged/* u910019@101.231.3.117:/home/u910019/trade/day056/x-shfe/
	scp -P 44163 ../lib/packaged/* u910019@101.231.3.117:/home/u910019/trade/day19/x-shfe/
}

###################
# enter working directory
###########################
function  enter_wd
{
	 this_dir=`pwd`
	 dirname $0|grep "^/" >/dev/null
	 if [ $? -eq 0 ];then
			 this_dir=`dirname $0`
	 else
			 dirname $0|grep "^\." >/dev/null
			 retval=$?
			 if [ $retval -eq 0 ];then
					 this_dir=`dirname $0|sed "s#^.#$this_dir#"`
			 else
					 this_dir=`dirname $0|sed "s#^#$this_dir/#"`
			 fi
	 fi

	cd $this_dir
}

enter_wd
encrypt_so
upload_so
