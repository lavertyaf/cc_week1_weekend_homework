def pet_shop_name(words)
  return words[:name]
end

def total_cash(cash)
 return cash[:admin][:total_cash]
end

def add_or_remove_cash(shop_cash, change)
shop_cash[:admin][:total_cash] += change
end

def pets_sold(number)
return number[:admin][:pets_sold]
end

def increase_pets_sold(number, new_sales)
  number[:admin][:pets_sold] += new_sales
end

def stock_count(pet_shop)
return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed_name)
  number_of_dogs_for_breed = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed_name
      number_of_dogs_for_breed.push(pet)
    end
  end
  return number_of_dogs_for_breed
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    return pet if pet[:name] == pet_name
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
pet_shop[:pets].push(new_pet)
end

def customer_pet_count(number)
return number[:pets].count
end

def add_pet_to_customer(customers_pets, new_pet)
  customers_pets[:pets].push(new_pet)
end

def customer_can_afford_pet(customers, new_pet)
  if customers[:cash] < new_pet[:price]
    return false
    else
    return true
  end
end


def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop, pet[:price])
  end
end
