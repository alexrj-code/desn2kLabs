extern int max_of_6 (int a, int b, int c, int d, int e, int f);

int main(void) {
	
	int alpha, beta, gamma, delta, sigma, theta;
	int largest;
	
	alpha = 45;
	
	beta = 32;
	
	gamma = 1;
	
	delta = 93;
	
	sigma = -10;

	theta = 128;
	
	//should return the largest number of 6
	largest = max_of_6(alpha, beta, gamma, delta, sigma, theta);
	
	return largest;
}
