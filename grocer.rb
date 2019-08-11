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
  hash_after_coupons = {}
  
  coupons.each do |coupon|
    if cart.keys.index(coupon.keys[0])
      puts "I'm here"
    end
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
