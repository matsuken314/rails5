class FoodsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  def index
    @foods = Food.order(:created_at)
  end

  def new
    @food = Food.new
  end

  def create
    food = current_user.foods.create!(food_params)
    redirect_to food
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit; end

  def update
    @food.update!(food_params)
    redirect_to @food
  end

  def destroy
    @food.destroy!
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :comment)
  end

  def set_post
    # 「自分の投稿」の中から URL の :id に対応する投稿を探す
    # 「他人の投稿」の場合はエラーを出す
    @food = current_user.foods.find_by(id: params[:id])
    redirect_to root_path, alert: "権限がありません" if @food.nil?
  end
end
