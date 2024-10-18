
#ape/psh
set -xv
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
addconor2h () {
	tmpfile=${1}.tmp
	orgfile=$1
	if [ -f $tmpfile ]; then 
		return 0
	fi	
	echo "#include <conor2.h>" > $tmpfile
	cat $orgfile >> $tmpfile
	cp $tmpfile $orgfile
}

cp Makefile Makefile.tmp
sed 's/-DHAVE_STRUCT_DIRENT64=1//' Makefile.tmp > Makefile.tmp2
sed 's/-DHAVE_STRUCT_STAT64=1//' Makefile.tmp2 > Makefile.tmp
sed 's/-DNEED_FAKE_RFC2553=1//' Makefile.tmp > Makefile.tmp2
sed 's/-DHAVE_LOCALTIME_R=1//' Makefile.tmp2 > Makefile.tmp
sed 's/-DHAVE_SIGNED_CHAR=1/-DHAVE_SIGNED_CHAR -DTCL_NO_STACK_CHECK=1 /' Makefile.tmp > Makefile.tmp2
sed 's/-DTCL_NO_STACK_CHECK=1/-DTCL_NO_STACK_CHECK=1 -DNO_GETTOD=1/' Makefile.tmp2 > Makefile.tmp

cp Makefile.tmp Makefile

echo "ready... to run make"
#echo "#include <conor.h>" >> tclUnixChan.c.tmp
#cat tclUnixChan.c >> tclUnixChan.c.tmp
#cp tclUnixChan.c.tmp tclUnixChan.c
addconor2h tclUnixChan.c
addconorh tclUnixSock.c
addconor2h tclUnixNotfy.c
addconorh ../generic/tclStrToD.c
addconorh tclUnixPipe.c
addconorh ../generic/tclStrToD.c
addconorh tclUnixInit.c
if [ ! `grep IsSpaceProc ../generic/tclParse.c` ] ; then
	cat /tmp/APE/isSpaceProc >> ../generic/tclParse.c
fi
sed 's/u_int/unsigned int/' tclUnixFCmd.c > tclUnixFCmd.c.tmp
cp tclUnixFCmd.c.tmp tclUnixFCmd.c

sed 's/IN6_IS_ADDR_V4MAPPED/IN6_IS_ADDR_V4_conor2_MAPPED/' tclUnixSock.c > tclUnixSock.c.tmp
cp tclUnixSock.c.tmp tclUnixSock.c
sed 's/copysign(/copysign_conor(/' ../generic/tclStrToD.c > ../generic/tclStrToD.c.tmp
cp ../generic/tclStrToD.c.tmp ../generic/tclStrToD.c
sed 's/struct timezone tz;/\/*struct timezone conor tz;*\//' tclUnixTime.c > tclUnixTime.c.tmp
cp tclUnixTime.c.tmp tclUnixTime.c
sed 's/gettimeofday(&tv, &tz);/gettimeofday(\&tv, NULL);/' tclUnixTime.c > tclUnixTime.c.tmp
cp tclUnixTime.c.tmp tclUnixTime.c
sed 's/strcasecmp/TclUtfCasecmp/' ../generic/tclCmdIL.c > ../generic/tclCmdIL.c.tmp
cp ../generic/tclCmdIL.c.tmp ../generic/tclCmdIL.c
sed 's/strcasecmp/TclUtfCasecmp/' ../generic/tclCmdMZ.c > ../generic/tclCmdMZ.c.tmp
cp ../generic/tclCmdMZ.c.tmp ../generic/tclCmdMZ.c
if [ ! -f ../generic/tclInt.h.tmp ]; then
	echo "int TclUtfCasecmp(const char *cs, const char *ct);" >> ../generic/tclInt.h.tmp
	cat ../generic/tclInt.h.tmp >> ../generic/tclInt.h
	#cp /tmp/APE/tclUtf.c ../generic/
fi

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

mkdir net
cp /tmp/APE/errno.h net
touch sys/modem.h
