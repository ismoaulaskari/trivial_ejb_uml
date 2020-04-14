# trivial_ejb_uml
Very simple script to draw uml-like pictures of EJB dependencies in Java files using Graphviz.
For Linux-like systems.

Manual:
Makes dot diagrams from basic injections (@EJB), not very well 
(understands common IDE coding style formats).
Install graphviz, it contains the dot command.
Usage: find|grep java$|xargs perl ~/bin/TrivialEjbUml.pl >dependencies.txt
Then: dot -Tpng dependencies.txt -o dependencies.png 

