#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <string.h>

int die(char*);

int main(int argc, char **argv) {
        if (argc < 2) return -1;
        char *ip = argv[1];
        int sock;
        struct sockaddr_in target;
        char *msg = "GET / HTTP/1.1\r\n\r\n";
        char target_recv[2048];

        // IP, TWO-WAY, TCP
        sock = socket(AF_INET, SOCK_STREAM, 0);

        if (sock == -1)
                return die("sock err");

        target.sin_family = AF_INET;
        target.sin_port = htons(80);
        target.sin_addr.s_addr = inet_addr(ip);

        if (connect(sock, (struct sockaddr *) &target, sizeof(target)) < 0)
                return die("connect err");

        if (send(sock, msg, strlen(msg), 0) < 0)
                return die("send failed");


        if (recv(sock, target_recv, sizeof(target_recv), 0) < 0)
                return die("recv err");

        printf(target_recv + '\n');

        return 0;
}

int die(char *msg) {
        puts(msg);
        return -1;
}
