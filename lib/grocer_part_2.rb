require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)

  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart

  couponsb = coupons[0]
  cart.each do
    |item|
    if(couponsb[:item] == item[:item])
      item[:count] -= couponsb[:num]
      new_thing = {}
      new_thing[:item] = "#{couponsb[:item]} W/COUPON"
      new_thing[:price] = couponsb[:cost]/couponsb[:num]
      new_thing[:price].round(2)
      new_thing[:clearance] = true
      new_thing[:count] = couponsb[:num]
      cart.push(new_thing)
    end
  end
  return cart

end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart

  cart.each do
    |item|
    if(item[:clearance])
      item[:price] *= 0.8
      item[:price].round(2)
    end
  end
  return cart
end

def checkout(cart, coupons)

  final = apply_coupons(cart, coupons)
  final = apply_clearance(final)
  total = 0

  final.each do
    |item|
    total += item[:price]*item[]:count]
  end

  return total > 100 ? (total*0.9).round(2) : total
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end


thing = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1}
]

otherthing = [
  {:item => "PEANUT BUTTER", :price => 3.00, :clearance => true,  :count => 2},
  {:item => "KALE", :price => 3.00, :clearance => false, :count => 3},
  {:item => "SOY MILK", :price => 4.50, :clearance => true,  :count => 1}
]

puts apply_clearance(otherthing)
