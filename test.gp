        n = 15120;
        b = 9;
        p;
        vector<long> temp;
        for(long m=n+1;m<2*n;m++){
                temp.push_back(m);
        }
        for(int i=0;i<temp.size();i++){
                s.reset(b);
                p=s.next();
                while(p<n){
                        if(temp[i]%p==0){
//                        cout<<"here at "<<i<<endl;
                                temp[i]=0;
                                
                                break;
                        }
                        p=s.next();
                }
        }
        int y=0;
        cout<<"array=[";
        for(int i=0;i<temp.size();++i){
                if(temp[i]!=0)cout<<temp[i]<<",";
//                if(temp[i]!=0)cout<<temp[i]<<endl;
        }
        cout<<"]"<<endl;
        return 0;
}
               

