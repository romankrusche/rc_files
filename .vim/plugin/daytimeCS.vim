" set day time color scheme (from O'reilly "learning the vi and vim editors")
"
"

function SetTimeOfDayColors()
   " note: addition of zero to guarantee return from function is numeric
   let currentHour = strftime("%H")
   echo "currentHour is " . currentHour
   if currentHour < 6 + 0
      let cs = "darkblue"
   elseif currentHour < 12 + 0
      let cs = "morning"
   elseif currentHour < 18 + 0
      let cs = "shine"
   else
      let cs = "evening"
   endif
   echo "setting color scheme to " . cs
   execute "colorscheme " . cs
endfunction
