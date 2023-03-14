#ifndef SIDSET_H_INCLUDED
#define SIDSET_H_INCLUDED
#include <algorithm>
#include "ESI.h"
#include "sItem.h"



template <typename E>
class siDset {  // Dynamic Set of sItem ptrs
    private:
        ESI<E> *ess;  // Ptr to orderable array of sItem ptrs   //NOT_USED
        sItem<E> *si;  // Ptr to a Set Item
        int sidx;    // Current Set index
    public:
//        siDset (size_t mxsz) : _size = 0, _capacity(mxsz), _array(new sItem <E>*[mxsz]) {}
        siDset (size_t mxsz) : ess(new ESI<E>(mxsz)), si(nullptr), sidx(0) {}


        siDset(siDset &);
        ~siDset () {
            if (si) delete si;
            if (ess) delete ess;
        }
// All the following “wrap” the equivalent ESI methods
        size_t getNum () const {  // # Elements in Dset
            return ess->getNum();
        }
        sItem<E>* get (size_t idx) const { // Get element at given index
            return ess->get(idx);
        }
        bool store (sItem<E>* si, int idx); // Replace element (*)
        bool insert (sItem<E>* si, int idx); // Insert element  (*)
        bool remove (int idx);           // Remove element  (*)
        int append (sItem<E>* elem) { // Append element, return Set size (*)
                return ess->append(elem);
        }
//  Set-specific things start here (not done in Orderable Array)
//  union is a reserved keyword in C++, I will use a different name for this function
        siDset* my_union (const siDset *)  const;// Inclusive OR
        siDset* intersect (const siDset *) const; // AND
        siDset* difference (const siDset *) const; // Difference
};             //(*) Operations for dynamic set only



//...Finds an union (OR) of ordered (sorted) sets
//We maintain the pointer to A and B members and update the smaller one
template <typename E>
siDset<E>* siDset<E>::my_union (const siDset<E> *B)  const {// Inclusive OR
    size_t a_max = getNum();  // number of elements in this set
    size_t b_max = B->getNum(); // number of elements in b set
    size_t a(0); //set a=0
    size_t b(0); //set b=0
    siDset<E> *C = new siDset<E>(a_max + b_max); //max array size for c is A+B, so initialize it as such

    while (a < a_max && b < b_max) { // while a and b are smaller than their max size
        if (((get(a))->id) == ((B->get(b))->id)) {  // A[a] == B[b]
                C->append (get(a));  // Append ptr to matched sItem to set C
                ++a; //go up an element in the array
                ++b; //go up an element in the array
        } else {
        if ((get(a))->id < (B->get(b))->id) {  // A[a] < B[b]
            C->append (get(a)); // Append ptr to matched sItem to set C
            ++a; //go up an element in array a
            }
        else { // B < A
            C->append (B->get(b)); //Append ptr to matched sItem to set C
            ++b; // go up an element in array b
            }
        }
    } // while
    //we need to add remaining members of the larger set, either A or B
    if (a < a_max) { //if any elements left in a
        for (size_t i=a; i < a_max; ++i) C->append (get(i)); //Append to C
    }
    //...We know that cannot be both a and b left.
    if (b < b_max) {
        for (size_t i=b; i < b_max; ++i) C->append (B->get(i)); //Append to C
    }

return C; //return ptr to ordered array C
} // my _union


#endif // SIDSET_H_INCLUDED
