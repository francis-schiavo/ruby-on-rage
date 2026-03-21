# frozen_string_literal: true

class TutorialsController < ApplicationController
  before_action :set_filename, only: :show

  def show
    content = File.read @chapter

    @html = Kramdown::Document.new(content).to_html.html_safe
  end

  private

  def set_filename
    @chapter = $menu_loader.filename params[:tutorial], params[:chapter]
  end
end
