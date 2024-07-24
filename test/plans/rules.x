/* THIS PART EXISTS */
/* Certain built-in rules that do things */
__rule StaticArraysAllocateSize true;

/* Or create a custom rule */
__rule myRule true;


/* THIS PART DOENS'T EXIST YET */
__if_rule myRule;

// code here

__endif_rule;