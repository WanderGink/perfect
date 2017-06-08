class ChargesController < ApplicationController
  def new
  end

  def create
    @amount = params[:order][:subtotal]

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Rails stripe customer",
      currency: "usd"
    )
  rescue Stripe::CardError => error
    flash[:error] = error.message
    redirect_to new_charge_url
  end
end
