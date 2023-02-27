#include <iostream>
#include <string>

using namespace std;



class BST {
    private:
        BST *parent;
        BST * LHC;
        BST * RHC;
        string key;
    public:
        Node* BST::getPrevious(Node*);

}


Node* BST::getPrevious(Node* from) {
    Node *currNode = from->parent;
    if (from->LHC) {
        currNode = from->LHC;
        while(currNode->RHC) { currNode = RHC;}
        return currNode;
    }
    if (from == toRoot) return NULL;
    if (from == from->parent->RHC) {
        return (from->parent);
    }
    while (currNode == currNode->parent->LHC) {
        if (from == toRoot) return NULL;
        if (!(currNode = currNode->parent)) {
            break;
        }
    }
    return currNode->parent;
}