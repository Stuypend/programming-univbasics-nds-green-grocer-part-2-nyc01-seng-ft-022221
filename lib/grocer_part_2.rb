require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)

  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart

if(coupons != nil && coupons.size > 0)
    coupons.each do
      |coupon|

      cart.each do
        |item|
        if(coupon[:item] == item[:item])
          item[:count] -= coupon[:num]
          new_thing = {}
          new_thing[:item] = "#{coupon[:item]} W/COUPON"
          new_thing[:price] = coupon[:cost]/coupon[:num]
          new_thing[:price] = new_thing[:price].round(2)
          new_thing[:clearance] = true
          new_thing[:count] = coupon[:num]
          cart.push(new_thing)
        end
      end
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
      item[:price] = item[:price].round(2)
    end
  end
  return cart
end

def checkout(cart, coupons)

  final = consolidate_cart(cart)
  final = apply_coupons(final, coupons)
  final = apply_clearance(final)
  total = 0

  final.each do
    |item|
    total += item[:price]*item[:count]
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
  {:item => "AVOCADO", :num => 2, :cost => 5.00}
]

xy = [
  {:item => "PEANUT BUTTER", :price => 3.00, :clearance => true,  :count => 2},
  {:item => "KALE", :price => 3.00, :clearance => false, :count => 3},
  {:item => "SOY MILK", :price => 4.50, :clearance => true,  :count => 1}
]

puts apply_clearance(xy)
