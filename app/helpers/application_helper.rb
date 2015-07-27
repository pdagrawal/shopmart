module ApplicationHelper
  def all_available_categories
    return Category.all.reject { |category| category.products.blank? }
  end
end
