Address Parser Play
===================

In my [uk_address_parser](https://github.com/reggieb/uk_address_parser) I've used
a custom parser to pull out the address parts. The elements are identified via
a fairly ugly `case` statement, which relies on regular expresssions. I'd like
to improve this and think that replacing it with a dedicated parser would be a
worthwhile step forward. Also it will give me a chance to gain some parser
building experience.

I am using [Treetop](https://github.com/nathansobo/treetop) to build the address 
parser. 

Useful references
-----------------

* [Treetop Documentation][1]
* [A quick intro to writing a parser with Treetop][2]
* [Treetop Grammar Line Continuation][3]
* [Getting started with Treetop][4]

[1]: http://treetop.rubyforge.org/syntactic_recognition.html
[2]: http://thingsaaronmade.com/blog/a-quick-intro-to-writing-a-parser-using-treetop.html
[3]: http://stackoverflow.com/questions/30360633/treetop-grammar-line-continuation
[4]: http://po-ru.com/diary/getting-started-with-treetop/
