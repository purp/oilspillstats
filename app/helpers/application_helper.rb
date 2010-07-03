# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def actions_for(record)
    record_type = record.class.to_s.downcase
    links = []
    # links << link_to(image_tag('mini-page_show.gif', :alt => 'show event'), [:admin, record])
    links << link_to(image_tag('mini-page_edit.gif', :alt => 'edit event'), self.send("edit_admin_#{record_type}_path", record))
    links << link_to(image_tag('mini-page_delete.gif', :alt => 'delete event'), [:admin, record], :confirm => 'Are you sure?', :method => :delete)
    links << external_link_for(record)
    links.join(' ')
  end

  def external_link_for(record)
    link_to(image_tag('external_link.png'), record.link, :target => '_blank') if record.respond_to?(:link) && !record.link.blank?
  end

  def internal_link_for(record, options)
    record_type = record.class.to_s.downcase
    title = options[:title]
    link  = options[:link]
    if title || record.respond_to?(:title)
      title ||= record.title
      title = title.truncate(options[:length]) if options[:length]
      link ||= self.send("admin_#{record_type}_path", record)
      link_to(title, link) unless (title.blank? || link.blank?)
    end
  end
end
