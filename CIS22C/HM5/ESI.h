#ifndef ESI_H_INCLUDED
#define ESI_H_INCLUDED
#define GROW_POLICY 2
#include "sItem.h"

template <typename E>
class ESI {  // Enhanced Array of Set Item Pointers (All �resizing� auto-done here)
    size_t _size;
    size_t _capacity;
    sItem<E> **_array = NULL;
    void grow_the_array() {
        sItem<E>** tmp = new sItem<E>*[_capacity*GROW_POLICY];
        for (size_t i = 0; i < _capacity; ++i) {
            tmp[i] = _array[i];
        }
        delete[] _array;
        _array = tmp;
        _capacity = _capacity * GROW_POLICY;
    }
public:
    ESI (size_t initSz) : _size(0), _capacity(initSz), _array(new sItem <E>*[initSz]) {} // Create internal sItem* Array of that Size
    ESI (ESI&esi) {};
    ~ESI() {delete[] _array;}  // Copy constructor & Destructor
    unsigned int getNum () {return _size;}  // Size of Array
    sItem<E>* get (size_t index) { // Get sItem* at index // Return -1 if specified index illegal
        if (index >= _size) {
            std::cout << "ERROR: get attempt out of range, index = "<<index<<"  curent size is "<<_size<<std::endl;
            exit(1);
        }
        return _array[index];
    }
    size_t set (int index, sItem<E>*ep) {
        if (index >= _size) {
            std::cout << "ERROR: set attempt out of range, index = "<<index<<"  curent size is "<<_size<<std::endl;
            exit(1);
        }
        _array[index] = ep;
        return index;
    }// Overwrite existing sItem* at index
    size_t insert (int index, sItem<E> *ep) { // Insert sItem*, push others back. Resize if needed
        if (index > _size) {
            std::cout << "ERROR: insert attempt out of range, index = "<<index<<"  curent size is "<<_size<<std::endl;
            exit(1);
        }
        if (_size == _capacity)
            grow_the_array(); //calling function to make array twice as big
        // We need to free space at the index, lets shift all elements right
        for (size_t i = _size; i > index; i--){
            _array[i] = _array[i-1];
        }
        ++_size;
        return index;
    } //end of insert
    size_t append (sItem<E>* ep) {// Append to back. Resize if needed
        if (_size == _capacity)
            grow_the_array(); //calling function to make array twice as big
        _array[_size] = ep;
        ++_size; //let _size know we added an element
        return _size;
    }
    size_t prepend (sItem<E>* ep) {// Prepend to front, push others back.  Resize if needed
        return insert(0, ep); //our insert function already does everything we need prepend to do so we reuse it
    }
    size_t remove (int index) {// Remove sItem*, move others down
        if (index > _size) {
            std::cout << "ERROR: remove attempt out of range, index = "<<index<<"  curent size is "<<_size<<std::endl;
            exit(1);
        }
        sItem<E>* removed_element = _array[index];

        for (size_t i = index; i<_size; ++i){
            _array[i] = _array[i+1];
        };
        _size--; //size is less after removing an element
    }
};

#endif // ESI_H_INCLUDED
