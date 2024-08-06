
create bob <- allocate(10);
bob <- allocate(5); // compiler keeps track of anything that owns an allocation. Changing it frees the old reference
create jon <- acquire bob; // this doesnt delete the reference
