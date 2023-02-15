//Ryan Wang - CIS22C - StudentEsa.cpp

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

    //Copy Constructor
    StudentEsa::StudentEsa(StudentEsa& s) {
        *this = s;
    }

    
    StudentEsa::StudentEsa(int ms) {
        sap = new Student* [ms];
        cnum = 0; 
        tp = NULL;
        cmz = ms;

    }

    //too lazy to delete from header and this file
    void StudentEsa::copy(StudentEsa& s) {
       

    }

    // Reusable realloc function. Creates new array of student pointers that is double size of previous, assigns to tp
    void StudentEsa::realloc() {
        tp = new Student* [cmz * 2];
        cmz *= 2;
    }

    //Destructor 
    StudentEsa::~StudentEsa() {

        delete sap;

    }

    // Returns num of students
    int StudentEsa::getNum() {
        return cnum; 
    }

    //Returns student at given index
    Student* StudentEsa::get(int idx) {
        if ((idx < 0) || (idx > cnum)) {
            cout << "Nope. Didn't work." << endl;
            return (NULL);
            } // Bad index
        //cout << *(&sap[idx]) << endl;
        return (sap[idx]); // Otherwise return Student ptr at that index in the array

    }

    //Replaces student at given index with a user-supplied student
    int StudentEsa::set(Student* s, int idx) {
        if(idx < 0 || idx >= cnum) return -1; //Return error on invalid index
        //delete sap[idx];
        sap[idx] = s; //replaces/reassigns student at given index with user supplied student
        return idx;

    }

    //Inserts a new student in given index, pushes back subsequent students in array, and if necessary reallocs.
    int StudentEsa::insert(Student* student, int idx){
       // cout << "Does this even run " << "Index: " << idx << " Array Size: " << cmz << endl;
    if(idx < 0 || idx > cnum) {
       // cout << "Please don't print" << endl;
        return -1;
    }

// Reallocs and pushes back if number of students reaches size of array
    if(cnum == cmz){
       realloc(); // allocate twice of previous size

        for(int i = 0; i < idx; i++){
            tp[i] = sap[i]; //copies sap to tp
        }

        tp[idx] = student; 

        for(int i = idx; i < cnum; i++){
            tp[i + 1] = sap[i]; 
        }
        sap = tp;
        tp = NULL;
        cnum++;
        
        return idx;
    }

    // Inserting user given student into user given index, and pushing back all subsequent elements
    Student* prev = student;
    for(int i = idx; i < cnum; i++){
        Student* temp = sap[i];
        sap[i] = prev;
        prev = temp;
    }
    sap[cnum] = prev; //Makes sure last element gets updated
   
    cnum++; // Since a student has been added, cnum is incremented (1 more student in cnum)
   // cout << cnum << endl;
    return idx;
  }

    //Removes a student from an array by shifting all students after down 1
    int StudentEsa::remove(int idx) {
        if (idx >= cnum || idx < 0) return -1; //Return error for invalid index
        Student* student = sap[idx];    //student pointer pints to array sap at index idx
        //Loop shifts everything down 1. This will overwrite the Student at the given index, therefore removing it
        for (int i = idx + 1; i < cnum; i++) {
            sap[i - 1] = sap[i];
        }
        cnum -= 1; // decrement cnum, because we just removed a student
        return idx;
    }

    //Calls the insert function but index is cnum (last occupied index)
    int StudentEsa::append(Student* s) {
        
       return insert(s, cnum); //appending is just inserting but at the last element of an array

    }
    
    //Calls insert function but index is at beginning of array
    int StudentEsa::prepend(Student* s) {
        
       return insert(s, 0); //Prepending is just inserting at the start of an array
    }





