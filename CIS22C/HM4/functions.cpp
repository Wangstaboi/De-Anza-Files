#include <iostream>

using namespace std;

hItem* MaxHeap::look() const {

    if (hmax == 0) return NULL;

    return ehi->get(0);

}

hItem* MaxHeap::pop() {

    if (hmax == 0) return NULL;

    ehi->set(0, ehi->get(hidx));
    hmax--;

    maxHeap(hmax);

    return ehi->get(0);

}

void MaxHeap::swap(int indexOne, int indexTwo) {
    hItem* temp = ehi->get(indexOne);
    ehi->set(indexOne, ehi->get(indexTwo, ehi));
    ehi->set(indexTwo, temp);
    return;
}