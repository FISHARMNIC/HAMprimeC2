/*
This file does not work yet and is stil being worked on
*/

Linked format 
{
    .current u32;
    .next Linked;
    
    
    .Linked constructor<> -> u32
    {
        this.next <- 0;
    }
    
    .findLast method<> -> Linked
    {
        create reference <- borrow this;
        while(reference.next != 0)
        {
            reference <- reference.next;
        }
        return reference;
    }
    
    .add method<> -> u32
    {
        create end <- this.findLast();
        create newAddr <- Linked();
        end.next <- newAddr;
    }
}


entry function<> -> u32
{
    
}
