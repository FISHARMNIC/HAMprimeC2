forward inet_pton function<u32 a, string b, p32 c> -> u32;
forward htons     function<u16 a> -> u16;
forward socket    function<u32 a, u32 b, u32 c> -> u32;
forward signal    function<p32 a, u32 b> -> none;
forward read      function<u32 a, p32 b, u32 c> -> u32;
forward listen    function<u32 a, u32 b> -> u32;
forward __errno_location function<> -> p32;
forward perror    function<> -> none;
forward strerror  function<u32 a> -> conststr;

Sockaddr_in format
{

    /*
    https://man7.org/linux/man-pages/man3/sockaddr.3type.html
    struct sockaddr_in {
           sa_family_t     sin_family;     u32
           in_port_t       sin_port;       u16
           struct in_addr  sin_addr;       u32
    };
    */

    .sin_fam  u32;
    .sin_port u16;
    .sin_addr u32;

    .zero_a   u32;
    .zero_b   u32;

    .Sockaddr_in constructor<u16 port, u32 ia>
    {
        this.sin_fam <- 2;
        this.sin_port <- htons(port);
        this.sin_addr <- ia;

        this.zero_a <- 0;
        this.zero_b <- 0;

        print_("PORT HTONS: " + this.sin_port);
    }
}

forward bind   function<u32 a, Sockaddr_in sockptr, u32 bytes> -> u32;
forward accept function<u32 a, Sockaddr_in b, p32 c> -> u32;


http_server_create function<string ip_str, u16 port> -> u32
{
    create u32 internetAddress;
    inet_pton(2, ip_str, $(internetAddress));
    print_("IA: " + internetAddress);

    create socketInternet <- Sockaddr_in(port, internetAddress);
    create sockdes <- socket(2, 1, 0);
    if(sockdes <: 0)
    {
        print_("[ERROR] Unable to connect to socket");
        quit(0);
    }

    create bcode <- bind(sockdes, socketInternet, 16);
    print_("Bind code: " + bcode);
    if(bcode <: 0)
    {
        create errVal <- @(__errno_location());
        print_("[ERROR] Unable to bind, errno: " + errVal);
        print_("Error string: " + strerror(errVal));
        quit(0);
    }

    // signal(13, 1);
    print_("Socket " + sockdes);
    return sockdes;
}

http_server_listen function<u32 sock> -> none
{
    create fbuff <- 0;
    create Sockaddr_in csock;
    create csockdes <- 0;
    create socklen  <- 0;

    listen(sock, 100);

    create i <- 0;
    while(i >= 0)
    {
        create isConnected <- read(sock, $(fbuff), 1);
        printf("isConnected? : %i\n", isConnected); 
        if(isConnected != 0)
        {
            print_("Attempting connection: " + sock);
            csockdes <- accept(sock, csock, $(socklen));
            printf("Got %i\n", csockdes);
        }
    }
    print_("Shoudln't get here");
}


entry function<> -> u32
{
    create IP <- "192.168.5.15"; // must use ifconfig, look at eth0 inet
    create website <- http_server_create(IP, 8080);
    http_server_listen(website);
}