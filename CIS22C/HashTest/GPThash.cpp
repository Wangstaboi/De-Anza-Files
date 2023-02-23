
#include <iostream>

using namespace std;


int main() {
   double dataValue;
    int numCounts = 0;
   //cin >> dataValue;

   while (cin >> dataValue && dataValue !== 0)
   {
    if (dataValue > -35.0 && dataValue < 40.0) {
        numCounts++;   
    }

cout << "Number of floating-point numbers read: " << numCounts << endl;
   return 0;
}
//cout << "Number of floating-point numbers read: " << numCounts << endl;
}
//Input: -25.7 -30.9 -49.6 -34.3 -24.0 -34.6 -31.3 -28.5

//Expected Output: 3