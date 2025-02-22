entry function<>
{
    create jon <- "jon";
    /* @(jon) <- 'b';  */
    @(jon, 4) <- 'b'; // change it to this, since + 4 will do string addition
    print_(jon);

}