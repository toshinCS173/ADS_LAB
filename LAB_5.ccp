#include<bits/stdc++.h>
using namespace std;

struct node
{
 int data;
 struct node *left;
 struct node *right;
};
typedef node* NODE;

class Tree
{
 public:
 int getHeight(NODE);
 int getBalanceFactor(NODE);
 NODE leftRotate(NODE);
 NODE rightRotate(NODE);
 NODE rotation(NODE);

 void display(NODE);
 NODE insertElement(NODE,int);
 NODE deleteElement(NODE,int);
 NODE minValueNode(NODE);

};

NODE Tree::leftRotate(NODE p)
{
 NODE y = p->right;
 NODE T2 = y->left;

 y->left = p;
 p->right = T2;

 return y;
}

NODE Tree::rightRotate(NODE p)
{
NODE y = p->left;
 NODE T2 = y->right;

 y->right = p;
 p->left = T2;

 return y;
    
}

void Tree::display(NODE root)
{
 if(root != NULL)
 {
 cout << root->data<< " ";
 display(root->left);
 display(root->right);
 }
}

int Tree::getHeight(NODE temp)
{
 int h = 0;
 if (temp != NULL)
 {
 int lheight = getHeight (temp->left);
 int rheight = getHeight (temp->right);
 int maxheight = max(lheight, rheight);
 h = maxheight + 1;
 }
 return h;
}

int Tree::getBalanceFactor(NODE temp)
{
 /*if(temp==NULL)
. return 0;*/

 int lheight = getHeight (temp->left);
 int rheight = getHeight (temp->right);
 int bfactor= lheight - rheight;
 return bfactor;
}

NODE Tree::rotation(NODE p)
{
 int balance = getBalanceFactor(p);
 NODE temp;

 if (balance > 1)
 {
    if (getBalanceFactor(p->left) > 0)
    p = rightRotate(p);
     else
    {
       p ->left = leftRotate(p->left);
       p = rightRotate(p);
    }

 }

 else if (balance < -1)
 {
    if (getBalanceFactor(p->right) > 0)
     {
       p ->right = rightRotate(p->right);
       p = leftRotate(p);
    }
    else
    p = leftRotate(p);

    }
    return p;

 }

 NODE Tree::minValueNode(NODE p)
 {
    NODE current = p;

    while (current->left != NULL)
    current = current->left;

    return current;
 }

 NODE Tree::deleteElement(NODE p,int value)
 {
    if (p == NULL)
    return p;

    if ( value < p->data )
    {
         p->left = deleteElement(p->left, value);
        p = rotation(p);
    }

    else if( value > p->data )
    {
        p->right = deleteElement(p->right, value);
        p = rotation(p);
    }

    else
    {
        if( (p->left == NULL) ||(p->right == NULL) )
        {
            NODE temp = p->left ? p->left :p->right;
            if (temp == NULL)
            {
                temp = p;
                p = NULL;
            }
            else
            {
            p = temp;
            p = rotation(p);
            }
            free(temp);
        }
        else
        {

            NODE temp = minValueNode(p->right);
            p->data = temp->data;
            p->right = deleteElement(p->right,temp->data);
            p = rotation(p);
        }
    }
        return p;
}

NODE Tree::insertElement(NODE root, int value)
{
    if (root == NULL)
    {
        root = (NODE)malloc(sizeof(struct node));
        root->data = value;
        root->left = NULL;
        root->right = NULL;
        return root;
    }
    else if (value < root->data)
    {
        root->left = insertElement(root->left, value);
        root = rotation(root);
    }
    else if (value >= root->data)
    {
        root->right = insertElement(root->right, value);
         root = rotation(root);
    }
    return root;
}


int main()
{
 int choice;
 cout<<"1.Insert Element"<<endl;
 cout<<"2.Display"<<endl;
 cout<<"3.Delete"<<endl;
 cout<<"4.Exit"<<endl;

 NODE root = NULL;
 int item;

 Tree tree;

 while (1)
 {
    cout<<"Enter your Choice: ";
    cin>>choice;
    switch(choice)
    {
        case 1:
                cout<<"Enter value to be inserted"<<endl;
                cin>>item;
                root = tree.insertElement(root, item);
                break;

        case 2:
                if (root == NULL)
                {
                   cout<<"Tree is Empty"<<endl;
                   continue;
                 }
                cout<<"Balanced AVL Tree:"<<endl;
                tree.display(root);
                cout<<endl;
                break;

        case 3: 
                cout<<"Enter value to be deleted"<<endl;
                int x;
                cin>>x;
                root = tree.deleteElement(root,x);
                break;

        case 4:
                 exit(1);
                 break;

         default:
                cout<<"Wrong Choice"<<endl;
    }
 }
 return 0;
}
