class EntriesController < ApplicationController
  before_action :find_entry, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @entries = current_user.entries

      if params[:category].present?
        @entries = @entries.joins(:category).where(categories: { feeling: params[:category]})
      end
    else
      @entries = Entry.all
    end
    @entries.order('created_at DESC')
  end

  def new
    @entry = current_user.entries.build
    @categories = Category.all.map { |c| [c.feeling, c.id] }
  end

  def create
    @entry = current_user.entries.build(entry_params)
    @entry.category_id = params[:category_id]

    if @entry.save
      redirect_to root_path, notice: 'Entry has been added'
    else
      @categories = Category.all.map { |c| [c.feeling, c.id] }
      render 'new'
    end
  end

  def show
  end

  def edit
    @categories = Category.all.map { |c| [c.feeling, c.id] }
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
    params.require(:entry).permit(:date, :foods, :notes, :category_id, :entry_img)
  end

  def find_entry
    @entry = Entry.find(params[:id])
  end

end
