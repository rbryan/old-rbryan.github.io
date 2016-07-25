;;; Haunt --- Static site generator for GNU Guile
;;; Copyright © 2016 David Thompson <davet@gnu.org>
;;;
;;; This file is part of Haunt.
;;;
;;; Haunt is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; Haunt is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with Haunt.  If not, see <http://www.gnu.org/licenses/>.

(use-modules (haunt site)
             (haunt reader)
             (haunt asset)
             (haunt page)
             (haunt post)
             (haunt html)
             (haunt utils)
             (haunt builder blog)
             (haunt builder assets)
	     (srfi srfi-1))

(define (stylesheet name)
  `(link (@ (rel "stylesheet")
            (href ,(string-append "/css/" name ".css")))))

(define (anchor content uri)
  `(a (@ (href ,uri)) ,content))

(define blog-theme
  (theme #:name "blog"
         #:layout
         (lambda (site title body)
           `((doctype "html")
             (head
              (meta (@ (charset "utf-8")))
              (title ,(string-append title " - " (site-title site)))
              ,(stylesheet "reset")
              ,(stylesheet "main"))
             (body
              (header (@ (class "navbar"))
                      (div (@ (class "container"))
                           (ul
                            (li ,(anchor "home" "/"))
                            (li ,(anchor "projects" "/posts/projects.html"))
                            (li ,(anchor "posts" "/posts/posts.html"))
                            (li ,(anchor "resume" "/assets/resume.pdf"))
                            (li ,(anchor "git" "https://github.com/rbryan")))))
              (div (@ (class "container"))
                   ,body
                   (footer (@ (class "text-center"))
                    (p (small "Copyright 2016 Russell Bryan")))))))
         #:post-template
         (lambda (post)
           `((h2 ,(post-ref post 'title))
             (h3 "by " ,(post-ref post 'author)
                 " - " ,(date->string* (post-date post)))
             (div ,(post-sxml post))))
         #:collection-template
         (lambda (site title posts prefix)
		(define (post-uri site post)
		  (string-append  (or prefix "") "/"
			(site-post-slug site post) ".html"))
	   `((h2 ,title)
	     (ul (@ (class "post-collection"))
	       ,@(map (lambda (post) 
			  `(li (@ (class "post-listing"))
			       (h3
				 (a (@ (href ,(post-uri site post)))
				,(post-ref post 'title))
				 " - "
				,(date->string* (post-date post)))
			     ,(post-ref post 'summary)))
		      (posts/reverse-chronological posts)))))))

(define (home-page site posts)
  (define body
    `(,(post-sxml (car (last-pair (posts/reverse-chronological posts))))))
  (make-page "index.html"
	     (with-layout blog-theme site "Home" body)
	     sxml->html))

(define (sort-by-project posts)
  (let ((posts 
  	  (filter (lambda (post)
	    		(post-ref post 'project))
		  posts)))
  	(stable-sort (posts/reverse-chronological posts)
	 (lambda (a b)
	   (let ((a (post-ref a 'project))
		 (b (post-ref b 'project)))
	         (string<=? a b))))))

(define post-collections
  `(("Posts" "posts.html" ,posts/reverse-chronological)
    ("Projects" "projects.html" ,sort-by-project )))

(site #:title "rbryan"
      #:domain "rbryan.github.io"
      #:default-metadata
      '((author . "Russell Bryan")
        (email  . "russell.e.bryan@gmail.com"))
      #:readers (list sxml-reader)
      #:builders (list (blog #:theme blog-theme #:prefix "/posts" #:collections post-collections)
		       home-page
		       (static-directory "assets")
                       (static-directory "css")))
