do
function run(msg, matches) 
send_document(get_receiver(msg), "/root/robot/sticker.webp", ok_cb, false) 
end 

 
 return { 
 patterns = { 
"^[Kk][Ii][Nn][Gg][Pp][Oo][Ww][Ee][Rr][Ss][Hh]$", 
 "^[!/][Kk]ingpowersh$",
 "^(کینگ) (پور) (شو)$"
}, 
 run = run
 }
 end 
