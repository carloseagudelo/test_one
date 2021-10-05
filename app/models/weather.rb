class Weather < ApplicationRecord

  serialize :temperatures, Array

  scope :by_date, lambda { |q|
    where(date: q) if q.present?
  }

  scope :by_city, lambda { |q|
    where("lower(city) in (?)", q.split(",").map(&:downcase) ) if q.present?
  }
  
  scope :by_order, lambda { |order|
    if order.present?
      order(date: :asc ) if order.eql? "date"
      order(date: :desc ) if order.eql? "-date"
    else
      order(:id)
    end
  }

end
