(*

category:        Test
synopsis:        Uncommon MathML used in event priorities.
componentTags:   CSymbolTime, EventNoDelay, EventPriority, Parameter
testTags:        NonConstantParameter, UncommonMathML
testType:        TimeCourse
levels:          3.1, 3.2
generatedBy:     Analytic
packagesPresent: 

 The model tests the various unusual mathematical constructs in event priorities, essentially comparing them to 0.55 to see which is greater.

The model contains:
* 53 parameters (P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P31, P32, P33, P34, P35, P36, P37, P38, P39, P40, P41, P42, P43, P44, P45, P46, P47, P48, P49, P50, P51, P52)

There are 106 events:

[{width:35em,margin: 1em auto}|  *Event*  |  *Trigger*  |  *Priority*  | *Event Assignments* |
| E0 | $time > 1.5$ | $exponentiale$ | $P0 = 2$ |
| E1 | $time > 1.5$ | $exp(exponentiale)$ | $P1 = 2$ |
| E2 | $time > 1.5$ | $abs(-1)$ | $P2 = 2$ |
| E3 | $time > 1.5$ | $abs(1)$ | $P3 = 2$ |
| E4 | $time > 1.5$ | $acos(-1)$ | $P4 = 2$ |
| E5 | $time > 1.5$ | $acos(0.5)$ | $P5 = 2$ |
| E6 | $time > 1.5$ | $asin(1)$ | $P6 = 2$ |
| E7 | $time > 1.5$ | $asin(-0.5)$ | $P7 = 2$ |
| E8 | $time > 1.5$ | $atan(2.8)$ | $P8 = 2$ |
| E9 | $time > 1.5$ | $atan(-7.09)$ | $P9 = 2$ |
| E10 | $time > 1.5$ | $ceil(0.5)$ | $P10 = 2$ |
| E11 | $time > 1.5$ | $ceil(3.55)$ | $P11 = 2$ |
| E12 | $time > 1.5$ | $ceil(-4.6)$ | $P12 = 2$ |
| E13 | $time > 1.5$ | $cos(9.1)$ | $P13 = 2$ |
| E14 | $time > 1.5$ | $cos(-0.22)$ | $P14 = 2$ |
| E15 | $time > 1.5$ | $exp(0)$ | $P15 = 2$ |
| E16 | $time > 1.5$ | $exp(1)$ | $P16 = 2$ |
| E17 | $time > 1.5$ | $exp(0.77)$ | $P17 = 2$ |
| E18 | $time > 1.5$ | $floor(-4.6)$ | $P18 = 2$ |
| E19 | $time > 1.5$ | $floor(9.1)$ | $P19 = 2$ |
| E20 | $time > 1.5$ | $ln(0.2)$ | $P20 = 2$ |
| E21 | $time > 1.5$ | $ln(1)$ | $P21 = 2$ |
| E22 | $time > 1.5$ | $log10(0.2)$ | $P22 = 2$ |
| E23 | $time > 1.5$ | $log10(1)$ | $P23 = 2$ |
| E24 | $time > 1.5$ | $1^2$ | $P24 = 2$ |
| E25 | $time > 1.5$ | $2^2$ | $P25 = 2$ |
| E26 | $time > 1.5$ | $1.4^5.1$ | $P26 = 2$ |
| E27 | $time > 1.5$ | $4^2$ | $P27 = 2$ |
| E28 | $time > 1.5$ | $3.1^2$ | $P28 = 2$ |
| E29 | $time > 1.5$ | $sqrt(4)$ | $P29 = 2$ |
| E30 | $time > 1.5$ | $sqrt(7.4)$ | $P30 = 2$ |
| E31 | $time > 1.5$ | $sin(2.1)$ | $P31 = 2$ |
| E32 | $time > 1.5$ | $sin(0)$ | $P32 = 2$ |
| E33 | $time > 1.5$ | $sin(-5.9)$ | $P33 = 2$ |
| E34 | $time > 1.5$ | $tan(0)$ | $P34 = 2$ |
| E35 | $time > 1.5$ | $tan(1.11)$ | $P35 = 2$ |
| E36 | $time > 1.5$ | $tan(-6)$ | $P36 = 2$ |
| E37 | $time > 1.5$ | $sec(0.5)$ | $P37 = 2$ |
| E38 | $time > 1.5$ | $csc(4.5)$ | $P38 = 2$ |
| E39 | $time > 1.5$ | $cot(0.2)$ | $P39 = 2$ |
| E40 | $time > 1.5$ | $sinh(0.3)$ | $P40 = 2$ |
| E41 | $time > 1.5$ | $cosh(1.7)$ | $P41 = 2$ |
| E42 | $time > 1.5$ | $arcsec(2.3)$ | $P42 = 2$ |
| E43 | $time > 1.5$ | $arccsc(1.1)$ | $P43 = 2$ |
| E44 | $time > 1.5$ | $arccot(-0.1)$ | $P44 = 2$ |
| E45 | $time > 1.5$ | $arcsinh(99)$ | $P45 = 2$ |
| E46 | $time > 1.5$ | $arccosh(1.34)$ | $P46 = 2$ |
| E47 | $time > 1.5$ | $arctanh(-0.7)$ | $P47 = 2$ |
| E48 | $time > 1.5$ | $arcsech(0.42)$ | $P48 = 2$ |
| E49 | $time > 1.5$ | $arccsch(0.01)$ | $P49 = 2$ |
| E50 | $time > 1.5$ | $arccoth(8.2)$ | $P50 = 2$ |
| E51 | $time > 1.5$ | $times()$ | $P51 = 2$ |
| E52 | $time > 1.5$ | $plus()$ | $P52 = 2$ |
| Ep0 | $time > 1.5$ | $0.55$ | $P0 = 3$ |
| Ep1 | $time > 1.5$ | $0.55$ | $P1 = 3$ |
| Ep2 | $time > 1.5$ | $0.55$ | $P2 = 3$ |
| Ep3 | $time > 1.5$ | $0.55$ | $P3 = 3$ |
| Ep4 | $time > 1.5$ | $0.55$ | $P4 = 3$ |
| Ep5 | $time > 1.5$ | $0.55$ | $P5 = 3$ |
| Ep6 | $time > 1.5$ | $0.55$ | $P6 = 3$ |
| Ep7 | $time > 1.5$ | $0.55$ | $P7 = 3$ |
| Ep8 | $time > 1.5$ | $0.55$ | $P8 = 3$ |
| Ep9 | $time > 1.5$ | $0.55$ | $P9 = 3$ |
| Ep10 | $time > 1.5$ | $0.55$ | $P10 = 3$ |
| Ep11 | $time > 1.5$ | $0.55$ | $P11 = 3$ |
| Ep12 | $time > 1.5$ | $0.55$ | $P12 = 3$ |
| Ep13 | $time > 1.5$ | $0.55$ | $P13 = 3$ |
| Ep14 | $time > 1.5$ | $0.55$ | $P14 = 3$ |
| Ep15 | $time > 1.5$ | $0.55$ | $P15 = 3$ |
| Ep16 | $time > 1.5$ | $0.55$ | $P16 = 3$ |
| Ep17 | $time > 1.5$ | $0.55$ | $P17 = 3$ |
| Ep18 | $time > 1.5$ | $0.55$ | $P18 = 3$ |
| Ep19 | $time > 1.5$ | $0.55$ | $P19 = 3$ |
| Ep20 | $time > 1.5$ | $0.55$ | $P20 = 3$ |
| Ep21 | $time > 1.5$ | $0.55$ | $P21 = 3$ |
| Ep22 | $time > 1.5$ | $0.55$ | $P22 = 3$ |
| Ep23 | $time > 1.5$ | $0.55$ | $P23 = 3$ |
| Ep24 | $time > 1.5$ | $0.55$ | $P24 = 3$ |
| Ep25 | $time > 1.5$ | $0.55$ | $P25 = 3$ |
| Ep26 | $time > 1.5$ | $0.55$ | $P26 = 3$ |
| Ep27 | $time > 1.5$ | $0.55$ | $P27 = 3$ |
| Ep28 | $time > 1.5$ | $0.55$ | $P28 = 3$ |
| Ep29 | $time > 1.5$ | $0.55$ | $P29 = 3$ |
| Ep30 | $time > 1.5$ | $0.55$ | $P30 = 3$ |
| Ep31 | $time > 1.5$ | $0.55$ | $P31 = 3$ |
| Ep32 | $time > 1.5$ | $0.55$ | $P32 = 3$ |
| Ep33 | $time > 1.5$ | $0.55$ | $P33 = 3$ |
| Ep34 | $time > 1.5$ | $0.55$ | $P34 = 3$ |
| Ep35 | $time > 1.5$ | $0.55$ | $P35 = 3$ |
| Ep36 | $time > 1.5$ | $0.55$ | $P36 = 3$ |
| Ep37 | $time > 1.5$ | $0.55$ | $P37 = 3$ |
| Ep38 | $time > 1.5$ | $0.55$ | $P38 = 3$ |
| Ep39 | $time > 1.5$ | $0.55$ | $P39 = 3$ |
| Ep40 | $time > 1.5$ | $0.55$ | $P40 = 3$ |
| Ep41 | $time > 1.5$ | $0.55$ | $P41 = 3$ |
| Ep42 | $time > 1.5$ | $0.55$ | $P42 = 3$ |
| Ep43 | $time > 1.5$ | $0.55$ | $P43 = 3$ |
| Ep44 | $time > 1.5$ | $0.55$ | $P44 = 3$ |
| Ep45 | $time > 1.5$ | $0.55$ | $P45 = 3$ |
| Ep46 | $time > 1.5$ | $0.55$ | $P46 = 3$ |
| Ep47 | $time > 1.5$ | $0.55$ | $P47 = 3$ |
| Ep48 | $time > 1.5$ | $0.55$ | $P48 = 3$ |
| Ep49 | $time > 1.5$ | $0.55$ | $P49 = 3$ |
| Ep50 | $time > 1.5$ | $0.55$ | $P50 = 3$ |
| Ep51 | $time > 1.5$ | $0.55$ | $P51 = 3$ |
| Ep52 | $time > 1.5$ | $0.55$ | $P52 = 3$ |]

The initial conditions are as follows:

[{width:35em,margin: 1em auto}|       | *Value* | *Constant* |
| Initial value of parameter P0 | $0$ | variable |
| Initial value of parameter P1 | $0$ | variable |
| Initial value of parameter P2 | $0$ | variable |
| Initial value of parameter P3 | $0$ | variable |
| Initial value of parameter P4 | $0$ | variable |
| Initial value of parameter P5 | $0$ | variable |
| Initial value of parameter P6 | $0$ | variable |
| Initial value of parameter P7 | $0$ | variable |
| Initial value of parameter P8 | $0$ | variable |
| Initial value of parameter P9 | $0$ | variable |
| Initial value of parameter P10 | $0$ | variable |
| Initial value of parameter P11 | $0$ | variable |
| Initial value of parameter P12 | $0$ | variable |
| Initial value of parameter P13 | $0$ | variable |
| Initial value of parameter P14 | $0$ | variable |
| Initial value of parameter P15 | $0$ | variable |
| Initial value of parameter P16 | $0$ | variable |
| Initial value of parameter P17 | $0$ | variable |
| Initial value of parameter P18 | $0$ | variable |
| Initial value of parameter P19 | $0$ | variable |
| Initial value of parameter P20 | $0$ | variable |
| Initial value of parameter P21 | $0$ | variable |
| Initial value of parameter P22 | $0$ | variable |
| Initial value of parameter P23 | $0$ | variable |
| Initial value of parameter P24 | $0$ | variable |
| Initial value of parameter P25 | $0$ | variable |
| Initial value of parameter P26 | $0$ | variable |
| Initial value of parameter P27 | $0$ | variable |
| Initial value of parameter P28 | $0$ | variable |
| Initial value of parameter P29 | $0$ | variable |
| Initial value of parameter P30 | $0$ | variable |
| Initial value of parameter P31 | $0$ | variable |
| Initial value of parameter P32 | $0$ | variable |
| Initial value of parameter P33 | $0$ | variable |
| Initial value of parameter P34 | $0$ | variable |
| Initial value of parameter P35 | $0$ | variable |
| Initial value of parameter P36 | $0$ | variable |
| Initial value of parameter P37 | $0$ | variable |
| Initial value of parameter P38 | $0$ | variable |
| Initial value of parameter P39 | $0$ | variable |
| Initial value of parameter P40 | $0$ | variable |
| Initial value of parameter P41 | $0$ | variable |
| Initial value of parameter P42 | $0$ | variable |
| Initial value of parameter P43 | $0$ | variable |
| Initial value of parameter P44 | $0$ | variable |
| Initial value of parameter P45 | $0$ | variable |
| Initial value of parameter P46 | $0$ | variable |
| Initial value of parameter P47 | $0$ | variable |
| Initial value of parameter P48 | $0$ | variable |
| Initial value of parameter P49 | $0$ | variable |
| Initial value of parameter P50 | $0$ | variable |
| Initial value of parameter P51 | $0$ | variable |
| Initial value of parameter P52 | $0$ | variable |]

Note: The test data for this model was generated from an analytical
solution of the system of equations.

*)
