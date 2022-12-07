#include <bits/stdc++.h>
using namespace std;

class node
{
    public: int data;
    node* ref;
};

node* Xor(node * a, node *b) {
    return reinterpret_cast<node *>(reinterpret_cast<uintptr_t>(a) ^ reinterpret_cast<uintptr_t>(b));
}



void insert(node** head,int data){
    node* new_node=new node();
    new_node->data=data;
    new_node->ref=*head;
    if (*head!=NULL) {
        (*head)->ref = Xor(new_node, (*head)->ref);
    }
    *head = new_node;
}

void printList(node *head){
    node *curr=head;
    node *prev=NULL;
    node *next;
    
    while(curr!=NULL){
        cout<<curr->data<<"->";
        next=Xor(prev,curr->ref);
        prev=curr;
        curr=next;
    }
}

void deleteEnd(node **head){
    if(head==NULL){
        cout<<"list is empty";
    }else{
        node *curr=*head;
        node *prev=NULL;
        node *next;
        while (Xor(curr->ref,prev)!=NULL)
        {
            next=Xor(prev,curr->ref);
            prev=curr;
            curr=next;
        }
        if (prev!=NULL)
        {
            prev->ref=Xor(Xor(prev->ref,curr),NULL);
        } else{
            *head=NULL;
        }
        delete(curr);
    }
}

int main(){
    node* head=NULL;
    int x,opt;
    while(1){
        cout<<"1-->insert\n";
        cout<<"2-->delete\n";
        cout<<"3-->printlist\n";
        cout<<"4-->exit\n";
        cin>>opt;
        switch (opt)
        {
        case 1:
            cout<<"Enter the data that need to be inserted";
            cin >> x;
            insert(&head,x);
            break;
        case 2:
            cout<<"deleting last element";
            deleteEnd(&head);
            cout<<"\n";
            break;
        case 3:
            printList(head);
            cout<<"\n";
            break;
        case 4:
            exit(1);
            break;
        }
    }

    return (0);
}
