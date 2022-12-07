#include<bits/stdc++.h>
#include<vector>
#include<iostream>
using namespace std;    
void count_no_islands(vector<vector<int> > &M, int r, int c);
void dfs(vector<vector<int> > &M, int i, int j, int r, int c);

int num = 0;
int main(){
    int r,c,ele;
    cout<<"Enter dimensions of matrix : "<<endl;
    cin>>r>>c;
    vector <vector<int> > M(r);
    cout<<"Enter the matrix : "<<endl;
    for(int i=0;i<r;i++){
        for(int j=0;j<c;j++){
            cin>>ele;
            M[i].push_back(ele);
        }
    }
    cout<<"matrix : "<<endl;
    for(int i=0;i<r;i++){
        for(int j=0;j<c;j++){
            cout<<M[i][j]<<" ";
        }
        cout<<endl;
    }
    count_no_islands(M,r,c);
    cout<<"No of islands = "<<num<<endl;
}

void count_no_islands(vector<vector<int> > &M, int r, int c){
    for(int i=0;i<r;i++){
        for(int j=0;j<c;j++){
            if(M[i][j]==1){
                // cout<<"I="<<i<<" J="<<j<<endl;
                num+=1;
                M[i][j]=0;
                dfs(M,i-1,j-1,r,c);
                dfs(M,i-1,j,r,c);
                dfs(M,i-1,j+1,r,c);
                dfs(M,i,j-1,r,c);
                dfs(M,i,j+1,r,c);
                dfs(M,i+1,j-1,r,c);
                dfs(M,i+1,j,r,c);
                dfs(M,i+1,j+1,r,c);
            }    
        }
    }    
}

void dfs(vector<vector<int> >&M, int i, int j, int r, int c){
    // cout<<"i="<<i<<" j="<<j<<endl;
    if(i<0 || j<0 || i==r || j==c)
        return;
    if(M[i][j]==1){
        M[i][j]=0;
        dfs(M,i-1,j-1,r,c);
        dfs(M,i-1,j,r,c);
        dfs(M,i-1,j+1,r,c);
        dfs(M,i,j-1,r,c);
        dfs(M,i,j+1,r,c);
        dfs(M,i+1,j-1,r,c);
        dfs(M,i+1,j,r,c);
        dfs(M,i+1,j+1,r,c);
    }
}
