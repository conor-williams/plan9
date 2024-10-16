#ape/psh
#./configure
addconorh () {
	tmpfile=${1}.tmp
	orgfile=$1
	if [ -f $tmpfile ]; then 
		return 0
	fi	
	echo "#include <conor.h>" > $tmpfile
	cat $orgfile >> $tmpfile
	cp $tmpfile $orgfile
}

#cp /tmp/APE/* .
#mkdir sys
#cp /tmp/APE/* sys
#cp configure configure.tmp
#sed 's/printf "%s\\n"/print /g' configure.tmp > configure.tmp2
#sed 's/printf %s\\n/print /g' configure.tmp2 > configure.tmp
#sed 's/printf %s/print /g' configure.tmp > configure.tmp2
#sed 's/^.*no acceptable egrep.*$/ac_cv_path_EGREP_TRADITIONAL="grep -e"/' configure.tmp2 > configure.tmp
#sed 's/ls -di/ls -d/g' configure.tmp > configure.tmp2
#cp configure.tmp2 configure

cp Makefile Makefile.tmp
sed 's/-DHAVE_STRUCT_DIRENT64=1//' Makefile.tmp > Makefile.tmp2
sed 's/-DHAVE_STRUCT_STAT64=1//' Makefile.tmp2 > Makefile.tmp
sed 's/-DNEED_FAKE_RFC2553=1//' Makefile.tmp > Makefile.tmp2
sed 's/-DHAVE_LOCALTIME_R=1//' Makefile.tmp2 > Makefile.tmp


cp Makefile.tmp Makefile

echo "ready... to run make"
#echo "#include <conor.h>" >> tclUnixChan.c.tmp
#cat tclUnixChan.c >> tclUnixChan.c.tmp
#cp tclUnixChan.c.tmp tclUnixChan.c
addconorh tclUnixChan.c
addconorh tclUnixSock.c
addconorh tclUnixNotfy.c
addconorh ../generic/tclStrToD.c

sed 's/IN6_IS_ADDR_V4MAPPED/IN6_IS_ADDR_V4_conor2_MAPPED/' tclUnixSock.c > tclUnixSock.c.tmp
cp tclUnixSock.c.tmp tclUnixSock.c
sed 's/copysign(/copysign_conor(/' ../generic/tclStrToD.c > ../generic/tclStrToD.c.tmp
cp ../generic/tclStrToD.c.tmp ../generic/tclStrToD.c


#mknod comment out + remove comment tclUnixFCmd.c
if [ ! -f f1 ]; then
echo " struct in6_addr *__a123 = (struct in6_addr *) (&addr); " >> f1
echo "	int val123 = 	__a123->s6_addr[0] == 0 && __a123->s6_addr[1] == 0 " >> f1
echo "			&& __a123->s6_addr[2] == 0 && __a123->s6_addr[3] == 0" >> f1
echo "		&& __a123->s6_addr[4] == 0 && __a123->s6_addr[5] == 0 && __a123->s6_addr[6] == 0 && " >> f1
echo "			__a123->s6_addr[7] == 0 " >> f1
echo "		&& __a123->s6_addr[8] == htonl(0xf) && __a123->s6_addr[9] == htonl(0xf) " >> f1
echo "			&& __a123->s6_addr[10] == htonl(0xf)" >> f1
echo "			&& __a123->s6_addr[11] == htonl(0xf); " >> f1
echo " if (!val123) {return 0;} " >> f1

fi

if [ ! -f f2 ] ; then
	echo "	if (-signum > 0) {return +0;} else {return -0;}" >> f2
fi
