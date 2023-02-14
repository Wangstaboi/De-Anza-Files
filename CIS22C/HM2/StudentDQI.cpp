#pragma once
#include <iostream>
#include "StudentDQI.h"
#include "Student.h"


using namespace std;

    // 
    StudentDQI::StudentDQI(unsigned int s) {
        
        *(&soa) = new StudentEsa[s * 2];
        btm = s;
        top = s + 1;
        for (int i = 0; i < btm; i++) {
            
        }


    } // Create a DQ with this initial size 
    StudentDQI::StudentDQI(StudentDQI& s){

        *this = s;

    } // Equate this to an existing DQ (can use private parts directly)
    StudentDQI::~StudentDQI(){

        delete []soa;

    }; // Destruct the DQI (free OA space)

    int StudentDQI::getSize(){
        
        return top - btm;

    }  // Gets # elements (Student *) in the DQ
    bool StudentDQI::isEmpty(){

        if (top - btm == 1) {
            return true;
        } else return false;

    } // True if no elements held (�pop� will fail)

    int StudentDQI::pushFront(Student* s){

        
       btm--;

    } // Prepend a new element to the front
    Student* StudentDQI::popFront(){

       btm++; 

    }      // Remove the first element and return it
    Student* StudentDQI::lookFront(){

        return sa[btm];

    }      // Return the first element but do not remove it

    int StudentDQI::pushBack(Student*){
        
        top++;
    } // Append a new element to the back
    Student* StudentDQI::popBack(){

        top--;

    }    // Remove the last element and return it
    Student* StudentDQI::lookBack(){
        
        
        return sa[top];

    }     // Return the last element but do not remove it