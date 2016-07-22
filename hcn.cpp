#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <NTL/RR.h>
#include <NTL/ZZ.h>

using namespace std; 
using namespace NTL; 

/*** New outputformat & 2 start parameter supported:  2002-11-07  (C) GPL ***/
/*** Author: Achim Flammenkamp, University of Bielefeld, achim@uni-bielefeld.de
     Reference: Collected Papers of Srinivasa Ramanujan (1927), chapter 15:
                Highly Composite Numbers  p. 78-128, paragraph 2-31 p. 81-111
******************************************************************************/
#ifndef  N
#define  N  (1<<8)
#endif
double  lnp[N];
double  p[N+1];

void init_prime_logs()
{
   unsigned  h, i, j, k;
//   extern double log(double);
   lnp[h=0]= 2;
   for (k=1,i=3;k<N;i+=2)
   {
      if (lnp[h]*lnp[h] <= i)
         h++;
      for (j=1;j<h;j++)
         if (!(i % (unsigned)lnp[j]))  break;
      if (j >= h)
         lnp[k++] = i;
   }
   p[0]=1;
   for (k=0;k<N;k++){
      p[k+1]=lnp[k];
      lnp[k]= log( lnp[k] );
        }
}


void print_composite(unsigned k, double vval, double dd, unsigned f[], unsigned nn)
{
(void)k;
(void)vval;
(void)dd;
(void)f;
(void)nn;
//   unsigned  h, i;
//   printf("%5u  %15llu %15.10lf  ",k, (unsigned long long)ceil(exp(vval)), vval);
//   if (dd < 1e14)
//      printf("%14.0lf  ", dd);
//   else
//      printf("%14.8le  ", dd);
//   h=0;
//   printf("%3u  ",nn);
//   for (i=0;i<nn;i++)
//      if (!i || f[i] != f[i-1])
//      {  if (h)
//            printf("^%u",h+1);
//         h=0;
//         printf("%2u",f[i]);
//      }
//      else
//         h++;
//   if (h)
//      printf("^%u ",h+1);

        static ZZ x ;
        x = 1;
        unsigned y = 31;
        
        RR v;
        v = vval;
   ZZ value = RoundToZZ(exp(v));
        (void)y;
        (void)value; 
        if(f[1]==4)
        cout<<vval<<"\t"<<p[nn]<<endl;

//        cout<<k<<"\t"<<p[nn]<<endl;
//        if(p[nn]<=y){
//        while(vval>log(x))
//                x += value/2;
//        cout<<vval<<"\t"<<k<<endl;
//        }
//        else exit(1);

}


int main(int argc, char *argv[])
{
(void)argc;
(void)argv;
unsigned  i, j, k, n, e[N], f[N];
unsigned  en, nn;
double  last, dl, max, val, d, dd, vval;

init_prime_logs();
setlinebuf(stdout);

vval=0.0;
dd= 1.0;
unsigned int numOfValues=0;
numOfValues=atoi(argv[1]);

//if (argc > 1 && 1 != sscanf(argv[1],"%lf",&vval)){
//   printf("usage: %s [ln_minimal_number [at_least_d]]\n",argv[0]);
//   exit(1);
//}
//if (argc > 2 && (1 != sscanf(argv[2],"%lf",&dd) || dd <= 0.0)){
//   printf("usage: %s [ln_minimal_number [at_least_d]]\n",argv[0]);
//   exit(1);
//}

for (i=0;i<N;i++)
   e[i]=0;
n=nn=0;
for (k=0;n<N && k<numOfValues;k++)
{
   print_composite(k, vval, dd, f, nn);
   last=vval;
   max= last + 0.6931471805599453;  /** ln(2); **/
   dl= dd;
   vval= max;
   for (i=0;i<n;i++)
      e[i]=0;
   n=1;
   val= 0.0;
   d = 1.0;
   do {
      i=0;
      do {
         while (e[i]+1 > 2*(unsigned)(lnp[n]/lnp[i]))
            i++;
         if (i==n)  n++;
         en= e[i]+1;
         for (j=0;j<=i;j++)
         {
            val -= e[j]*lnp[j];
            d /= e[j]+1;
            e[j]=en;
            if ((en+1)*lnp[j] < lnp[n-1])
               e[j]= lnp[n-1]/lnp[j];
            val += e[j]*lnp[j];
            d *= e[j]+1;
         }
         if (val > vval && en==1)  goto done;
         i++;
      } while (val > vval); 
      if (val > last && d > dl*(1.0+1e-12))
      {
         dd= d;
         vval= val;
         nn=n;
         for (i=0;i<n;i++)
            f[i]=e[i];
      }
   } while (1);
   done: 
   last=last;
}
return 0;
}
