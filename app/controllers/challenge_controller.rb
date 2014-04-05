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



=begin
https://github.com/lschallenges/data-engineering


 bin/rails generate migration CreatePurchaseTable
 bin/rake db:migrate

 sqlite3 db/development.sqlite3
 
 #to see tables
 .tables

 #to see purchases
 select * from purchases;




#TODO

make item_price to currency
figure out openid

  
purchaser name  item description  item price  purchase count  merchant address  merchant name
Snake Plissken  $10 off $20 of food 10.0  2 987 Fake St Bob's Pizza
Amy Pond  $30 of awesome for $10  10.0  5 456 Unreal Rd Tom's Awesome Shop
Marty McFly $20 Sneakers for $5 5.0 1 123 Fake St Sneaker Store Emporium
Snake Plissken  $20 Sneakers for $5 5.0 4 123 Fake St Sneaker Store Emporium
=end