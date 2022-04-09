module Spree
  module CheckoutHelper
    def checkout_states
      @order.checkout_steps
    end

    def checkout_progress
      states = checkout_states

      items = states.map do |state|
        text = I18n.t("spree.order_state.#{ state }").titleize

        current_index = states.index(@order.state)
        state_index = states.index(state)

        if state == @order.state
          options = { class: "active" }
        end

        if state_index < current_index
          text = link_to text, checkout_state_path(state)
        end

        content_tag :a, text, options
      end
      content_tag(:div, items.join.html_safe, class: "checkout_progress")
    end
  end
end

