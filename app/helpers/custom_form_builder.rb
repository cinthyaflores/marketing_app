# frozen_string_literal: true

class CustomFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  def field_with_label(attribute, type: :text_field, **options)
    build_input(attribute, type, **options)
  end

  def date_field_with_label(attribute, type: :date_field, **options)
    build_input(attribute, type, **options)
  end

  def datetime_field_with_label(attribute, type: :datetime_local_field, **options)
    build_input(attribute, type, **options)
  end

  def hidden_field(attribute, type: :text_field, **options)
    css_class = options.dig(:class)
    label_class = options.dig(:label_class)
    error_class = object.errors.include?(attribute) ? "is-danger" : ""

    options[:class] = "input #{error_class} #{css_class}"

    field_input = self.send(type, attribute, **options)

    hidden_field_container(field_input)
  end

  def select_with_label(attribute, choices, options = {}, html_options = {})
    css_class = options.dig(:class)
    error_class = object.errors.include?(attribute) ? "is-danger" : ""
    options[:prompt] = I18n.t(attribute, scope: "helpers.prompt.models.#{@object.class.name.underscore}.attributes") if options[:prompt]

    field_label = label(attribute, class: "label")
    field_select = select(attribute, choices, options, **html_options)

    select_container = content_tag :div, class: "control" do
      content_tag :div, class: "select #{css_class} #{error_class}" do
        raw(field_select)
      end
    end

    content_tag :div, class: "field" do
      raw(field_label + select_container)
    end
  end

  def build_input(attribute, type, **options)
    css_class = options.dig(:class)
    label_class = options.dig(:label_class)
    error_class = object.errors.include?(attribute) ? "is-danger" : ""

    options[:class] = "input #{error_class} #{css_class}"

    field_label = label(attribute, class: "label #{label_class}")
    field_input = self.send(type, attribute, **options)

    field_container(field_label, field_input)
  end

  def field_container(field_label, field_input, field_error = nil)
    control = content_tag(:div, class: "control") do
      raw(field_label + field_input)
    end

    content_tag(:div, class: "field") do
      raw(control + field_error)
    end
  end

  def hidden_field_container(field_input, field_error = nil)
    control = content_tag(:div, class: "control") do
      raw(field_input)
    end

    content_tag(:div, class: "field d-none") do
      raw(control + field_error)
    end
  end

  def field_submit(value = nil, options = {})
    options[:class] = "button #{options[:class]}"

    content_tag :div, class: "field" do
      content_tag :div, class: "control" do
        submit(value, options)
      end
    end
  end

  def error_help(field, value_or_options = nil, options = {})
    if value_or_options.is_a?(Hash)
      options = value_or_options
    else
      value = value_or_options
    end

    options[:id] = options.dig(:id) || "#{object.class.name.underscore}_#{field}"
    options[:class] = "help is-danger #{options[:class]}"

    content_tag(:p, value, options)
  end
end
