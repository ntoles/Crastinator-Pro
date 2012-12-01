Crastinator-Pro
===============

Time is a terrible thing to waste.

Do you ever interrupt your work and go on the web for 
just a minute, only to find yourself 20 minutes later 
in the bowels of the internet, having forgotten what 
it is you were doing?

Well, no more. Introducing Crastinator Pro Mac edition.

This handy script quietly runs in the background and will
start a timer when it senses that your foreground application is
Safari/Firefox/Chrome. After that it will verbally harass you at
preset and user-controllable intervals of time until you switch to
another application. 

Special behavior can be configured for browsing "useful" sites, 
like gmail. There, it will only gently remind you every 5 minutes 
that another 5 minutes of your life has gone down the series of tubes 
that is the internets.

The easiest way to install Crastinator Pro is to download the binary
installation image form github:

https://github.com/ntoles/Crastinator-Pro/downloads

Install the app in the Applications folder, double click it,
set your speaker volume to be non-zero, and go on with your 
life. For maximum effect, it is highly recommended to include 
Crastinator Pro in your login items:
 
(System Preferences -> Users & Groups --> Login Items Pane
--> Push "+" and select Crastinator Pro. Press the little 
checkmark next to it to hide it on login).

============================================================

If you want to tweak Crastinator Pro, or want to help 
develop it, then download the source scripts from github. 
There is a bash and Ruby version. Ruby version is recommended. 

https://github.com/ntoles/Crastinator-Pro

NOTE: the scripts work only on Macs, as they use 
features of OS X, that are not available on linux. 

To run the bash script, in Terminal type:

 chmod +x crastinator-pro.sh ;
 ./crastinator-pro.sh >/dev/null 2>&1 &

And set your speaker volume to be nonzero.

To use the Ruby version:

ruby crastinator-pro.rb >/dev/null 2>&1 &

or, 

chmod +x crastinator-pro.rb ; 
./crastinator-pro.rb >/dev/null 2>&1 &

The binary app is made using Platypus 
http://sveinbjorn.org/platypus

Enjoy! 

