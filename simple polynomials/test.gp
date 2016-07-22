allocatemem(80000000);

initpowers(pr,pol)={
Num = ceil(log(pr^5)/log(2));
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

setrand(1231);
p = nextprime(random(2^10)+2^19); \\20 bit prime
print("Prime is ");
print(p);
d = 20; 
print("Degree is ");
print(d);
total=100000;
it=1;
count=0;
while(it<=total, \
f = vector(d+1,x,Mod(random(p),p));  \
f[1] = 1; /*print("Polynomial is ");print(f);*/ \
f = Pol(f); \
/*f = ffinit(p,1)^random(40)*ffinit(p,2)^random(40)*ffinit(p,3)^random(40)*ffinit(p,4)^random(40)*ffinit(p,5)^random(40);*/ \
pol = f; \
arrPow = initpowers(p,f); \
print(done);/*A1 = Mod(multmod(p,p,f)-x,f);A2 = Mod(multmod(p^2,p,f)-x,f);*/ \
A3 = Mod(multmod(p^3,p,f)-x,f); \
A4 = Mod(multmod(p^4,p,f)-x,f); \
A5 = Mod(multmod(p^5,p,f)-x,f); /*g = centerlift(gcd(A1,f)); \
while(g!=1, \
        c = 0; \
        while(c==0, \
                temp = divrem(f,g);\
                c = temp[2]; \
                if(c==0,f=temp[1])\
                );\
        g = centerlift(gcd(A1,f)); \
        );\
g = centerlift(gcd(A2,f));\
while(g!=1,\
        c = 0;\
        while(c==0,\
                temp = divrem(f,g);\
                c = temp[2]; \
                if(c==0,f=temp[1])\
                );\
        g = centerlift(gcd(A2,f)); \
        ); */ \
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
        g = centerlift(gcd(A3,f)); \
        );\
g = centerlift(gcd(A5,f));\
while(g!=1,\
        c = 0;\
        while(c==0,\
                temp = divrem(f,g);\
                c = temp[2]; \
                if(c==0,f=temp[1])\
                );\
        g = centerlift(gcd(A3,f)); \
        );\
if(poldegree(f)==0,print(it," is 5-smooth and factors are ");print(factor(pol));count=count+1,print(it," is not 5-smooth")); \
it = it + 1; );
print("The number of 5-smooth polynomials is ",count);
print("Percentage of 5-smooth polynomials in ",total," random degree-",d," polynomials is ",count*100.0/total, " %.");
