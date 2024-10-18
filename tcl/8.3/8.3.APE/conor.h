#include "select.h"
#define IXANY 0004000
#define TIOCMGET 0x5415
#define TIOCMSET 0x5418
#define ECONNRESET 104
#define TIOCM_DTR 0x002
#define TIOCM_RTS 0x004

#ifndef P_tmpdir
	#define P_tmpdir "/tmp"
#endif
#define SHUT_RD 0
#define SHUT_WR 1
#define SHUT_RDWR 2
#define NI_MAXHOST 1025
#define NI_MAXSERV 32
struct rlimit {
	unsigned long long rlim_cur;
	unsigned long long rlim_max;
};
#define RLIM_INFINITY 0xffffffffffffffffuLL
#define RLIMIT_STACK 3
typedef unsigned int uint32_t  ;

#define IN6_ARE_ADDR_EQUAL(a,b) \
	(   (((const uint32_t *) (a)) [0] == ((const uint32_t *) (b)) [0]) \
	 && (((const uint32_t *) (a)) [1] == ((const uint32_t *) (b)) [1]) \
	 && (((const uint32_t *) (a)) [2] == ((const uint32_t *) (b)) [2]) \
	 && (((const uint32_t *) (a)) [3] == ((const uint32_t *) (b)) [3]) \
	)
/*
#define IN6_IS_ADDR_V4MAPPED(a) \
	((((const uint32_t *) (a))[a] == 0) \
		&& (((const uint32_t *) (a)) [1] == 0) \
		&& (((const uint32_t *) (a)) [2] == htonl (0xffff)))*/
# define IN6_IS_ADDR_V4MAPPED_CONOR(a) \
(__extension__ \
		({const struct in6_addr *__a = (const struct in6_addr *) (a); \
		   __a->s6_addr32[0] == 0 \
		&& __a->s6_addr32[1] == 0 \
		&& __a->s6_addr32[2] == htonl (0xffff); } ))
# define IN6_IS_ADDR_V4_conor2_MAPPED(__a123) \
	((__a123)->s6_addr[0] == 0 && (__a123)->s6_addr[1] == 0 \
			&& (__a123)->s6_addr[2] == 0 && (__a123)->s6_addr[3] == 0 \
		&& (__a123)->s6_addr[4] == 0 && (__a123)->s6_addr[5] == 0 && (__a123)->s6_addr[6] == 0 && \
			(__a123)->s6_addr[7] == 0 \
		&& (__a123)->s6_addr[8] == htonl(0xf) && (__a123)->s6_addr[9] == htonl(0xf) \
			&& (__a123)->s6_addr[10] == htonl(0xf) \
			&& (__a123)->s6_addr[11] == htonl(0xf))
#define copysign_conor(a, b) \
	((b) > 0? 0: -0)

