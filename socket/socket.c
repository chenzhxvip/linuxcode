/*声明*/

int utils_make_socket_nonblocking(int fd);








/*实现*/
int utils_make_socket_nonblocking(int fd)
{
#ifdef WIN32
	{
		u_long nonblocking = 1;
		if (ioctlsocket(fd, FIONBIO, &nonblocking) == SOCKET_ERROR) {
			event_sock_warn(fd, "fcntl(%d, F_GETFL)", (int)fd);
			return -1;
		}
	}
#else
	{
		int flags;
		if ((flags = fcntl(fd, F_GETFL, NULL)) < 0) {
			return -1;
		}
		if (fcntl(fd, F_SETFL, flags | O_NONBLOCK) == -1) {
			return -1;
		}
	}
#endif
	return 0;
}
