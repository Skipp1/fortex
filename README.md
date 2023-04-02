# fortex
A language agnostic way of documenting source code using LaTeX. 

A large(er) example of fortex can be found at https://github.com/Skipp1/mono-rich

As this is the fest LaTeX package that I have ever written, so there may be some very obvious things that I am missing and could do better (please leave a comment telling me what).

# Building 

fortex uses the l3build system in order to build the package, tests, and documentation.
A summery of the commands is listed below.


| | <!-- Oh markdown tables --> |
|---------|---------------------|
| Docs    | ` $ l3build doc`    |
| Package | ` $ l3build unpack` |
| Tests   | ` $ l3build check`  |
