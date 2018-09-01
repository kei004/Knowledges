class Category < ApplicationRecord
    belongs_to :parent, class_name: 'Category', foreign_key: :parent_id
    has_many :children, class_name: 'Category', foreign_key: :parent_id
    
    def ancestors(category = self, result = [], include_self: true,　only_id: true)
        return result + [only_id ? category.id : category] if category.root?
        ancestors(category.parent, result, only_id: only_id) +
        (!include_self && id == category.id ? [] : [only_id ? category.id : category])
    end
    
    def descendants(category = self, array = [], include_self: true, only_id: true)
        array << (only_id ? self.id : self) if include_self && id == category.id
        return array + [only_id ? category.id : category] if category.children.blank?
        category.children.eager_load(:children).each do |cat|
            array << (only_id ? cat.id : cat)
            descendants(cat, array)
        end
        array
    end
end
