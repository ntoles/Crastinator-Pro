#!/usr/bin/env ruby

FIRST_WARNING = 120
REMIND_INTERVAL = 60 
SLEEP_INTERVAL = 5
NONSTOP_TIME = 360
counter = 1

TIME_WASTER_APPS = [
    /Safari/,
    /Firefox/,
    /Google Chrome/
]

PERMITTED_SITES = [
   /mail.google.com/,
   /docs.google.com/,
   /calendar/,
   /united.com/,
   /arxiv.org/,
   /.pdf/
]

RESPONSES = [
  "Stop procrastinating",
  "You are wasting your time",
  "Allright, back to work!",
  "You could be working right now",
  "Be productive!",
  "Take a break",
  "Beep!",
  "Be-beep!",
  "Stop it!"
]

VOICES = [
  "Alex", 
  "Vicki", 
  "Trinoids", 
  "Whisper", 
  "Cellos"
]

def current_app
  `osascript -e 'tell application "System Events"' -e 'set frontApp to name of first application process whose frontmost is true' -e 'end tell'`.chomp
end

def current_site(app)
  cmd = "osascript -e 'tell application \"#{app}\"' -e 'set theURL to URL of current tab of window 1' -e 'end tell'"
  `#{cmd}`.chomp
end


def is_time_waster_app(app)
  TIME_WASTER_APPS.each do |waster|
     return true if app =~ waster
  end
  false
end

def is_permitted_site(site)
    PERMITTED_SITES.each do |permitted|
    	return true if site =~ permitted
    end
    false
end

while true do

  sleep SLEEP_INTERVAL
  app = current_app

  if is_time_waster_app(app)
    counter = counter + 1
    time = counter*SLEEP_INTERVAL

    site = current_site(app)
    
    if time >= FIRST_WARNING && 
    (time - FIRST_WARNING) % REMIND_INTERVAL == 0 || 
    time > NONSTOP_TIME;
    	phrase = RESPONSES[rand(RESPONSES.length)]
	voice = VOICES[rand(VOICES.length)]

	if is_permitted_site(site)
          if (time - FIRST_WARNING) % 300 == 0 
            system("say -v #{voice} five minutes &")
          end
	else
		system("say -v #{voice} #{phrase} &")
	end
    end

  else
    counter = 1 
  end

end
