# frozen_string_literal: true

require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

# Base helper
module ApplicationHelper
  class MarkdownRender < Redcarpet::Render::HTML
    def initialize(extensions = {})
      super extensions.merge(link_attributes: { target: '_blank' })
    end

    include Rouge::Plugins::Redcarpet
  end

  def markdown(text)
    renderer = MarkdownRender.new
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true, autolink: true, tables: true)
    markdown.render(text).html_safe
  end
end
