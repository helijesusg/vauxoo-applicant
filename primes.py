"""
TECHNICAL EVALUATION - VAUXOO

DEVELOPED BY:	HELI JESUS GONZALEZ TORRES
"""


class PrimeClass(object):
    """
    Class used to determine if a number is prime.
	
	By definition, a number is prime only when it is a natural number greater than 1 that has no positive divisors other than 1 and itself.
    """
	
    def is_prime(self, num_int):
        """
        This is a method that returns TRUE if the number received how to parameter is prime, FALSE otherwise.
        """
        # your primes code here
		if num_int <= 1:
			return False
		
		prime_num = True
		for i in range(2,num_int):
			if (num_int % i) == 0:	# If the division module is zero, then it is not prime.
				prime_num = False
				break
		
		return prime_num	# Remove this dummy line