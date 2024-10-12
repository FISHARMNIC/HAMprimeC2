MapEntry format
{
    .key string;
    .value u32
    
    .next MapEntry;

    .MapEntry constructor<string k, u32 v>
    {
        this.key <- k;
        this.value <- v;

        this.next <- 0;
    }
}

Map format 
{   
    .head MapEntry;

    .rlast MapEntry;
    
    .Map constructor<>
    {
        this.head <- 0;
    }

    .kneErr method<string k> -> u32
    {
        print_("Key " + k + " does not exist");
        exit(0);
    }
    
    .find method<string k> -> MapEntry:borrowed
    {
        if(this.head == 0)
        {
            print_("Map empty");
            return null;
        }

        create reference <- borrow this.head;

        while(reference.key != k)
        {
            if(reference.next == 0)
            {
                this.rlast <- borrow reference; // todo, make sure NOT taking ownership if i remove borrow
                return null;
            }
            reference <- borrow reference.next;
        }
        return reference;
    }
    
    .remove method<string k> -> u32
    {
        if(this.head.key == k)
        {
            this.head <- this.head.next;
            return 0;
        }

        if(this.head.next == 0)
        {
            this.kneErr(k);
        }

        create reference <- borrow this.head;

        while(reference.next.key != k)
        {
            reference <- borrow reference.next;
            if(reference.next == 0)
            {
                this.kneErr(k);
            }
        }

        reference.next <- reference.next.next; // TODO: make sure that this sets Ownership
    }

    .set method<string k, u32 val> -> u32
    {
        create reference <- this.find(k);

        if(reference == 0)
        {
            this.rlast.next <- MapEntry(k,val);
        }
        else
        {
            reference.value <- val;
        }
    }
}

entry function<> -> u32
{
    create map <- Map();
}
