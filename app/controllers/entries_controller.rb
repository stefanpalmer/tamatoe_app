class EntriesController < ApplicationController
  before_action :find_entry, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
      @entries = Entry.all.order("created_at DESC")
    else
      @category_id = Category.find_by(feeling: params[:category]).id
      @entries = Entry.where(:category_id => @category_id).order('created_at DESC')
    end
  end

  def new
    @entry = current_user.entries.build
    @categories = Category.all.map{ |c| [c.feeling, c.id] }
  end

  def create
    @entry = current_user.entries.build(entry_params)
    @entry.category_id = params[:category_id]

    if @entry.save
      redirect_to root_path, notice: 'Entry has been added'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @categories = Category.all.map{ |c| [c.feeling, c.id] }
  end

  def update
    @entry.category_id = params[:category_id]
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
    params.require(:entry).permit(:date, :foods, :notes, :category_id)
  end

  def find_entry
    @entry = Entry.find(params[:id])
  end

end
