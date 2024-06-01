Person format {    
    age <- u8;
    name <- p8;
}

entry function<p8 args, u32 argv> -> u32
{
create bob <- Person<age:(5+10),name:"bob">;
create jon <- u8 (12 + 34);
create dad <- (jon + 4);
printf("%i",dad)
}