#pragma once
#include "Student.h"
#include <iostream>
#include <new>
/// HM1
// This is the interface to an "Enhanced" student array that you will write.
// The methods that need to be supported are shown below. Note: Array
// auto-resizing may need to be done.
class StudentEsa {
private:         // Define what you need
  Student **sap; // Underlying pointer to array of Student pointers, which you
                 // will allocate
  Student **tp;  // Optionally used in realloc
  int cnum;      // Number of students currently in array
  int cmz;       // Current Max size of the array (may need to be expanded)
public:          // Publically supported methods you need to implement
  StudentEsa(){
    sap = nullptr; tp = nullptr; cnum = 0; cmz = 0;
  }  // Default Constructor
  StudentEsa(StudentEsa &studentEsa){
    *this = studentEsa;
  } // Copy Constructor
  // Initialization Constructor. Allocate array ofthis size.
  // May need to be expanded
  StudentEsa(int size){ 
    sap = new (Student*[size]);
    cmz = size;
    cnum = 0;
    tp = NULL;
  } 
  
  ~StudentEsa(); // Default destructor
  // Return the number of Students in the Collection
  int getNum(){
    return cnum;
  }
  // GET: Get and return the ptr to the Student at the specified Index
  // Error if the supplied index >= array size. Return a NULL ptr
  Student* get(int idx) {
    if (idx<0 || idx >= cnum) return NULL; // Bad index
    return sap[idx]; // Otherwise return Student ptr at that index in the  array
  }

  // SET: Replace
  // Destruct the Student whose ptr is at the supplied index
  // Insert the ptr of the new Student at that index. Return index # on success
  // Error if the supplied index >= array size. Return -1
  int set(Student* student, int idx){
    if(idx < 0 || idx >= cnum) return -1;
    delete sap[idx];
    sap[idx] = student;
    return idx;
  }
  // INSERT
  // Insert the Student ptr at the supplied index, by first "pushing back" every
  // subsequent element, bump Esa Size Note: This may force a reallocation of
  // the array. Return index # on success Error if the supplied index >= array
  // size. Return -1
  int insert(Student* student, int idx){
    if(idx < 0 || idx >= cmz) return -1;

    if(cnum == cmz){
        // reallaoc
        tp = new (Student*[cmz * 2]); // allocate twice of previous size
        // copy till idx
        int i = 0;
        for(i = 0; i < idx; i++){
            tp[i] = sap[i];
        }
        tp[i] = student; 
        for(i = idx; i < cnum ; i++){
            tp[i + 1] = sap[i];
        }
        sap = tp;
        tp = NULL;
        cnum++;
        cmz = cmz * 2;
        return idx;
    }
    // pushing back subsequent element
    Student* prev = student;
    for(int i = idx ; i < cnum; i++){
        Student* np = sap[i];
        sap[i] = prev;
        prev = np;
    }
    sap[cnum] = prev;
    // increase count
    cnum++;
    return idx;
  }
  // REMOVE: Delete
  // Destruct the Student whose ptr is at the supplied index
  // "Pull forward" every subsequent element, decrement Esa Size
  // Error if the supplied index >= array size. Return -1
  int remove(int idx){
    if(idx < 0 || idx >= cnum)
        return -1;
    Student* student = sap[idx];
    // pull forward
    for(int i = idx; i < cnum - 1; i++){
        sap[i] = sap[i + 1];
    }
    cnum--;
    delete student;
    return idx;
  }
  // APPEND:
  // Append the pointer of the supplied Student to back of the Esa, bump Esa
  // size Note: This may force a reallocation of the array. Return index # of
  // new entry on success
  int append(Student* student){
    // insert at last index
    return insert(student,cnum);
  }
  // PREPEND:
  // Prepend the pointer of the supplied Student to the front of the Esa,
  // decrement Esa size Note: This may force a reallocation of the array. Return
  // index # of new entry on success
  int prepend(Student* student){
    // insert at zero index
    return insert(student,0);
  }
};

