#pragma once
#include <iostream>
#include "StudentDQI.h"
#include "Student.h"


using namespace std;

    StudentDQI::StudentDQI(unsigned int s) {

    } // Create a DQ with this initial size 
    StudentDQI::StudentDQI(StudentDQI& s){

    } // Equate this to an existing DQ (can use private parts directly)
    StudentDQI::~StudentDQI(){

    }; // Destruct the DQI (free OA space)

    int StudentDQI::getSize(){

    }  // Gets # elements (Student *) in the DQ
    bool StudentDQI::isEmpty(){

    } // True if no elements held (�pop� will fail)

    int StudentDQI::pushFront(Student*){

    } // Prepend a new element to the front
    Student* StudentDQI::popFront(){

    }      // Remove the first element and return it
    Student* StudentDQI::lookFront(){

    }      // Return the first element but do not remove it

    int StudentDQI::pushBack(Student*){

    } // Append a new element to the back
    Student* StudentDQI::popBack(){

    }    // Remove the last element and return it
    Student* StudentDQI::lookBack(){

        
    }     // Return the last element but do not remove it