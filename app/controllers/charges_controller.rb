class ChargesController < ApplicationController
  def create
  # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :source  => params[:token]
    )

    Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'gbp'
    )

    render json: { message: "Payment accepted" }, status: :ok

  rescue Stripe::CardError => e
    render json: { errors: [e.message] }, status: 500
  end
end
