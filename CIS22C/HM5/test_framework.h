#ifndef TEST_FRAMEWORK_H_INCLUDED
#define TEST_FRAMEWORK_H_INCLUDED

#include <vector>
#include <string>

#include "sItem.h"
#include "siDset.h"

bool test_framework(const size_t A_MAX, const size_t B_MAX) {


    std::vector<int> a( A_MAX / 2);
    std::vector<int> b( B_MAX / 2);
    std::vector<int> common( B_MAX / 2 );

    for ( size_t j = 0; j < B_MAX / 2 ; ++j ) common[j] = rand() % 1000;
        sort(common.begin(), common.end() );

    std::cout << "Common " << std::endl;
    for ( size_t j = 0; j < B_MAX / 2; ++j ) std::cout << common[j] << '\n';


    for ( size_t i = 0; i < A_MAX / 2; ++i ) a[i] = rand() % 1000;
        //sort( a.begin(), a.end() );


    for ( size_t j = 0; j < B_MAX / 2; ++j ) b[j] = rand() % 1000;
        //sort(b.begin(), b.end() );

    for (size_t elem : common) {
        a.push_back(elem);
        b.push_back(elem);
    }

    sort(a.begin(), a.end() );
    sort(b.begin(), b.end() );

    std::string dummy_a;
    std::cout << "A: ";   getline( std::cin, dummy_a );
    for ( size_t i = 0; i < A_MAX; ++i ) std::cout << a[i] << '\n';

    std::string dummy_b;
    std::cout << "B: "; getline( std::cin, dummy_b );
    for ( size_t j = 0; j < B_MAX; ++j ) std::cout << b[j] << '\n';



    siDset<size_t> deAnza(A_MAX);
    for ( size_t i = 0; i < A_MAX; ++i ) {
        sItem<size_t> *tmp = new sItem<size_t>;
        tmp->id = a[i];
        tmp->thing = nullptr;
        deAnza.append(tmp);



    }

    std::cout << "Printing DeAnza:" <<std::endl;
    for ( size_t i = 0; i < A_MAX; ++i ) {
        std::cout << (deAnza.get(i))->id << "\t";
    }
    std::cout << std::endl;

    siDset<size_t> footHill(B_MAX);
    for ( size_t i = 0; i < B_MAX; ++i ) {
        sItem<size_t> *tmp = new sItem<size_t>;
        tmp->id = b[i];
        tmp->thing = nullptr;
        footHill.append(tmp);


    }
    std::cout << "Printing footHill:" <<std::endl;
    for ( size_t i = 0; i < B_MAX; ++i ) {
        std::cout << (footHill.get(i))->id << "\t";
    }
    std::cout << std::endl;

    std::cout << "Printing deAnza_footHill_union:" <<std::endl;
    siDset<size_t> *deAnza_footHill_union = deAnza.my_union(&footHill);
    for (size_t i = 0; i < deAnza_footHill_union->getNum(); ++i) {
        std::cout << (deAnza_footHill_union->get(i))->id << "\t";

    }
    std::cout << std::endl;

    return true;



}

#endif // TEST_FRAMEWORK_H_INCLUDED
