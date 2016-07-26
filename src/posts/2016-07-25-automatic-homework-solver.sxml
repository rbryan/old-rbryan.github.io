;;; -*- scheme -*-

(use-modules  (haunt utils)
	      (ice-9 rdelim))

`((title . "A Program to Solve and Format Homework Problems")
  (date . ,(string->date* "2016-07-25 18:15"))
  (tags "project" "blog" "automation" "tools")
  (summary . "A program that, given a problem description, solves homework problems and shows its work.")
  (project . "homework-solver")
  (content
   (
	(h3	"Background")

	(p	"First semester of my Sophomore year, when I was still a bored EE student,
		I had the absolute pleasure of taking a class called \"Fields\" where the
		professor did her best to teach us the ins and outs of electricity and
		magnetism. Before the semester started, all of the students in the class
		recieved an email that outlined what was going to happen during the first
		few weeks of the course and described the format that the homework was going
		to be in. I've had classes that required certain formatting standards for
		homework before, but generally not for engineering course work and usually not so
		time consuming to produce.")

	(p	"The format is as follows. The work for each problem was to be written out in
		three columns. The first column contained the math that was used to solve the
		problem. The second column contained the math that you had just written, but
		this time written out in plain english. The third and final column contained
		the reasoning you used to justify what you were doing. This format felt awefully
		reduntant and time consuming to me to the point that I invested a significant
		amount of my free time into writing a program that would produce it for me.")

	(h3	"How it Works")

	(p	"The core of the program is "
		(a (@ (href "https://en.wikipedia.org/wiki/Maxima_%28software%29")) "Maxima")
		", an open source computer algebra system. Maxima has a capability that turned
		out to be exceedingly useful to me during this project. At the beginning of the
		project I intended to have maxima solve problems for me and then write my own
		program to produce useful output from the results. It turns out that Maxima can
		not only sometimes display the steps it took to solve a problem, it can also
		output to Latex.")
	
	(p	"The only things left to do once I figured that out were to set up a system to 
		generate input for Maxima to work on, and to postprocess the output it produced
		into the format that I wanted. All of this was written in Guile scheme; this made
		it easy to create a domain specific language to generate input for Maxima and 
		process the output. Input was simple, the description for the problem
		was a set of functions that transformed problem inputs into input for Maxima.
		The output was less trivial. The Latex that Maxima outputs is less than ideal and
		in many cases and I found myself repeatedly adding special cases to the post
		processing functions in order to fix it. Even now, while the output it produces
		compiles to a nice looking pdf, the Latex produces a lot of warnings.")

	(h3	"Example")

	(p	"Here's an example, "(code "test.scm")" in the repository:")

	(pre 	,(call-with-input-file "assets/2016-07-25-homework-solver-test.txt" read-string))

	(p	"And here's the output produced by compiling the Latex outputed:")

	(img	(@ (src "/assets/2016-07-25-homework-solver-test-output.jpg")))

	(h3	"A Warning")

	(p	"It's easy to see how powerful this is. Once you can write functions to do simple
		math and output the steps they take along the way, it's trivial to compose them
		into larger functions that solve whole problems explaining as they go along.
		Now, believe me, I know the childlike giddiness that arises once you realize
		that you have a machine in front of you that can do all of your homework for you
		in seconds, but allow me to convince you of why you shouldn't use it and explain
		why I ultimately didn't.

		First, this class was a fairly special case. Because of the nature of the material
		covered, most of the material from one section would be built on in the next.
		As such, if I wrote a program that generated output for a particular type of
		problem, I could be reasonably certain that I would be able to build off of
		that program for the rest of the class. There's a good chance that this sort of 
		program wouldn't work for most of the classes that you're in.

		Second, it's a bad idea to avoid doing homework for a few reasons. If you're in
		college like I am, you're paying to be here. If you haven't done it yet, sit down
		and work out how much you're paying for the priviledge of doing homework for an hour.
		It's also a bad idea, because there's a good chance that if you slack off most of
		the semester you'll be woefully unprepared for the final.
		
		Finally, It's a lot of work. Yes, you don't have to do your homework anymore, but
		you still have to write new functions for everything that you learn. You also have
		to continuously add special cases to the post-processor to fix badly formatted
		Latex. While the latter will become less of a burden over time, the former will
		likely be more than enough work to make you reconsider.")

	(p	"If, after all that, you still want to use this great! I'm glad someone found a
		use for it! I wish you luck!")

	(p	"Give it a try:")

	(pre	"git clone "
		(a (@ (href "https://github.com/rbryan/fields-homework-generator"))
		"https://github.com/rbryan/fields-homework-generator\n")
		"cd fields-homework-generator\n"
		"./compile test.scm\n")
		
		
    
    )))
