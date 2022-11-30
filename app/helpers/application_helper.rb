# frozen_string_literal: true

module ApplicationHelper
  def route_active?(action, class_name = 'active')
    current_page?(action) ? class_name : ''
  end
end
