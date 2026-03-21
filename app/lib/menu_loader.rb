# frozen_string_literal: true

require 'singleton'

# Menu loader
class MenuLoader
  attr_accessor :entries

  def initialize
    @entries = {}
  end

  def execute
    tutorials_path = Rails.root.join('tutorials')
    iterate tutorials_path do |dir, tutorial|
      @entries[tutorial] ||= {}

      iterate File.join(tutorials_path, dir) do |filename, chapter|
        @entries[tutorial][chapter.gsub('.md', '')] = File.join(tutorials_path, dir, filename)
      end
    end
  end

  def filename(tutorial, chapter)
    @entries.dig(tutorial, chapter)
  end

  private

  def iterate(path)
    Dir.entries(path).each do |dir|
      next if dir.start_with?('.')

      label = dir.split('-').last
      yield dir, label
    end
  end
end
