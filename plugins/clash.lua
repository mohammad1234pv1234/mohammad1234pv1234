local apikey = 
'Enter Your Clash API here(لطفا API را وارد نمایید)' 
local function run(msg, matches)
 if matches[1]:lower() == 'clan' or matches[1]:lower() == 'کلن' or  matches[1]:lower() == 'clash' or matches[1]:lower() == 'کلش' or  matches[1]:lower() == 'clantag' or matches[1]:lower() == 'شناسه کلن' or  matches[1]:lower() == 'tag' matches[1]:lower() == 'تگ' then
  local clantag = matches[2]
  if string.match(matches[2], '^#.+$') then
     clantag = string.gsub(matches[2], '#', '')
  end
  clantag = string.upper(clantag)
  local curl = 'curl -X GET --header "Accept: application/json" --header "authorization: Bearer '..apikey..'" "https://api.clashofclans.com/v1/clans/%23'..clantag..'"'
  cmd = io.popen(curl)
  
  local result = cmd:read('*all')
  local jdat = json:decode(result)
if jdat.reason then
      if jdat.reason == 'accessDenied' then return 'برای ثبت API Key خود به سایت زیر بروید\ndeveloper.clashofclans.com' end
   return '#Error\n'..jdat.reason
  end
  local text = 'Clan Tag(شناسه کلن(: '.. jdat.tag
     text = text..'\nClan Name(نام کلن): '.. jdat.name
     text = text..'\nDescription(توضیحات): '.. jdat.description
     text = text..'\nType(نوع): '.. jdat.type
     text = text..'\nWar Frequency(مدت زدن وار): '.. jdat.warFrequency
     text = text..'\nClan Level(مرحله کلن): '.. jdat.clanLevel
     text = text..'\nWar Wins(تعداد بردن وار هآ): '.. jdat.warWins
     text = text..'\nClan Points(امتیازات کلن): '.. jdat.clanPoints
     text = text..'\nRequired Trophies(حداقل کاپ برای عضو شدن): '.. jdat.requiredTrophies
     text = text..'\nMembers(اعضا): '.. jdat.members
     text = text..'\n\n@kingpowerobot ch:@kingpowerch'
     cmd:close()
  return text
 end
 if matches[1]:lower() == 'members' or if matches[1]:lower() == 'اعضا' or matches[1]:lower() == 'clashmembers' or if matches[1]:lower() == 'اعضا کلش' or matches[1]:lower() == 'اعضا کلن' then
  local members = matches[2]
  if string.match(matches[2], '^#.+$') then
     members = string.gsub(matches[2], '#', '')
  end
  members = string.upper(members)
  local curl = 'curl -X GET --header "Accept: application/json" --header "authorization: Bearer '..apikey..'" "https://api.clashofclans.com/v1/clans/%23'..members..'/members"'
  cmd = io.popen(curl)
  local result = cmd:read('*all')
  local jdat = json:decode(result)
  if jdat.reason then
      if jdat.reason == 'accessDenied' then return 'برای ثبت API Key خود به سایت زیر بروید(for your API go to this site)\ndeveloper.clashofclans.com' end
   return '#Error\n'..jdat.reason
  end
  local leader = ""
  local coleader = ""
  local items = jdat.items
  leader = 'Clan Moderators: \n'
   for i = 1, #items do
   if items[i].role == "leader" then
   leader = leader.."\nLeader(مدیر): "..items[i].name.."\nLevel: "..items[i].expLevel
   end
   if items[i].role == "coLeader" then
   coleader = coleader.."\nCo-Leader(کمک مدیر): "..items[i].name.."\nLevel: "..items[i].expLevel
   end
  end
text = leader.."\n"..coleader.."\n\nClan Members(اعضا کلن):"
  for i = 1, #items do
  text = text..'\n'..i..'- '..items[i].name..'\nlevel(مرحله): '..items[i].expLevel.."\n"
  end
  text = text.."\n\n@kingpowerobot ch:@kingpowerch"
   cmd:close()
  return text
 end
end

return {
   patterns = {
"^[!/#](clash) (.*)$",
"^[!/#](clan) (.*)$",
"^[!/#](clantag) (.*)$",
"^[!/#](tag) (.*)$",
"^[!/#](clashmembers) (.*)$",
"^[!/#](clanmembers) (.*)$",
"^[!/#](members) (.*)$",
"^(clash) (.*)$",
"^(clan) (.*)$",
"^(clantag) (.*)$",
"^(tag) (.*)$",
"^(clashmembers) (.*)$",
"^(clanmembers) (.*)$",
"^(members) (.*)$",
"^(کلش) (.*)$",
"^(کلن) (.*)$",
"^(شناسه کلن) (.*)$",
"^(تگ) (.*)$",
"^(اعضا کلش) (.*)$",
"^(اعضا کلن) (.*)$",
"^(اعضا) (.*)$",
   },
   run = run
}
