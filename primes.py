"""
TECHNICAL EVALUATION - VAUXOO
DEVELOPED BY:	HELI JESUS GONZALEZ TORRES
"""


class PrimeClass(object):
	"""
	Class used to determine if a number is prime.
	By definition, a number is prime only when it is a natural number
	greater than 1 that has no positive divisors other than 1 and itself.
	"""
	def is_prime(self, num_int):
		"""
		This is a method that returns TRUE if the number received how to
		parameter is prime, FALSE otherwise.
		"""		
		if num_int <= 1:
			return False
		prime_num = True
		for count in range(2, num_int):
			# If the division module is zero, then it is not prime.
			if (num_int % count) == 0:
				prime_num = False
				break
		return prime_num
