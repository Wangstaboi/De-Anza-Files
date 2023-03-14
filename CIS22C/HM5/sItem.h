#ifndef SITEM_H_INCLUDED
#define SITEM_H_INCLUDED

// sItem: Array set item
template <typename Thing>
struct sItem {    // Collected in Orderable Array ESI
    int id;    //  Value of element within Set
    Thing* thing;  // Ptr to Thing represented in Set
};
#endif // SITEM_H_INCLUDED
