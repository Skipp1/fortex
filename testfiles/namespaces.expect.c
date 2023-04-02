	#include <stdio.h>
	#include <math.h>
	static double mynamespace_calculate_pi(void) {
		double retval = 0;
		for (int i=0; i < 20; i++) {
			retval += pow(-1, i) / (2 * (double)i + 1);
		}
		return 4 * retval;
	}
	int main(void) {
		printf("%g\n", mynamespace_calculate_pi());
		return 0;
	}
