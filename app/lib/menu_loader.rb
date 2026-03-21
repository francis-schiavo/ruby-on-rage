# frozen_string_literal: true

# Menu loader
class MenuLoader
  attr_accessor :entries

  def self.tutorials
    Rails.application.config_for(:routes)[:tutorials].each.map { |key, _| key.to_s }
  end

  def self.chapters_for(tutorial)
    Rails.application.config_for(:routes).dig(:tutorials, tutorial.to_sym, :chapters)
  end

  def self.chapter_file(tutorial, chapter)
    Rails.root.join('tutorials', tutorial, "#{chapter}.md")
  end
end
