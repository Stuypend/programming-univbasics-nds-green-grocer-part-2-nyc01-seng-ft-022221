require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  couponsb = coupons[0]
  cart.each do
    |item|
    if(coupons[:item] == item[:item])
      item[:count] -= couponsb[:num]
      new_thing = {}
      new_thing[:item] = "#{couponsb[:item]} W/COUPON"
      new_thing[:price] = couponsb[:cost]/couponsb[:num]
      new_thing[:clearance] = true
      new_thing[:count] = couponsb[:num]
      cart.push(new_thing)
    end
  end
  return cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
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
  {:item => "AVOCADO", :num => 2, :cost => 5.00}
]

puts apply_coupons(thing, otherthing)