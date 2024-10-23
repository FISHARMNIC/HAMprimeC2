/// This library is deprecated


#include <gmp.h>
#include <stdio.h>

/*
sizeof(mpf_t) = 16
sizeof(mpz_t) = 12
*/

extern volatile int *__allocate_wsize__(int bytes); // declared in assembly by HAM, basically malloc
extern int dispose(int *pointer);

void bignum_setp(int bits)
{
    mpf_set_default_prec(bits);
}

/// @brief Allocates new bignum float and returns pointer to it
/// @param number Number as a string (in format: 123e-456)
/// @return Pointer to new bignum
int *bignum(char *number)
{
    mpf_t *bigfloat = (mpf_t *)__allocate_wsize__(sizeof(mpf_t));
    mpf_init_set_str(*bigfloat, number, 10);
    return (int *)bigfloat;
}

int *bignum_fromInt(int number)
{
    mpf_t *bigfloat = (mpf_t *)__allocate_wsize__(sizeof(mpf_t));
    mpf_init_set_si(*bigfloat, number);
    return (int *)bigfloat;
}

void bignum_set(mpf_t *dest, mpf_t *source)
{
    mpf_set(*dest, *source);
}

void bignum_set_fromInt(mpf_t *dest, int source)
{
    mpf_set_si(*dest, source);
}

int bignum_dispose(mpf_t *bigfloat)
{
    mpf_clear(*bigfloat);
    dispose((int *)bigfloat);
    return 0;
}

int bignum_print(mpf_t *bigfloat)
{
    // Params: 0=output, 1=base, 2=max numbers
    mpf_out_str(stdout, 10, 200, *bigfloat);
    return 0;
}

// just do macros instead

void bignum_add(mpf_t *dest, mpf_t *oa, mpf_t *ob)
{
    mpf_add(*dest, *oa, *ob);
}

void bignum_sub(mpf_t *dest, mpf_t *oa, mpf_t *ob)
{
    mpf_sub(*dest, *oa, *ob);
}

void bignum_mul(mpf_t *dest, mpf_t *oa, mpf_t *ob)
{
    mpf_mul(*dest, *oa, *ob);
}

void bignum_mul_intb(mpf_t *dest, mpf_t *oa, int ob)
{
    mpf_mul_ui(*dest, *oa, ob);
}

void bignum_div(mpf_t *dest, mpf_t *oa, mpf_t *ob)
{
    mpf_div(*dest, *oa, *ob);
}

void bignum_div_intb(mpf_t *dest, mpf_t *oa, int ob)
{
    mpf_div_ui(*dest, *oa, ob);
}

void bignum_sqrt(mpf_t *dest, mpf_t *oa)
{
    mpf_sqrt(*dest, *oa);
}

void bignum_neg(mpf_t *dest, mpf_t *oa)
{
    mpf_neg(*dest, *oa);
}

void bignum_abs(mpf_t *dest, mpf_t *oa)
{
    mpf_abs(*dest, *oa);
}

// mpf_sub(bflt_a, bflt_a, bflt_b);