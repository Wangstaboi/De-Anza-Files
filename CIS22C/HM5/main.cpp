#include <iostream>
#include <vector>
#include <ctime>
#include <cstdlib>
#include <algorithm>


#include "ESI.h"
#include "sItem.h"
#include "siDset.h"
#include "test_framework.h"

using namespace std;




int main()
{
cout << "Homework 5" <<endl;

siDset<size_t> dummy(0);

bool result = test_framework(10, 10);

if (result) return 0; else return 1;
}
