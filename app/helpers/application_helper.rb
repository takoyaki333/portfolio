module ApplicationHelper
  include Gretel::ViewHelpers

  def category_image(category)
    case category
    when "mental"
      "mental.png"
    when "physical"
      "physical.png"
    when "lifestyle"
      "lifestyle.png"
    else
      "default.png"
    end
  end

  def category_labels
    {
      "mental" => "メンタルケア",
      "physical" => "体づくり",
      "lifestyle" => "生活習慣"
    }
  end

  def menu_link_to(name, path, options = {})
    classes = "block px-4 py-2 text-gray-700 hover:bg-gray-100"
    link_to name, path, options.merge(class: classes)
  end
end
