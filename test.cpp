#include<iostream>
#include<NTL/ZZ.h>
#include<vector>
#include<cmath>

using namespace std;
using namespace NTL;

int main(){
        long n = 183783600;
        long b = 18;
        long rootn=SqrRoot(n);
        long p;
        PrimeSeq s;
        vector<long> values;
        vector<long> logV;
        for(long m=n+1;m<1.66*n;m++){
                values.push_back(m);
                logV.push_back(log(m));
        }
                s.reset(b);
                p=s.next();
                int temp=log(p);
                while(p<rootn){
        for(int i=0;i<logV.size();i++){
                        long t=pow(10,(logV[i]/temp));
                        if(ceil(t)-t<0.05 || t-floor(t)<0.05){
//                        cout<<"here at "<<i<<endl;
                                values[i]=0;
                                
                                break;
                        }
                }
                        p=s.next();
        }
        int y=0;
        cout<<"arr=[";
        for(int i=0;i<values.size();++i){
                if(values[i]!=0)cout<<values[i]<<",";
//                if(temp[i]!=0)cout<<temp[i]<<endl;
        }
        cout<<"0]"<<endl;
        cout<<"ND = numdiv("<<n<<"); nd = 0; i = 1; while( nd<=ND, nd = numdiv(arr[i]); i = i+1); print(arr[i-1])"<<endl;

        return 0;
}
               

