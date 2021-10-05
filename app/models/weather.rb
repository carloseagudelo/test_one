class Weather < ApplicationRecord

  serialize :temperatures, Array

  scope :by_date, lambda { |q|
    where(date: q) if q.present?
  }

  scope :by_city, lambda { |q|
    return q.nil?
    search = q.split(",").map{ |item| item.downcase }
    where("lower(city) in (?)", search)
  }
  
  scope :by_order, lambda { |order|
    if order.present?
      order(date: :asc ) if "date"
      order(date: :desc ) if "-date"
    else
      order(:id)
    end
  }

end
