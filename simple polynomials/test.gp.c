/*-*- compile-command: "cc -c -o test.gp.o -g -O3 -Wall -fomit-frame-pointer -fno-strict-aliasing -fPIC -I"/usr/include" test.gp.c && cc -o test.gp.so -shared -g -O3 -Wall -fomit-frame-pointer -fno-strict-aliasing -fPIC -Wl,-shared test.gp.o -lc -lm -L/usr/lib/x86_64-linux-gnu -lpari"; -*-*/
#include <pari/pari.h>
/*
GP;install("init_test","v","init_test","./test.gp.so");
*/
void init_test(void);
/*End of prototype*/

static GEN p;
static GEN d;
static GEN f;
/*End of global vars*/

void
init_test(void)	  /* void */
{
  GEN p1;
  GEN p2;	  /* vec */
  p = pol_x(fetch_user_var("p"));
  d = pol_x(fetch_user_var("d"));
  f = pol_x(fetch_user_var("f"));
  /*allocatemem(800000000); */
  p = stoi(65537);
  d = gadd(genrand(powis(gen_2, 7)), powis(gen_2, 7));
  p1 = gaddgs(d, 1);
  {
    long x;
    p2 = cgetg(gtos(p1)+1, t_VEC);
    for (x = 1; gcmpsg(x, p1) <= 0; ++x)
      gel(p2, x) = genrand(p);
  }
  f = p2;
  gel(f, 1) = gen_1;
  f = gtopoly(f, -1);
  return;
}

