class MeeseeksController < ApplicationController
  before_action :set_meeseek, only: %i[show edit update destroy]

  def index
    @meeseeks = Meeseek.all
  end

  def show
  end

  def new
    @meeseek = Meeseek.new
  end

  def edit
  end

  def create
    @meeseek = Meeseek.new(meeseek_params)
    @meeseek.user = current_user
    if @meeseek.save
      redirect_to meeseek_path(@meeseek)
    else
      render :new, status: unprocessable_entity
    end
  end

  def update
    if @meeseek.update(meeseek_params)
      redirect_to @meeseek, notice: "Meeseek was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meeseek.destroy
    redirect_to meeseeks_path, notice: "Meeseek was successfully destroyed"
  end

  private

  def meeseek_params
    params.require(:meeseek).permit(:postcode)
  end

  def set_meeseek
    @meeseek = Meeseek.find(params[:id])
  end
end
