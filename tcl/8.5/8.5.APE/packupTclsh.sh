for i in $@
do
	ve=`echo $i | sed 's/tcl//'`
	echo "packing up tclsh $ve"
	cp $i/unix/tclsh /tmp/tclsh.$ve
	gzip /tmp/tclsh.$ve
	cp /tmp/tclsh.$ve.gz /tmp/mnt1/ddrive/tclbins
	sleep 20
	rm /tmp/tclsh.$ve
	rm /tmp/tclsh.$ve.gz
#	tar -cf $i.conor.plan9.tar $i
#	gzip $i.conor.plan9.tar
#	rm $i.conor.plan9.tar
#	cp $i.conor.plan9.*z /tmp/mnt1/kdrive/tclbins/conor-tcl-plan9-src
done
