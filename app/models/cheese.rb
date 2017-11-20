class Cheese < ApplicationRecord
  after_destroy_commit :remove_cheese_from_orderings

  def self.default
    @@default ||= find_by_name("Nature")
  end

  private
    def remove_cheese_from_orderings
      Ordering.all.to_a.each do |ordering|
        if ordering.cheeses.keys.include?(id)
          ordering.cheeses[self.class.default.id] += ordering.cheeses.delete(id)
          ordering.save
        end
      end
    end
end
