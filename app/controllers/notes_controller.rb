class NotesController < ApplicationController
layout :layout?, only: [:index,:new,:destroy,:show, :create]

def index
@category = Category.find_by(:name=>params[:category].present? ? params[:category] : 'work')
@notes = Note.where(category_id: @category.id).order("created_at DESC")
@note= Note.new
end

def new
	@note= Note.new(:parent_id => params[:parent_id])

	@notes=Note.all
	end

def create
	@note= Note.new(note_params)
	if @note.save
		redirect_to notes_path
	else
		render"new"
	end
end

def show
	@note= Note.find(params[:id])
end

def edit
@note= Note.find(params[:id])
end

def destroy
	@note= Note.find(params[:id])
	@note.destroy
	redirect_to notes_path
end

def update
	@note= Note.find(params[:id])
	if @note.update(note_params)
		redirect_to new_notes_path
	else
		render "edit"
	end
end

def note_params
	params.require(:note).permit!
end

end
