class EntriesController < ApplicationController
  before_action :find_entry, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def entries_params
    params.require(:entries).permit(:date, :foods, :notes)
  end

  def find_entry
    @entry = Entry.find(params[:id])
  end

end
