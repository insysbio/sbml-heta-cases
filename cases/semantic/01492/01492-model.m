(*

category:        Test
synopsis:        Nested piecewise in function definitions.
componentTags:   AssignmentRule, FunctionDefinition, Parameter, RateRule
testTags:        InitialValueReassigned, NonConstantParameter
testType:        TimeCourse
levels:          2.1, 2.2, 2.3, 2.4, 2.5, 3.1, 3.2
generatedBy:     Analytic
packagesPresent: 

 This model has a nested 'piecewise' function, with the nested piecewise in the 'returned value' part of the function.  This tests tests these constructs in function definitions.

The model contains:
* 3 parameters (z, y, x)

There are 3 rules:

[{width:30em,margin: 1em auto}|  *Type*  |  *Variable*  |  *Formula*  |
| Assignment | z | $my_piecewise(my_piecewise(2, my_gt(y, 1.49), 1), my_lteq(x, 0.49), 0)$ |
| Rate | y | $-2$ |
| Rate | x | $1$ |]

The model contains the following function definitions:

[{width:30em,margin: 1em auto}|  *Id*  |  *Arguments*  |  *Formula*  |
 | my_piecewise | x, y, z | $piecewise(x, y, z)$ |
 | my_gt | x, y | $x > y$ |
 | my_lteq | x, y | $x <= y$ |
]
The initial conditions are as follows:

[{width:35em,margin: 1em auto}|       | *Value* | *Constant* |
| Initial value of parameter z | $my_piecewise(my_piecewise(2, my_gt(y, 1.49), 1), my_lteq(x, 0.49), 0)$ | variable |
| Initial value of parameter y | $2$ | variable |
| Initial value of parameter x | $0$ | variable |]

Note: The test data for this model was generated from an analytical
solution of the system of equations.

*)
