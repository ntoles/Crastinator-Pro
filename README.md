Crastinator-Pro
===============

Time is a terrible thing to waste.

Do you ever interrupt your work and go on the web for 
just a minute, only to find yourself 20 minutes later 
in the bowels of the internet, having forgotten what 
it is you were doing?

Well, no more. Introducing Crastinator Pro Mac edition.

This handy bash shell script that quietly runs in the background, will
start a timer when it senses that your foreground application is
Safari/Firefox/Chrome. After that it will verbally harass you at
preset and user-controllable intervals of time until you switch to
another application.

Special behavior can be configured for browsing "useful" sites, like gmail.  

To run the bash script, in Terminal type:

 chmod +x crastinator-pro.sh ;
 ./crastinator-pro.sh >/dev/null 2>&1 &

And set your speaker volume to be nonzero.

We now have the ruby version (thanks, Matt!); to invoke it use:

ruby crastinator-pro.rb >/dev/null 2>&1 &

or, 

chmod +x crastinator-pro.rb ; 
./crastinator-pro.rb >/dev/null 2>&1 &

Enjoy! 

