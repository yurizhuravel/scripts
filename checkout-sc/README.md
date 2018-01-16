## Checkout command line app

To allow for frequent changes in pricing, this programm uses data from an XML file, taking the file as an argument. Sample pricing file `pricing.xml` is supplied.

### Sample usage

`$ ./checkout.sh pricing.xml`

To add an item to checkout enter A, B, C, or D when prompted, or Q to exit (case insensitive). 

### TODO

- Implement multibuy offer handling
- Improve input validation and error handling