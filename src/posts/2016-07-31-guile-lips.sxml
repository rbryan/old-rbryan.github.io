;;; -*- scheme -*-

(use-modules  (haunt utils)
	      (ice-9 rdelim)
	      (ice-9 pretty-print))

`((title . "guile-lips: Scheme as a generic macro language")
  (date . ,(string->date* "2016-07-31 23:20"))
  (tags "project" "guile" "scheme" "language" )
  (summary . "Embedding scheme in text for writing macros.")
  (project . "lips")
  (content
   (
	(p	"This blog thing is finally picking up! I would consider this to be
		one of my more polished projects. There are still some warts on it
		that I don't particularly like, but I've done my best to make it as
		clean and modular as possible. This project was inspired by another
		similar project that you can find " (a (@ (href "https://github.com/zc1036/lips")) "here") " 
		so if you prefer common lisp to scheme go check it out.
		The idea is pretty much the same, but (I think) my version is cleaner and
		more modular. My version is also written in guile rather than common
		lisp.")

	(h3	"By Example")
	
	(p	"The idea here is simple. You write whatever sort of text file as you
		normally would, except scheme expressions following a " (code "~") " will
		be evaluated and printed. If you want to write a '" (code "~") "', just write
		\"" (code "~~") "\". It's that simple. Lets jump straight into an example.")

	(p	"One of the most useful uses for a macro system is to add features to a language
		to fit it to your uses better. As an example, lets fix one of the things that
		annoys me most about Java, import statements. They always end up being verbose and
		repetitive.")
	
		(pre	"
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.awt.Color;")

	(p	"Look at that. Yes, the repetition is kind of mesmerizing; it does look fairly tidy once
		you're finished typing it all out. I write enough as it is though. I don't want to have
		to type out " (code "java.util.*") " half a dozen times every time I make a new file. Let's
		clean this up a bit. I think it should look more like this:")

		(pre	"
~(java-import '((java
			(util
				HashMap
				HashSet
				Map
				Random
				Set
				UUID
				(concurrent
					ExecutorService
					Executors
					Callable
					Future))
			(awt
				Color))))")
	(p	"Much better! My eye's were starting to get sore looking at all those jagged semi-colons! So,
		How do we make this happen? It's as simple as writing a function that takes a tree of symbols
		and prints appropriate import statements:")

	(pre	"
(define (java-import specification)
		(letrec ((recurse  ;;future Russell thinks he should have used a named loop here
			   (lambda (spec-string spec-list)
			     (for-each (lambda (spec)
					 (if (list? spec)
					   (recurse (string-append
						      spec-string
						      (symbol->string (car spec)) \".\")
						    (cdr spec))
					   (begin
					     (display (string-append
							\"import \"
							spec-string
							(symbol->string spec) \";\"))
					     (newline))))
				       spec-list))))
		  (recurse \"\" specification)))")

	(p	"How easy was that!!? You can use this in a few ways. You can make a macro file
		and include it in your project loading it as you would any scheme code. You can
		put it in your " (code "lipsrc.scm") " file in " (code "$HOME/.config/lips/lipsrc.scm") " or
		you can do what I did and make a module and put it in " (code "$HOME/.config/lips/modules") ".
		lips will look here by default when using a standard configuration.")


	  (pre
  		"git clone "
		(a (@ (href "https://github.com/rbryan/guile-lips"))
			"https://github.com/rbryan/guile-lips\n")
 		"cd guile-lips\n"
		"./install.sh   #If you don't read this first you're a fool.\n"
		"lips < test.txt")

)))






