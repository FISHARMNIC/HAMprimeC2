Map #T(keys);

Map format
{
    .size u32;

    .keys string:array;
    .values auto:array;

    /* 
    realizer is compile time, and sets the type of the properties of that instance to the given type
    So calling Map(string, u32) treats those two types as realizers, and sets the correspind properties to be of that type 
    The properties have to be of type unknown
    #T - type of
    #Tloc - type of this.something
    */
    .Map constructor<realizer values> -> u32
    {
        this->size = 1;
        this->keys = string[1];
        this->values = auto:(this.values)[1];
    }

    .Map operator("index-set")<auto:(this.keys) newKey, auto:(this.values) newValue>
    {
        /* allocate new set, etc */
    }

    .Map operator("index-get")<#Tloc(keys) index> -> #Tloc(values)
    {
        create i <- 0;
        while(i <- this.size)
        {
            if(this.keys[i] == index)
            {
                return this->values[i]
            }
        }
    }



}