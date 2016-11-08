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
        # your sum code here
		sum = 0
		for i in range(0,len(num_list)):
			sum += num_list[i]
		
        return sum		# Remove this dummy line

# Code section to test the class through a console
calculator = CalculatorClass()							# The class is instantiated
value = calculator.sum([1,2,3,4,5,6])					# Class method is called
print value												# Console output output
del calculator											# Instance is deleted
