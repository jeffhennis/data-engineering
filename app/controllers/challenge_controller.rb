class ChallengeController < ApplicationController
  before_filter :require_authentication

  def show
    if !params[:challenge_data].nil?
      @total_revenue = 0
      index = 0
      params[:challenge_data].split("\r\n").each do |line|
        if index > 0
          purchase_elements = line.split(/\t/)
          p = Purchase.new
          p.purchaser_name = purchase_elements[0]
          p.item_description = purchase_elements[1]
          p.item_price = purchase_elements[2].to_f
          p.items_count = purchase_elements[3].to_i
          p.merchant_address = purchase_elements[4]
          p.merchant_names = purchase_elements[5]
          @total_revenue += p.item_price * p.items_count

          p.save
          @submitted = true
        end

        index +=1
      end
    end
  end



  def logout
    session.clear
    redirect_to '/'
  end
end

