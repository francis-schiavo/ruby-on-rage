# frozen_string_literal: true

# Tutorials
class TutorialsController < ApplicationController
  before_action :set_tutorial, only: %i[index show]
  before_action :set_chapter, only: :show

  def index
    render plain: 'Tutorial not found', status: :not_found if @chapters.nil?
  end

  def show
    @content = File.read @chapter_file
  end

  private

  def set_tutorial
    @chapters = MenuLoader.chapters_for params[:tutorial]
  end

  def set_chapter
    @chapter_file = MenuLoader.chapter_file params[:tutorial], params[:chapter]
  end
end
