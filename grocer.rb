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
      
      if !cart[coupon_item_name]
       cart[coupon_item_name] = {}
       coupon_item_price = coupon[:cost] / coupon[:num]
       cart[coupon_item_name][:price] = coupon_item_price
       cart[coupon_item_name][:clearance] = cart[coupon[:item]][:clearance]
      end
      
      #binding.pry
      #calculate and modify count on original cart entry
      if cart[coupon[:item]][:count] >= coupon[:num]
        
        #create or update count of coupon item in cart
        discounted_count = cart[coupon_item_name][:count] ?
          cart[coupon_item_name][:count] + coupon[:num] :
          coupon[:num]
        cart[coupon_item_name][:count] = discounted_count
        
        #binding.pry
        #update original cart entry count (minus all discounted)
        cart[coupon[:item]][:count] = cart[coupon[:item]][:count] - coupon[:num]
      end

      #goals:       
      #removes the number of discounted items from the original item's count
      #augments count of cart's couponed item by how many were discounted
      
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
