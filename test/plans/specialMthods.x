Person format
{
    .p8 name;
    .u32 age;

    .method __add(u32 next) -> u32
    {
        this.age <- this.age + next;
    }   
}

Vector format
{
    .f32 x;
    .f32 y;
    .f32 z;

    .method __add(u32 next) -> u32
    {
        # note, add variable re-typing
        next <- Vector:(next);
        this.x <- this.x + next.x;
        this.y <- this.y + next.y;
        this.z <- this.z + next.z;
    }   
}


entry function<> -> u32
{
    create nico <- Person<name:"Nico",age:17>;
    nico + 5;
    create right <- Vector<x:1.0,y:0.0,z:0.0>;
    create up    <- Vector<x:0.0,y:1.0,z:0.0>;
    space + up;
}