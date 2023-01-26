

#include <iostream>
#include "Student.h"
#include "StudentEsa.h"

using namespace std;


    //Default Constructor
    StudentEsa::StudentEsa() {
      sap = nullptr;
      tp = nullptr;
      cnum = 0;
      cmz = 0;
    }

    StudentEsa::StudentEsa(StudentEsa& s) {
        *this = s;
    }

    StudentEsa::StudentEsa(int ms) {
        sap = new Student* [ms];
        cnum = 0; 
        tp = NULL;
        cmz = ms;

    }

    void StudentEsa::copy(StudentEsa& s) {
       

    }

    void StudentEsa::realloc() {
        tp = new Student* [cmz * 2];
        cmz *= 2;
    }

    StudentEsa::~StudentEsa() {



    }

    int StudentEsa::getNum() {
        return cnum; // done
    }

    Student* StudentEsa::get(int idx) {
        if ((idx < 0) || (idx >= cnum)) return (NULL); // Bad index
        return (sap[idx]); // Otherwise return Student ptr at that index in the array

    }

    int StudentEsa::set(Student* s, int idx) {
        if(idx < 0 || idx >= cnum) return -1;
        //delete sap[idx];
        sap[idx] = s;
        return idx;

    }
/**
    int insert(Student* s, int idx) {
        if (idx >= cmz) return -1;
        
        if (cnum == cmz) {
            realloc();
            for (int j = 0; j < idx; j++){
            tp[j] = sap[j];
        }
        }
        for (int i = cnum; i > idx; i--) {
            sap[i] = sap[i + 1];
        }

        sap[idx] = s;
        return 0;
    }
*/
    int StudentEsa::insert(Student* student, int idx){
    if(idx < 0 || idx >= cmz) return -1;

    if(cnum == cmz){
        // reallaoc
        realloc(); // allocate twice of previous size
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


    int StudentEsa::remove(int idx) {
        if (idx >= cmz || idx < 0) return -1;
        Student* student = sap[idx];
        for (int i = idx + 1; i < cnum; i++) {
            sap[i - 1] = sap[i];
        }
        cnum -= 1;
        return idx;
    }

    int StudentEsa::append(Student* s) {
        
       return insert(s, cnum);

    }
    
    int StudentEsa::prepend(Student* s) {
        
       return insert(s, 0);
    }





