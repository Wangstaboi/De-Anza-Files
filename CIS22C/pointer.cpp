#include <iostream>
#include <iomanip>
#include <string>


using namespace std;

int allocateArr(int length, int **arr);
int freeArr(int **arr);


int main()
{
  int err; 

  // get length from user
  int length;
  cout << "Enter a positive integer greater than 0" << endl;
  cin >> length;

  // allocate arr
  int *arr; 
  err = allocateArr(length, &arr);
  if (err) return err; 

  // use arr somehow 
  for (int i = 0; i < length; i++) {
    arr[i] = rand() % 100;
    cout << arr[i] << endl;
  }
  // free arr 
  err = freeArr(&arr);
  cout << *arr << endl;
  if (err) return err; 

  // clean exit code
  return 0;
}


int allocateArr(int length, int **arr) 
{
    *arr = new int[length];
    
    return 0;
}

int freeArr(int** arr) {

    delete[] *arr;

    return 0;

}