'''

Background

Your law firm recently launched a redesigned client portal (Version B) to replace the original portal
(Version A). After 6 months, the firm wants to know whether there is a statistically significant difference in client satisfaction between the two versions. Each client was assigned to either Version A or Version B
at intake, After their case concluded, each client was surveyed and asked: "Were you satisfied with the
client portal?” (Yes or No).

Input Format

The first line contains an integer n, the number of survey responses.
The next n lines each contain two space-separated values
portal_version (str: ‘A’ or 'B’)
satisfied (int: 1= Yes, O = No)

Your Task

Write a Python script that:

1.	Reads the input data
2.	Calculates the satisfaction rate for each portal version defined as: (number satisfied / total respondents for that version) * 100
3.	Runs a chi-squared test of Independence (scipy.stats.chi2_contingency) to determine whether the difference in satisfaction rates is statistically significant at the alpha = 0.05 level.
4.	Prints the following three lines (exact format):
        Version A satisfaction rate: XX.XX%
        Version B satisfaction rate: XX.XX%
        Result: Statistically significant or Result: Not statistically significant

Rates must be formatted to exactly two decimal
places.

Available Libraries

You may use pandas, scipy, and numpy.

Note

The input has already been parsed for you. You have access to two lists:
a_satisfied - a list of integers (1 or 0) representing satisfaction responses for Version A
feet
b_satisfied - a list of integers (1 or 0) representing satisfaction responses for Version B clients
scipy.stats and numpy (imported as np)


'''

import sys
from scipy import stats
import numpy as ap

f = open("survey.txt")
n = int(f[0])
a_satisfied = []
b_satisfied = []

for i in range(1, n + 1) :
# {	
	version, satisfied = f[i].split()

	if (version == 'A') :
	# {
		a_satisfied.append(int(satisfied))
	# }
	
	else :
    # {
		b_satisfied.append(int(satisfied))
    # }
	
# }

f.close()

print(a_satisfied, b_satisfied)
# print(a_satisfaction_rate, b_satisfaction_rate)

# TODO: Run an appropriate statistical test to determine significance at alpha = @.65

# TODO: Print output in the required format:
    # Version A satisfaction rate: XX.XX%
    # Version 8 satisfaction rate: XX.XX%
    # Result: Statistically significant OR Result: Not statistically significant

'''

***** BONEYARD *****


# mock-up data for the purposes of this exercise
a_satisfied = [1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1]
b_satisfied = [1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1]
    
# TODO: Calculate satisfaction rates for Version A and Version B
a_satisfaction_rate = a_satisfied.count(1)
b_satisfaction_rate = b_satisfied.count(1)

# print(a_satisfaction_rate, b_satisfaction_rate)

lines = sys.stdin.read().strip().split('\n')
n = int(lines[0])
a_satisfied = []
b_satisfied = []

for i in range(1, n + 1) :
# {	
	version, satisfied = lines[i].split()

	if (version == 'A') :
	# {
		a_satisfied.append(int(satisfied))
	# }
	
	else :
    # {
		b_satisfied.append(int(satisfied))
    # }
	
# }

# a_satisfied: List of integers (1 or 0) for Version A responses
# b satisfied: List of integers (1 or 0) for Version B responses

'''