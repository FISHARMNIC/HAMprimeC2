/* FIXED TO NOW SHOW ERROR MESSAGE */

AAA format
{
    .AAA constructor<>
    {
    }
}

BBB format
{
    .prop AAA:borrowed;

    .BBB constructor<>
    {
    }
}

entry function<>
{
    create jon <- BBB();

    jon.prop <- AAA(); // shouldnt take ownership
}