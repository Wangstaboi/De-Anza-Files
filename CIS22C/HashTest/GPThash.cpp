// GPT Hash Table



#include <iostream>
#include <string>

using namespace std;

// Define a struct to hold key-value pairs
struct KeyValuePair {
    string key;
    int value;
    KeyValuePair* next;

    KeyValuePair(string k, int v) {
        key = k;
        value = v;
        next = nullptr;
    }
};

// Define a hash table class
class HashTable {
private:
    int tableSize;
    KeyValuePair** table;

    // Hash function to map a key to an index in the table
    int hashFunction(string key) {
        int hash = 0;
        for (int i = 0; i < key.size(); i++) {
            hash += key[i];
        }
        return hash % tableSize;
    }

public:
    // Constructor to create a hash table with the specified size
    HashTable(int size) {
        tableSize = size;
        table = new KeyValuePair*[tableSize];
        for (int i = 0; i < tableSize; i++) {
            table[i] = nullptr;
        }
    }

    // Insert a key-value pair into the hash table
    void insert(string key, int value) {
        int index = hashFunction(key);
        KeyValuePair* node = new KeyValuePair(key, value);

        if (table[index] == nullptr) {
            table[index] = node;
        } else {
            KeyValuePair* curr = table[index];
            while (curr->next != nullptr) {
                curr = curr->next;
            }
            curr->next = node;
        }
    }

    // Get the value associated with a key in the hash table
    // Returns -1 if the key is not found
    int get(string key) {
        int index = hashFunction(key);

        KeyValuePair* curr = table[index];
        while (curr != nullptr) {
            if (curr->key == key) {
                return curr->value;
            }
            curr = curr->next;
        }

        return -1;
    }

    // Remove a key-value pair from the hash table
    void remove(string key) {
        int index = hashFunction(key);

        if (table[index] == nullptr) {
            return;
        }

        if (table[index]->key == key) {
            KeyValuePair* temp = table[index];
            table[index] = table[index]->next;
            delete temp;
            return;
        }

        KeyValuePair* curr = table[index];
        while (curr->next != nullptr) {
            if (curr->next->key == key) {
                KeyValuePair* temp = curr->next;
                curr->next = curr->next->next;
                delete temp;
                return;
            }
            curr = curr->next;
        }
    }

    // Destructor to free memory
    ~HashTable() {
        for (int i = 0; i < tableSize; i++) {
            KeyValuePair* curr = table[i];
            while (curr != nullptr) {
                KeyValuePair* temp = curr;
                curr = curr->next;
                delete temp;
            }
        }
        delete[] table;
    }
};

int main() {
    // Example usage
    HashTable ht(10);

    ht.insert("apple", 5);
    ht.insert("banana", 7);
    ht.insert("orange", 3);

    cout << ht.get("apple") << endl;  // 5
    cout << ht.get("banana") << endl; // 7
    cout << ht.get("orange") << endl; // 3

    ht.remove("banana");

    cout << ht.get("apple") << endl;
}