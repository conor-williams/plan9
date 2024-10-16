
for i in $@
do
	echo "packup of $i"
#	ve=`echo $i | sed 's/tcl//'`
#	cp $i/unix/tclsh /tmp/tclsh.$ve
#	gzip /tmp/tclsh.$ve
#	cp /tmp/tclsh.$ve.gz /tmp/mnt3/kdrive/tclbins
	tar -cf $i.conor.plan9.tar $i
	gzip $i.conor.plan9.tar
	rm $i.conor.plan9.tar
	cp $i.conor.plan9.*z /tmp/mnt3/ddrive/tclbins/conor-tcl-plan9-src
	sleep 60

	#rm $i.conor.plan9.*z
done
