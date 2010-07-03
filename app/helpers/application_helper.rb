# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def actions_for(record)
    record_type = record.class.to_s.downcase
    links = []
    # links << link_to(image_tag('mini-page_show.gif', :alt => 'show event'), [:admin, record])
    links << link_to(image_tag('mini-page_edit.gif', :alt => 'edit event'), self.send("edit_admin_#{record.class.to_s.downcase}_path", record))
    links << link_to(image_tag('mini-page_delete.gif', :alt => 'delete event'), [:admin, record], :confirm => 'Are you sure?', :method => :delete)
    links << external_link_for(record)
    links.join(' ')
  end

  def external_link_for(record)
    if record.respond_to?(:link) || record.respond_to?(:url)
      link = record.respond_to?(:link) ? record.link : record.url
      link_to(image_tag('external_link.png'), link, :target => '_blank') unless link.blank?
    end
  end

  def internal_link_for(record, options)
    name = options[:name]
    url  = options[:url]
    if name || record.respond_to?(:name) || record.respond_to?(:title)
      name ||= record.respond_to?(:name) ? record.name : record.title
      name = name.truncate(options[:length]) if options[:length]
      url ||= self.send("admin_#{record.class.to_s.downcase}_path", record)
      link_to(name, url) unless (name.blank? || url.blank?)
    end
  end
end
