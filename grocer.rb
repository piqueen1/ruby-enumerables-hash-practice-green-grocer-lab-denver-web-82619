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
    binding.pry
    
    if cart.key?(coupon[:item])
      #generate a key with variable first word depending on coupon
      coupon_item_name = "#{coupon[:item]} W/COUPON"
      cart[coupon_item_name] = {}

      #calculate price after coupon
      coupon_item_price = coupon[:cost] / coupon[:num]
      cart[coupon_item_name][:price] = coupon_item_price
      
      #append clearance key/value pair from original cart entry
      cart[coupon_item_name][:clearance] = cart[coupon[:item]][:clearance]

      #calculate and modify count on original cart entry
      if coupon.count && cart[coupon[:item]][:count] > coupon[:num]
        #binding.pry
        times_applied = cart[coupon[:item]][:count] / coupon[:num]
        remainder = cart[coupon[:item]][:count] % coupon[:num]
        #update discounted count
        discounted_count = times_applied * coupon[:num]
        cart[coupon_item_name][:count] = discounted_count
        #update original cart entry count (minus all discounted)
        cart[coupon[:item]][:count] = remainder
      end

      #goal:       removes the number of discounted items from the original item's count; calculate times_applied, remainder and discounted_count
      
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
