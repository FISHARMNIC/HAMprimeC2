Vector format
{
    .x f32;
    .y f32;
    .z f32;

    .Vector constructor<f32 x, f32 y, f32 z>
    {
        this.x <- x;
        this.y <- y;
        this.z <- z;
    }

    .add method<Vector vec> -> u32
    {
        this.x <- this.x + vec.x;
        this.y <- this.y + vec.y;
        this.z <- this.z + vec.z;
        return this;
    }

    .scale method<Vector vec> -> u32
    {
        this.x <- this.x * vec.x;
        this.y <- this.y * vec.y;
        this.z <- this.z * vec.z;
        return this;
    }


    .print method<> -> u32
    {
        printf("(%f, %f, %f)\n", this.x, this.y, this.z);
    }
}

entry function<> -> u32
{
    create position <- Vector(0.0,1.0,0.0);
    create velocity <- Vector(1.0,0.0,0.0);
    position.add(velocity);

    position.print();
}