allocatemem(80000000);

initpowers(pr,pol)={
Num = ceil(log(pr^8)/log(2));
arr = vector(Num);
A = Mod(Mod(1,pr)*x^1,pol);
i = 1;
while(i<=Num,
        A = Mod(A^2, pol); \
        arr[i]=A; \
        i = i+1; \
        );
return(arr);
}

multmod(N,pr,pol)={
        if(N==1, return(Mod(Mod(1,pr)*x,pol)) );
        k = floor(log(N)/log(2));
        l = N - 2^k;
        if(l==0, \
                return(arrPow[k]),\
                return(arrPow[k]*multmod(l,pr,pol)) \
                );
        };

setrand(18);
p = nextprime(2^10+2^19+100); \\20 bit prime
d = 20; 
total = 20000;
it=1;
count=0;
semi61=0;
semi62=0;
semi63=0;
semi71=0;
semi72=0;
semi73=0;
semi81=0;
semi82=0;
semi83=0;


while(it<=total, \
f = vector(d+1,x,Mod(random(p),p));  \
f[1] = 1; /*print("Polynomial is ");print(f);*/ \
f = Pol(f); \
/*f = ffinit(p,1)^random(4)*ffinit(p,2)^random(10)*ffinit(p,3)^random(5)*ffinit(p,4)^random(6)*ffinit(p,5)^random(5)*ffinit(p,6)^random(3)*ffinit(p,7)^random(4);*/ \
pol = f; \
arrPow = initpowers(p,f); \
print(it," done of ",total); /*A1 = Mod(multmod(p,p,f)-x,f);A2 = Mod(multmod(p^2,p,f)-x,f);*/ \
A3 = Mod(multmod(p^3,p,f)-x,f); \
A4 = Mod(multmod(p^4,p,f)-x,f); \
A5 = Mod(multmod(p^5,p,f)-x,f); \
A6 = Mod(multmod(p^6,p,f)-x,f); \
A7 = Mod(multmod(p^7,p,f)-x,f); \
A8 = Mod(multmod(p^8,p,f)-x,f); \
g = centerlift(gcd(A3,f)); \
while(g!=1,\
        c = 0;\
        while(c==0,\
                temp = divrem(f,g);\
                c = temp[2]; \
                if(c==0,f=temp[1])\
                );\
        g = centerlift(gcd(A3,f)); \
        );\
g = centerlift(gcd(A4,f));\
while(g!=1,\
        c = 0;\
        while(c==0,\
                temp = divrem(f,g);\
                c = temp[2]; \
                if(c==0,f=temp[1])\
                );\
        g = centerlift(gcd(A4,f)); \
        );\
g = centerlift(gcd(A5,f));\
while(g!=1,\
        c = 0;\
        while(c==0,\
                temp = divrem(f,g);\
                c = temp[2]; \
                if(c==0,f=temp[1])\
                );\
        g = centerlift(gcd(A5,f)); \
        );\
if(poldegree(f)==0, \
        count=count+1, \
        deg1 = poldegree(f); \
        g = centerlift(gcd(A6,f));\
        while(g!=1,\
                c = 0;\
                while(c==0,\
                        temp = divrem(f,g);\
                        c = temp[2]; \
                        if(c==0,f=temp[1]) );\
                g = centerlift(gcd(A6,f)) );\
        if(poldegree(f)==0, \
                if(deg1==6, \
                        semi61 = semi61 + 1, \
                        if(deg1==12, \
                                semi62 = semi62 + 1, \
                                if(deg1==18, \
                                        semi63 = semi63 + 1 ) ) ), \
                deg2 = poldegree(f); \
                g = centerlift(gcd(A7,f)); \
                while(g!=1, \
                        c = 0; \
                        while(c==0, \
                                temp = divrem(f,g); \
                                c = temp[2]; \
                                if(c==0,f=temp[1]) ); \
                        g = centerlift(gcd(A7,f)) ); \
                if(poldegree(f)==0, \
                        if( deg2 == 7, if( deg1==7, semi71 = semi71 + 1, if(deg1==13, semi72=semi72+1, if( deg1=19,semi73=semi73+1)))); \
                        if( deg2 == 14, if( deg1=14, semi72 = semi72 + 1, if(deg1=20, semi73=semi73+1 ))); \
                        if( deg2 == 21, semi73 = semi73 + 1), \
                        deg3 = poldegree(f); \
                        g = centerlift(gcd(A8,f)); \
                        while(g!=1, \
                                c = 0; \
                                while(c==0, \
                                        temp = divrem(f,g); \
                                        c = temp[2]; \
                                        if(c==0,f=temp[1]) ); \
                                g = centerlift(gcd(A8,f)) ); \
                        if(poldegree(f) == 0, \
                                if(deg3 == 8 , if( deg2 == 8 , if( deg1 == 8, semi81 = semi81 + 1); \
                                                               if( deg1 == 14, semi82 = semi82 + 1); \
                                                               if( deg1 == 20, semi83 = semi83 + 1));\
                                               if( deg2 == 15, if( deg1 == 15, semi82 = semi82 + 1);\
                                                               if( deg1 == 21, semi83 = semi83 + 1)); \
                                               if( deg2 == 22, if( deg1 == 22, semi83 = semi83 + 1)));\
                                if(deg3 == 16, if( deg2 == 16, if( deg1 == 16, semi82 = semi82 + 1);\
                                                               if( deg1 == 22, semi83 = semi83 + 1)))\
                          ) \
                  ) \
           ) \
); \
it = it + 1 );

print("Prime is ",p);
print("Degree is ",d);
print("The number of 5-smooth polynomials is ",count);
print("\nThe number of 5+1 semi-smooth (6) polynomials is ",semi61);
print("The number of 5+2 semi-smooth (6,7) polynomials is ",semi71+semi61);
print("The number of 5+3 semi-smooth (6,7,8) polynomials is ",semi71+semi61+semi81);
print("\nThe number of 5+1 semi-smooth (6+6) polynomials is ",semi62);
print("The number of 5+2 semi-smooth (6+6,6+7,7+7) polynomials is ",semi72+semi62);
print("The number of 5+3 semi-smooth (6+6,6+7,7+7,6+8,7+8,8+8) polynomials is ",semi72+semi62+semi82);
print("\nThe number of 5+1 semi-smooth (6+6+6) polynomials is ",semi63);
print("The number of 5+2 semi-smooth (6+6+6,6+6+7,6+7+7) polynomials is ",semi73+semi63);
print("The number of 5+3 semi-smooth (6+6+6,6+6+7,6+7+7,6+6+8,6+7+8,7+7+8,6+8+8) polynomials is ",semi73+semi63+semi83);
print("Percentage of 5-smooth polynomials in ",total," random degree-",d," polynomials is ",count*100.0/total, " %.");
