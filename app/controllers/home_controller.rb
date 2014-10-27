class HomeController < ApplicationController
  def profile
    @profile=User.find(params[:user_id])
  end

  def orders
    @usersorder=Sale.where(:user_id=>current_user.id)
  end

  def order_complete
  end

  def about
  end

  def contact
  end
end
