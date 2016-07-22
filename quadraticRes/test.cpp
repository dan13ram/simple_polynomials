#include<iostream>
#include<algorithm>
#include<cmath>
#include<NTL/ZZ.h>
#include<NTL/ZZ_pXFactoring.h>
#include<NTL/tools.h>

using namespace std;
using namespace NTL;


int main(){
        ZZ c2pow20,c2pow100,c2pow200;
        c2pow20=1048576;
        c2pow100=c2pow20*c2pow20*c2pow20*c2pow20*c2pow20;
        c2pow200=c2pow100*c2pow100;
        ZZ p; 
        p = GenPrime_ZZ(256);
        cout << p << "\n";
        ZZ q;
        q = NextPrime(p+c2pow200);
        cout << q << "\n";
        ZZ valuesN[10];
        valuesN[0]=p*q;
        for(int i=1;i<10;++i){
                p = NextPrime(q+c2pow200);
                q = NextPrime(p+c2pow200);
                valuesN[i]=p*q;
        }

        for(int i=0;i<10;++i){
                cout<<"valuesN["<<i<<"] = "<<valuesN[i]<<endl;
        }
        return 0;
}
