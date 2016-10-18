class Request < ApplicationRecord




  after_initialize :set_defaults

  def self.search(keyword)
    # where(["title ILIKE ?", "%#{keyword}%"]).or(where(["description ILIKE ?", "%#{keyword}%"]))
    # where(["title ILIKE ?", "%#{keyword}%"])|where(["description ILIKE ?", "%#{keyword}%"])
  end

  

private
  def set_defaults
    # self.price ||= 1
    # self.sale_price ||=self.price
    # self.hit_count ||=0
    self.mark ||= false
  end
end
