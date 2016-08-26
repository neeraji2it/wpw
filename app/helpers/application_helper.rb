module ApplicationHelper
	def nested_notes(messages)
    messages.map do |message, sub_messages|
      render(message) + content_tag(:div, nested_notes(sub_messages), :class => "nested_messages")
    end.join.html_safe
  end
end
