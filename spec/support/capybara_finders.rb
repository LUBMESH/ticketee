module CapybaraFinders
  def list_item(content)
    find("ul:not(.actions) li", text: content)
  end

  RSpec.configure do |c|
    c.include CapybaraFinders, type: :feature
  end
end