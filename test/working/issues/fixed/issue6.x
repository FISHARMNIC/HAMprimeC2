/* FIXED */

Thing format
{
    .a

    .Thing constructor<Thing:borrowed q>
    {
        this.a <- q;
    }

}

entry function<>
{
    create jon <- Thing(Thing:borrowed:(0));

    JS_EVAL "throwE(userFormats.Thing.properties)";
}