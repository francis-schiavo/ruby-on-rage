# frozen_string_literal: true

# Menu loader
class MenuLoader
  attr_accessor :entries

  def self.tutorials
    Rails.application.config_for(:routes)[:tutorials]
  end

  def self.title_for(tutorial)
    Rails.application.config_for(:routes).dig(:tutorials, tutorial.to_sym, :title)
  end

  def self.chapters_for(tutorial)
    Rails.application.config_for(:routes).dig(:tutorials, tutorial.to_sym, :chapters)
  end

  def self.chapter_title(tutorial, chapter)
    Rails.application.config_for(:routes).dig(:tutorials, tutorial.to_sym, :chapters, chapter.to_sym)
  end

  def self.chapter_file(tutorial, chapter)
    Rails.root.join('tutorials', tutorial, "#{chapter}.md")
  end
end
