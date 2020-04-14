#!/usr/bin/perl
#Makes dot diagrams from basic injections, not very well 
#(understands common IDE coding style formats)
#Usage: find|grep java$|xargs perl ~/bin/TrivialEjbUml.pl >dependencies.txt
#Then: dot -Tpng dependencies.txt -o dependencies.png 

$injectionNext = 0;
$class = "";

print "digraph ejbuml {\n";

while(<>) {
  /^\s*\/\// && next;

  if($injectionNext) {
    ($target) = $_ =~ / ([A-Z]\w+) /;
    print "$class -> $target;\n";
    $injectionNext = 0;
  }
  
  /\sclass (\w+)/ && do {
    $class = $1;
  };

 /implements (\w+)/ && do {
    $class = $1;
  };

  /\@EJB/ && do {
    $injectionNext = 1;
  };
}

print "}\n";

