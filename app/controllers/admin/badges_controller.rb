class Admin::BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      flash.alert = t('.success')
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      flash.alert = t('.success')
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    flash.alert = t('.success')
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image, :rule, :parametr)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
