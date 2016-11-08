"""
TECHNICAL EVALUATION - VAUXOO
DEVELOPED BY:	HELI JESUS GONZALEZ TORRES
"""


class CalculatorClass(object):
	"""
	Class used to calculate the sum of a list of numbers.
	"""
	def sum(self, num_list):
		"""
		Method to sum the list of numbers that is received in num_list
		"""
		varsum = 0
		for count in range(0, len(num_list)):
			varsum += num_list[count]
		return varsum
