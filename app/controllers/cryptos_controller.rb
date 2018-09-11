class CryptosController < ApplicationController
  before_action :set_crypto, only: [:edit, :show, :update, :destroy] 
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    @crypto = Crypto.all
  end

  def new
    @crypto= Crypto.new
  end

  def edit
    authorize @crypto
  end

  def create
    @crypto = Crypto.new(crypto_params)
    @crypto.user_id = current_user.id

		if @crypto.save
			redirect_to @crypto, notice: 'Your crypto was created successfully'
		else
			render :new
		end
  end

  def update
        authorize @crypto
        @rental.update(rental_params)
        redirect_to @rental, notice: 'Your rental was created successfully'    
  end

  private

  def set_crypto
      @crypto = Crypto.find(params[:id])
  end

  def crypto_params
      params.require(:crypto).permit(
                                  :symbol, 
                                  :cost_per, 
                                  :amount_owned, 
                                  )
  end  

end
