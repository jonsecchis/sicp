# Structure and Interpretation of Computer Programs

Exercise files from the book *Structure and Interpretation of Computer Programs.*

## Interpreter/Compiler

So far using the [Gambit Interpreter/Compilter](http://www.iro.umontreal.ca/~gambit/doc/gambit.html)

## Running Functions from Command Line

`gsi filename arg`

## Tips to Remember

**Get arguments from the command line**

```
(car (command-line))
(cadr (command-line))
(caddr (command-line))
```

**Read input string as a Number**

`(string->number arg)`

**Print the Result**

`(pretty-print arg)`
