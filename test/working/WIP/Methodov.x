Item format
{
    .name string;
    .price u32;

    .setPrice method<u32 a>
    {
        this.price <- a;
    }

    .setPrice method<f32 a>
    {
        print_("gave me a float");
    }

    .setPrice method<u32 a, u32 b>
    {
        this.price <- a + b;
    }

}

entry function<>
{
    create bob <- Item<name:"bob",price:123>;

    bob.setPrice(1);
    print_(bob.price);

    bob.setPrice(4,5);
    print_(bob.price);

    bob.setPrice(123.456);
}