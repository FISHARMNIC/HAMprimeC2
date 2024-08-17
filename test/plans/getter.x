/*
Example for a Java ArrayList-like class
*/

Vector format {
    .x f32;
    .y f32;
    .z f32;
    
    .left static getter<> -> Vector
    {
        return clone Vector(-1.0,0.0,0.0);
    }

    .magnitude getter<> -> f32
    {
        return sqrt((this.x * this.x) + (this.y * this.y) + (this.z * this.z));
    }

    .Vector constructor<f32 x, f32 y, f32 z>
    {
        this.x <- x;
        this.y <- y;
        this.z <- z;
    }


}


entry function<> -> u32
{
    create position <- Vector(0.0,0.0,1.0);
    printf("%i\n", position.magnitude);
}