local function save_filter(msg, name, value)
  local hash = nil
  if msg.to.type == 'chat' then
    hash = 'chat:'..msg.to.id..':filters'
  end
  if msg.to.type == 'user' then
    return 'just for groups'
  end
  if hash then
    redis:hset(hash, name, value)
    return "done"
  end
end

local function get_filter_hash(msg)
  if msg.to.type == 'chat' then
    return 'chat:'..msg.to.id..':filters'
  end
end 

local function list_filter(msg)
  if msg.to.type == 'user' then
    return 'just for groups'
  end
  local hash = get_filter_hash(msg)
  if hash then
    local names = redis:hkeys(hash)
    local text = 'filer list:\n______________________________\n'
    for i=1, #names do
      text = text..'> '..names[i]..'\n'
    end
    return text
  end
end

local function get_filter(msg, var_name)
  local hash = get_filter_hash(msg)
  if hash then
    local value = redis:hget(hash, var_name)
    if value == 'msg' then
      return 'if you say this word again i kick you'
    elseif value == 'kick' then
      send_large_msg('chat#id'..msg.to.id, "you are not accepted the rules and i kicking you now")
      chat_del_user('chat#id'..msg.to.id, 'user#id'..msg.from.id, ok_cb, true)
    end
  end
end

local function get_filter_act(msg, var_name)
  local hash = get_filter_hash(msg)
  if hash then
    local value = redis:hget(hash, var_name)
    if value == 'msg' then
      return 'waring:you can not say it'
    elseif value == 'kick' then
      return 'you can not say this word and you are kicked from group becuse you say it'
    elseif value == 'none' then
      return 'this word is deleted from filter list'
    end
  end
end

local function run(msg, matches)
  local data = load_data(_config.moderation.data)
  if matches[1] == "filterlist" then
    return list_filter(msg)
  elseif matches[1] == "filter" and matches[2] == ">" then
    if data[tostring(msg.to.id)] then
      local settings = data[tostring(msg.to.id)]['settings']
      if not is_momod(msg) then
        return "you are not admin"
      else
        local value = 'msg'
        local name = string.sub(matches[3]:lower(), 1, 1000)
        local text = save_filter(msg, name, value)
        return text
      end
    end
  elseif matches[1] == "filter" and matches[2] == "+" then
    if data[tostring(msg.to.id)] then
      local settings = data[tostring(msg.to.id)]['settings']
      if not is_momod(msg) then
        return "you are not admin"
      else
        local value = 'kick'
        local name = string.sub(matches[3]:lower(), 1, 1000)
        local text = save_filter(msg, name, value)
        return text
      end
    end
  elseif matches[1] == "filter" and matches[2] == "-" then
    if data[tostring(msg.to.id)] then
      local settings = data[tostring(msg.to.id)]['settings']
      if not is_momod(msg) then
        return "you are not admin"
      else
        local value = 'none'
        local name = string.sub(matches[3]:lower(), 1, 1000)
        local text = save_filter(msg, name, value)
        return text
      end
    end
  elseif matches[1] == "filter" and matches[2] == "?" then
    return get_filter_act(msg, matches[3]:lower())
  else
    if is_sudo(msg) then
      return
    elseif is_admin(msg) then
      return
    elseif is_momod(msg) then
      return
    elseif tonumber(msg.from.id) == tonumber(our_id) then
      return
    else
      return get_filter(msg, msg.text:lower())
    end
  end
end

return {
  description = "Word Filtering", 
  usage = {
  user = {
    "filter ? (word) : you can filter a word",
    "filterlist : you can see the filtered list"
    },
  moderator = {
    "filter > (word) : bot say warning to someone if they say it!",
    "filter + (word) : if s.one say it bot kick him,
    "filter - (word) : remove a filter word",
	"!filter > (word) : bot say warning to someone if they say it!",
    "!filter + (word) : if s.one say it bot kick him",
    "!filter- (word) : remove a filter word",
  },
  },
  patterns = {
    "^[!/#](filter) (.+) (.*)$",
    "^[!/#](filterlist)$",
	"^(filter) (.+) (.*)$",
    "^(filterlist)$",
    "(.*)",
  },
  run = run
}
