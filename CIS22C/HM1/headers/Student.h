#pragma once
using namespace std;
#include <iostream>
#include <string>

class Student
{   // A VERY simple Student consisting only of the student's ID and Name
    // Both the interface and the code will be located here.
   
private:
    int sid; // Student ID
    string sname; // Full Name (Ex: KleinmanRon)

public:
    Student() { // Default constructor
        sid = 0; sname.clear();
    };
    Student(const Student& os) { // Copy constructor - overwrite internal variables
         sid = os.sid;  sname = os.sname;
    };
    Student(int id, string name) { // Initializer Constructor - set internal variables
        sid = id; sname = name;
    };
    ~Student() { // Default Destructor - clear string
        sname.clear();
    };

    //Getters 
    string getName() { return (sname); };
    int getId() { return (sid); };
};