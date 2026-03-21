# frozen_string_literal: true

Rails.application.config.after_initialize do
  $menu_loader = MenuLoader.new
  $menu_loader.execute
end
