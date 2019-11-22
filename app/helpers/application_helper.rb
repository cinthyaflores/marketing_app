# frozen_string_literal: true

require_dependency "custom_form_builder"

ActionView::Base.default_form_builder = CustomFormBuilder

module ApplicationHelper
  def flash_class(category)
    case category
    when 'notice' then 'notification is-primary'
    when 'success' then 'notification is-danger'
    else 'notification is-danger'
    end
  end
end
