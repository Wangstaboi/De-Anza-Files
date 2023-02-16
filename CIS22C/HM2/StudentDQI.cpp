/**
 * Name: Ryan Wang
 * Date: 2/15/23
 * HM2 - StudentDQI.cpp
 * 
*/

#pragma once
#include <iostream>
#include "StudentDQI.h"
#include "Student.h"


using namespace std;

    // TODO: Initialize ESA with 2 times size of s and fill halfway with nullptr
    // Confused af as to how to do
    StudentDQI::StudentDQI(unsigned int s) {
        
        
        soa = new StudentEsa(s * 2); 
        //tp = soa;
        back = s + 1;
        front = s;
        // Loop till btm and fill with nullptr?
        for (int i = 0; i <= front; i++) {
            soa->append(nullptr);
            
        } 



    } // Create a DQ with this initial size 
    StudentDQI::StudentDQI(StudentDQI& s){

        *this = s;

    } // Equate this to an existing DQ (can use private parts directly)
    StudentDQI::~StudentDQI(){

        delete soa; // Previously delete[] soa

    }; // Destruct the DQI (free OA space)

    int StudentDQI::getSize(){
        
        return (back - front) - 1;

    }  // Gets # elements (Student *) in the DQ
    bool StudentDQI::isEmpty(){

        if (back - front == 1) {
            return true;
        } else return false;

    } // True if no elements held (�pop� will fail)

    int StudentDQI::pushFront(Student* s){

       //*(soa[btm]) = s; 
       //front--;
    //    if (soa->set(s, front) == -1) {
    //     cout << "Error!" << endl;
    //     cout << soa->getNum() << endl;
    //    };
        soa->set(s, front );
        front--;

       return 0;

    } // Prepend a new element to the front
    Student* StudentDQI::popFront(){
        if (isEmpty()) {
            return nullptr;
        }
        Student* first = soa->get(front + 1);
        
        
        soa->set(nullptr, front + 1);
        front++;
        // if (first == nullptr) {
        //     cout << "Woops, we got a nullptr!" << endl;
        // }
        
        
       return first;

    }      // Remove the first element and return it
    Student* StudentDQI::lookFront(){

        //soa[btm]->get(btm);
        return soa->get(front + 1);

    }      // Return the first element but do not remove it

    int StudentDQI::pushBack(Student* s){
        
        soa->append(s);
        back++;
    
        return back;
    } // Append a new element to the back
    Student* StudentDQI::popBack(){
        if (isEmpty()) {
           // cout << "Hi mom" << endl;
            return nullptr;
        }
        Student* last = soa->get(back - 1);
        //soa->remove(back);
        back--;
        soa->set(nullptr, back);
        // if (last == nullptr) {
        //     cout << "Hi dad" << endl;
        // }
        return last;

    }    // Remove the last element and return it
    Student* StudentDQI::lookBack(){
        //cout << back << endl;
        return soa->get(back - 1);

    }     // Return the last element but do not remove it