cd /tmp
for i in $@
do
	echo $i
	cd /tmp/$i/unix
	sh /tmp/APE/*Run.sh $i > /dev/null 2>&1
	ls -l /tmp/$i/unix/tclsh
	cd /tmp
done