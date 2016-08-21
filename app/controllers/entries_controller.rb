class EntriesController < ApplicationController
  before_action :find_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.all.order('created_at DESC')
  end

  def new
    @entry = current_user.entries.build
  end

  def create
    @entry = current_user.entries.build(entry_params)

    if @entry.save
      redirect_to root_path, notice: 'Entry has been added'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      redirect_to entry_path(@entry)
    else
      render 'edit'
    end
  end

  def destroy
    @entry.destroy
    redirect_to entry_path
  end

  private

  def entry_params
    params.require(:entry).permit(:date, :foods, :notes)
  end

  def find_entry
    @entry = Entry.find(params[:id])
  end

end
