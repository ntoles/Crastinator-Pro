#!/usr/bin/env ruby

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

TIME_WASTER_APPS = [
    /Safari/,
    /Firefox/,
    /Google Chrome/
]

SLEEP_INTERVAL = 5


def current_app
  `osascript -e 'tell application "System Events"' -e 'set frontApp to name of first application process whose frontmost is true' -e 'end tell'`.chomp
end

def is_time_waster_app(app)
  TIME_WASTER_APPS.each do |waster|
     return true if app =~ waster
  end
  false
end

while true do

  sleep SLEEP_INTERVAL
  app = current_app

  if is_time_waster_app(app)
    phrase = RESPONSES[rand(RESPONSES.length)]
    puts phrase
  end

end