class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = Note.all

    render json: @notes
  end

  # GET /notes/1
  def show
    if @note.audio_file.attached?
      url = Rails.application.routes.url_helpers.rails_blob_url(@note.audio_file, only_path: true)
      render json: {id: @note.id, title: @note.title, description: @note.description, parent_note_id: @note.parent_note_id, tree_id: @note.tree_id, starred: @note.starred, user_id: @note.user_id, audio_url: url}
    else
      render json: @note
    end 
  end

  # POST /notes
  def create
    @tree = Tree.find(params[:tree_id])
    @note = @tree.notes.build(note_params)

    if @note.save
      render json: @note, status: :created#, location: tree_note_path(@tree, @note)
      # status created sends 201
      # what does the above code do? location takes a route helper. was just @note. needs nested route helper
      # 500 Internal Server Error in 126ms (ActiveRecord: 2.0ms | Allocations: 38385)
      # NoMethodError (undefined method `note_url' for #<NotesController:0x00007fffe88c5240>):  
      # seems like the scaffold created some methods that don't know notes is a nested resource
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if params[:note][:audio_file]
      
      @note.audio_file.attach(params[:note][:audio_file])
      # looks like the file is saved successfully but i get this error: 
      # TypeError (no implicit conversion of Array into String):
      # in byebug console: 
      # *** NameError Exception: uninitialized constant #<Class:0x00007f0c0cb60908>::Analyzable
      # Did you mean?  ActiveStorage::Analyzer
      # hits this error and rollsback
      # url = Rails.application.routes.url_helpers.rails_blob_url(@note.audio_file, host: )
      url = Rails.application.routes.url_helpers.rails_blob_url(@note.audio_file, only_path: true)
      render json: {messae: "Attached to File", url: url}
    else 
      if @note.update(note_params)
        render json: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    end
    
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:title, :description, :starred, :parent_note_id, :user_id, :audio_file)
    end
end
