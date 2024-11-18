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

    .Vector operator(add)<Vector other> -> Vector
    {
        create dupe <- duplicate(this);
        return(dupe.add(other));
    }

    .Vector operator(sub)<Vector other> -> Vector
    {
        create dupe <- duplicate(this);
        return(dupe.add(other));
    }

    .Vector operator(mul)<f32 scale> -> Vector
    {
        create dupe <- duplicate(this);
        return(dupe.mul(scale));
    }

    .Vector operator(div)<f32 scale> -> Vector
    {
        create dupe <- duplicate(this);
        return(dupe.div(scale));
    }

    .dot method<Vector other> -> Vector
    {
        create dupe <- duplicate(this);
        dupe.x <- dupe.x * other.x;
        dupe.y <- dupe.y * other.y;
        dupe.z <- dupe.z * other.z;
        return(dupe);
    }

    .cross method<Vector other> -> Vector
    {
        create dupe <- duplicate(this);
        dupe.x <- this.y * other.z - this.z * other.y;
        dupe.y <- this.z * other.x - this.x * other.z;
        dupe.z <- this.x * other.y - this.y * other.x;
        return(dupe);
    }

    .magnitude method<> -> f32
    {
        return(root((this.x * this.x) + (this.y * this.y) + (this.z * this.z)));
    }

    .normalize method<> -> Vector
    {
        create m <- this.magnitude();
        if(m == 0)
        {
            return this;
        } 
        return (this.div(m));
    }

    .normalized method<> -> Vector
    {
        create dupe <- duplicate(this);
        return(dupe.normalize());
    } 

    .toString method<> -> auto
    {
        return(`(${this.x}, ${this.y}, ${this.z})`);
    }
}

entry function<> -> u32
{
    create position <- Vector(1.0,3.0,4.0);
    create velocity <- Vector(2.0,7.0,-5.0);
    print_(position);
    print_(position.magnitude());
    print_(position + velocity);
    print_(position.cross(velocity));

    return 0;
}