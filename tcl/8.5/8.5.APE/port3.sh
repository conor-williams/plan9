if [ ! `grep IsSpacProc ../generic/tclParse.c` ] ; then
	cat /tmp/APE/isSpaceProc >> ../generic/tclParse.c
fi
