class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end
  
  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    customer = Customer.find(current_customer.id)
    if customer.update(customer_params)
      redirect_to customers_path, notice: "更新しました"
    else
      @customer = customer
      render :edit
    end
  end
  
  def leave
  end
  
  def withdraw
    customer = Customer.find(current_customer.id)
    customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
      :postal_code, :address, :telephone_number, :email)
    end
  
end
