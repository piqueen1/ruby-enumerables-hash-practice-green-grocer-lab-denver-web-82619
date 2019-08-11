require "pry"

def consolidate_cart(cart)
  total_hash = {}
  
  cart.each do |item|
    if total_hash[item.keys[0]]
      #increase value of :count key by 1
      total_hash[item.keys[0]][:count] += 1
    else
      #add key/value pair, initialized :count = 0
      total_hash[item.keys[0]] = {}
      total_hash[item.keys[0]][:count] = 1
      total_hash[item.keys[0]][:price] = item.values[0][:price]
      total_hash[item.keys[0]][:clearance] = item.values[0][:clearance]
    end
  end
  
  total_hash
end

def apply_coupons(cart, coupons)

  coupons.each do |coupon|
    #binding.pry
    
    if cart.key?(coupon[:item])
      #generate a key with variable first word depending on coupon
      coupon_item_name = "#{coupon[:item]} W/COUPON"
      cart[coupon_item_name] = {}
      cart[coupon_item_name]
      
      #"AVOCADO W/COUPON"=>{:item=>"AVOCADO", :num=>2, :cost=>5.0}
      binding.pry
      
      #set price to !!!DO THIS NEXT!!!
      #cart["#{coupon[:item]} W/COUPON"] = coupon[:]
      #cart["#{coupon[:item]} W/COUPON"] = coupon[:count]
    end
  end
  
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
