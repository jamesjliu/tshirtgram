class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
    @sales = Sale.all
  end

  def show
  end

  def new
    @sale = Sale.new
  end

  def edit
  end

    
    def new
end

def create
  # Amount in cents
  @amount = 1500

  customer = Stripe::Customer.create(
    :email => 'current_user.email',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Tshirtgram T-Shirt',
    :currency    => 'gbp'
  )
  
  @addtosalestable=Sale.create(:email=>current_user.email, :user_id=>current_user.id, :amount=>@amount, :stripe_id=>customer.id, :stripe_token=>params[:stripeToken], :size=>params[:size][:size], :country=>params[:country][:country], :postal_code=>params[:postal_code][:postal_code], :address=>params[:address][:address], :picture_id=>params[:picture_id], :card_expiration=>Date.new(charge.card.exp_year, charge.card.exp_month, 1) )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to root_path
end
    
    
    
      
 
 
  def update

       respond_to do |format|
       if @sale.update(sale_params)
         format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
         format.json { render :show, status: :ok, location: @sale}
      else
         format.html { render :edit }
          format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
  end
  end

  def destroy
    @sale.destroy
      respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully deleted.' }
      format.json { head :no_content }
  end
  end

  private
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(:email, :user_id, :picture_id, :amount, :size, :address, :country, :stripe_id, :stripe_token, :card_expiration, :postal_code)
    end
end