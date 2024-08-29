// assemble with assemble_math.sh or add flag -lm

forward sqrtf function<f32 val> -> f32;

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

    .add method<Vector vec> -> Vector
    {
        this.x <- this.x + vec.x;
        this.y <- this.y + vec.y;
        this.z <- this.z + vec.z;
        return this;
    }

    .mul method<f32 scale> -> Vector
    {
        this.x <- this.x * scale;
        this.y <- this.y * scale;
        this.z <- this.z * scale;
        return this;
    }

    .div method<f32 scale> -> Vector
    {
        this.x <- this.x / scale;
        this.y <- this.y / scale;
        this.z <- this.z / scale;
        return this;
    }

    .magnitude method<> -> f32
    {
        return(sqrtf((this.x * this.x) + (this.y * this.y) + (this.z * this.z)));
    }

    .normalize method<Vector vec> -> Vector
    {
        create m <- this.magnitude();
        if(m == 0)
        {
            return this;
        } 
        return (this.div(m));
    }



    .print method<> -> u32
    {
        printf("(%f, %f, %f)\n", this.x, this.y, this.z);
    }
}

entry function<> -> u32
{
    create position <- Vector(0.0,1.0,0.0);
    create velocity <- Vector(2.0,0.0,0.0);
    // sqrt doesnt work! fix
    position.add(velocity);
    position.print();

    return 0;
}