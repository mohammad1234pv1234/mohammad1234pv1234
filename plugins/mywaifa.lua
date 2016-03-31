do

local function run(msg, matches)
  if matches[1] == 'من' then
    if is_sudo(msg) then
    send_document(get_receiver(msg), "/root/robot/sudo.webp", ok_cb, false)
      return "تو سودومی"
    elseif is_admin(msg) then
    send_document(get_receiver(msg), "/root/robot/admin.webp", ok_cb, false)
      return "تو ادمینمی"
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "/root/robot/owner.webp", ok_cb, false)
      return "تو ادمین اصلی گروهی"
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "/root/robot/mod.webp", ok_cb, false)
      return "تو مدیر گروهی"
    else
    send_document(get_receiver(msg), "/root/robot/mmbr.webp", ok_cb, false)
      return "تو یک کاربر معمولی در گروه هستی"
    end
  end
end

return {
  patterns = {
    "^(من)$"
    },
  run = run
}
end
