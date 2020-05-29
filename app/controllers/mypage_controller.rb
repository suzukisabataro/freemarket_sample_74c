class MypageController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil).limit(13)
  end

  def logout
    @parents = Category.where(ancestry: nil).limit(13)
  end

  def credit_card
    @parents = Category.where(ancestry: nil).limit(13)
  end


end
