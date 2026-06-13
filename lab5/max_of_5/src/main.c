extern int max_of_5 (int a, int b, int c, int d, int e);

int main(void) {
	
	int alpha, beta, gamma, delta, sigma;
	int largest;
	
	alpha = 45;
	
	beta = 32;
	
	gamma = 1;
	
	delta = 93;
	
	sigma = -10;
	
	//should return the largest number of 5
	largest = max_of_5(alpha, beta, gamma, delta, sigma);
	
	return largest;
}
