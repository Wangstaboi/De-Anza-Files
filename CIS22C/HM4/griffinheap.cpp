hItem* MaxHeap::look() const {
	if (hmax == 0) {
		return NULL; // no data found in the queue
	} else {
		return ehi[0]; //As mentioned in the question, no pop required not writing the logic for pop
	}
}

hItem* MaxHeap::pop() {
	hItem *popItem = NULL;
	if (hmax > 0) {
		popItem = ehi[0];
		//after pop ing it out, move the last node to the root and rebalance it.
		ehi[0] = ehi[hmax - 1];
		rebalanceTree(0);
	} else {
		cout << "No data Found";
	}
	return popItem;
}

void MaxHeap::rebalanceTree(int i) { 40
	int left = 2 * i + 1;
	int right = 2 * i + 2;
	int smallest = i;

	//find the smallest amont the 3
	if (left < hmax && ehi[left] < ehi[smallest]) {
		smallest = left;
	} else if (right < hmax && ehi[right] < ehi[smallest]) {
		smallest = right;
	}

	if(smallest != i) {
		hItem* smallestNode = ehi->get(smallest);
		hItem* currentNode = ehi->get(i);
		//swap
		ehi->set(i, smallestNode);
		ehi->set(smallest, currentNode);
		// call recursively untill smallest node set in correct location
		rebalanceTree(smallest);
	}

}