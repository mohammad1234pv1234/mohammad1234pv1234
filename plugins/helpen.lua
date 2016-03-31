do
function run(msg, matches)
  return [[ 

  Commands list :
for owner group:
⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️
〰〰〰〰〰〰
!promote [username]
Promote someone
〰〰〰〰〰〰
!demote [username]
Demote someone
〰〰〰〰〰〰
!clean [modlist|rules|about]
Will clear [modlist|rules|about] 
〰〰〰〰〰〰
for moderators group:
⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️
!kick [username|id]
You can also by reply
〰〰〰〰〰〰
!ban [ username|id]
You can also by reply
〰〰〰〰〰〰
!unban [id]
You can also by reply
〰〰〰〰〰〰
!insudo
you can invite sudo to the group
〰〰〰〰〰〰
!who
Members list
〰〰〰〰〰〰
!modlist
Moderators list
〰〰〰〰〰〰
!setphoto
locks group photo
〰〰〰〰〰〰
!setname [name]
Set group name
〰〰〰〰〰〰
!lock [member|name|bots|leave|arabic|tag|ads] 
Locks [member|name|bots|leaveing|arabic|tag|ads] 
〰〰〰〰〰〰
!unlock [member|name|bots|leave|arabic|tag|ads]
Unlocks [member|name|bots|leaving|arabic|tag|ads]
〰〰〰〰〰〰
!set rules <text>
Set <text> as rules
〰〰〰〰〰〰
!set about <text>
Set <text> as about
〰〰〰〰〰〰
!settings
Returns group settings
〰〰〰〰〰〰
!newlink
create/revoke your group link
〰〰〰〰〰〰
!link
returns group link
〰〰〰〰〰〰
!setflood [value]
Set [value] as flood sensitivity
〰〰〰〰〰〰
!save [value] <text>
Save <text> as [value]
〰〰〰〰〰〰
!get [value]
Returns text of [value]
〰〰〰〰〰〰
!tagall [text]
tag users && send your message
〰〰〰〰〰〰
!kickinactive
kick inactive users from Group
〰〰〰〰〰〰
!welcome [group|pm|disable]
set welcome to group
set welcome to pm (pv)
set welcome disable
〰〰〰〰〰〰
!linkpv
send link to your pv ( bot reported)
〰〰〰〰〰〰
!banlist
group ban list
〰〰〰〰〰〰
!fliter + word
if s.one say it bot kick him
!filter > word
if s.one say it bot warns him
!filter - word
remove a word from filterlist
!filterlist
you can see a filter list
〰〰〰〰〰〰
⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️
for members:
!rules
Group rules
〰〰〰〰〰〰
!kickme
Will kick user
〰〰〰〰〰〰
!about
Group description
〰〰〰〰〰〰
!id
 group id & user id
〰〰〰〰〰〰
!help
This help persian text
〰〰〰〰〰〰
!owner
returns group owner id
〰〰〰〰〰〰
!stats
Simple message statistics
〰〰〰〰〰〰
!info 
send you a user stats 
worked by reply
〰〰〰〰〰〰
!all
see all about group
〰〰〰〰〰〰
!info
information about you and members
〰〰〰〰〰〰
!me
you can see who are you in group?[sudo,admin,owner,moderatior,member]
part fun bot:
⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️
!calc (s.th)
calculation math
〰〰〰〰〰〰
!echo (s.th)
bot say s.th that you typed
〰〰〰〰〰〰
!feedback (s.th)
send a feedback to admin
〰〰〰〰〰〰
!tosticker
convert a photo to sticker
〰〰〰〰〰〰
!tophoto
conert a sticker to photo
〰〰〰〰〰〰
![Kk]ingpowersh
show the stickers and photos that converted
〰〰〰〰〰〰
!src [s.th]
search something of you entered in google
〰〰〰〰〰〰
!img [s.th]
search something of you entered in image google
〰〰〰〰〰〰
!map [area]
you can see that areas location
〰〰〰〰〰〰
!t2i [text]
convert a text to image
〰〰〰〰〰〰
!voice [text]
convert a text to a voice
〰〰〰〰〰〰
!web [url]
take a webshot from a site(your site should to be start https or http
〰〰〰〰〰〰
!aparat (text)
search in the aparat.com
〰〰〰〰〰〰
!praytime (city)
show that praytime of city
〰〰〰〰〰〰
!translate (text) or (laung,laung,text)
translate
〰〰〰〰〰〰
!weather (city)
show the weather of that city
〰〰〰〰〰〰
**U can use "/" & "!"
〰〰〰〰〰〰
*Only owner & mods can add bots to group
〰〰〰〰〰〰
*Only moderators & owner can use kick,ban,unban,newlink,link,setphoto,setname,lock,unlock,set rules,set about,settings,filterword commands
〰〰〰〰〰〰
*Only owner can use res,setowner,promote,demote,log commands
admins:
@kingpower_admin_1
@AH2002
@erfan_hllaj
channel:
@kingpowerch
  ]]
end

return {
  description = "kingpower",
  patterns = {"^[!/%$+=.-*&][Hh]elpen$"},
  run = run 
}
end
