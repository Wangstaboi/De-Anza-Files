#pragma once

#include <iostream>
#include <algorithm>
#include "Student.h"

using namespace std;

class StudentEsa
{
private:
    Student* *sap; // pointer to array of student pointers
    Student* *tp; // Use in realloc?
    int cnum; // num of students
    int cmz; // current max size of array
    int n; // returns min value of 2 compared ints
public:
    //Default Constructor
    StudentEsa() {
      
    
    }

    StudentEsa(StudentEsa& s) {
        cnum = s.cnum;
        Student *p = new Student[cmz];
       
    }

    StudentEsa(int ms) {
        sap = new (Student* [cmz = ms]);
        cnum = 0; tp = NULL;

    }

    void copy(StudentEsa& s) {
       

    }

    ~StudentEsa() {

        delete sap;

    }

    int getNum() {
        return cnum; // done
    }

    Student* get(int idx) {
        if ((idx < 0) || (idx >= cnum)) return (NULL); // Bad index
        return (sap[idx]); // Otherwise return Student ptr at that index in the array

    }

    int set(Student* s, int idx) {
        if (cnum + 1 > cmz) {
            cmz *= 2;
            StudentEsa(cmz);

        } 

    }

    int insert(Student* s, int idx) {
        if (idx >= cmz) return -1;
        if (cnum + 1 > cmz) {
            cmz *= 2;
            StudentEsa(cmz);
        }
        for (int i = cnum; i > idx; i--) {
            sap[i] = sap[i + 1];
        }

        sap[idx] = s;
        return 0;
    }

    int remove(int idx) {
        if (idx >= cmz) return -1;
        for (int i = idx + 1; i < cnum; i++) {
            sap[i - 1] = sap[i];
        }
        return 0;
    }

    int append(Student* s) {
        if (cnum + 1 > cmz) {
            cmz *= 2;
            StudentEsa(cmz);
        }
        sap[cnum] = s;

    }
    
    int prepend(Student* s) {
         if (cnum + 1 > cmz) {
            cmz *= 2;
            StudentEsa(cmz);
        }
        for (int i = cnum; i > 1; i--) {
            sap[i + 1] = sap[i];
        }
        sap[0] = s;
    }
};




