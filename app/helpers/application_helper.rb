module ApplicationHelper
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
end
