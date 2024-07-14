#include <gmp.h>
#include <stdio.h>
#include <assert.h>

/*
sizeof(mpf_t) = 16
sizeof(mpz_t) = 12
*/

int main(){
    mpf_t bflt_a, bflt_b;

    // initiate number with base 10
    mpf_init_set_str(bflt_a, "12345678987654321e-2", 10);
    mpf_init_set_str(bflt_b, "12345678987654321e-2", 10);

    // a = a - b
    /*
    mpf_add, sub, mul, div
    mpf_<ins>_ui: takes ui as third param instead of bignum
    
    */
    mpf_sub(bflt_a, bflt_a, bflt_b);

    // display 100 chars max in base 10
    mpf_out_str(stdout, 10, 100, bflt_a);

    // destroy 
    mpf_clear(bflt_a);
    mpf_clear(bflt_b);
}
