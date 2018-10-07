class NotesController < ApplicationController

  def index
    @notes = Note.all
    render jsonL @notes
  end



  def destroy
    Like.find_by(user_id: params[:user_id], hotel_id: params[:hotel_id]).destroy
  end

  private

  def note_params
   params.require(:note).permit(:text, :blade_id)
 end
end
