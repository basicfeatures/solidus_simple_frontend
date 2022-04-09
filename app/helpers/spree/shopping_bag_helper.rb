module Spree
  module ShoppingBagHelper
    def menu_trigger(label = nil)
      label = label ? h(label) : t("spree.bag")
      count = current_order ? current_order.item_count : 0
      count_tag = content_tag(:span, count, class: "count")

      link_to "#{ label } #{ count_tag }".html_safe, spree.cart_path, class: "menu_trigger"
    end
  end
end

