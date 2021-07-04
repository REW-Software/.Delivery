def click_last_link(link_name)
  link = all(:link, link_name).last
  link.click
end

def click_last_button(button_name)
  button = all(:button, button_name).last
  button.click
end