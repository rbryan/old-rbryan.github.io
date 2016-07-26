;;; -*- scheme -*-

(use-modules  (haunt utils))

`((title . "Rotating Colours")
  (date . ,(string->date* "2016-07-24 14:32"))
  (tags "project" "image")
  (summary . "Rotating colours about the origin in 3-space and pretty fractals")
  (project . "crot")
  (content
   (
(img (@ (src "/assets/2016-07-24-crot-mandelbrot.jpg")))
(p 
"Several years ago, as a senior in high school, I was inspired to write this little program that rotates colours as if their rgb representation was a vector in 3-space. Moreover, it can vary the amount that it rotates the colours based on fractal functions. Currently the Julia set and Mandelbrot fractals are supported. It shouldn't be too difficult to implement others. There's nothing particularly impressive about the program, but it was an interesting idea and if you fiddle with the inputs enough you can produce some relatively interesting outputs. With a bit of effort you can produce images that are significantly more pleasing than the one shown above. I believe there's also a much more limited python proof of concept in the repo as well.")
    
(p "Give it a try:")

(pre
  "git clone "
  (a (@ (href "https://github.com/rbryan/crot"))
	"https://github.com/rbryan/crot\n")
  "cd crot\n"
  "make\n"
  "./crot")
    )))
