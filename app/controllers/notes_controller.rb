class NotesController < ApplicationController
  before_action :authenticate_user
  
  
  def top
    @notes = Note.where(user_id: @current_user.id).order(created_at: :desc)
  end

  def new
  end

  def create
    @note = Note.new(content: params[:note], user_id: @current_user.id)
    @note.save
    redirect_to("/notes/#{@current_user.id}/top")
  end

  def editor
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.content = params[:note]
    @note.save
    redirect_to("/notes/#{@current_user.id}/top")
  end

  def destroy_confirm
    @note = Note.find_by(id: params[:id])
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    @note.destroy
    redirect_to("/notes/#{@current_user.id}/top")
  end
end