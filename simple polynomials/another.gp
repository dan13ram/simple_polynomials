allocatemem(800000000);
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

p = 524309; \\20 bit prime
d = random(2^9) + 2^9; \\10 bit degree

setrand(23);
iterator=0;
f = vector(d+1,x,Mod(random(p),p)); 
f[1] = 1; 
f = Pol(f); 

temp = initpowers(p,f);

print(centerlift(temp[1]));
print(centerlift(temp[2]));
print(centerlift(temp[3]));
print(centerlift(temp[4]));
