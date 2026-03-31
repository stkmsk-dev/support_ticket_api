class NotifySlackJob < ApplicationJob
  queue_as :default

  def perform(ticket_id)
    ticket = Ticket.find(ticket_id)

    puts "New ticket created: #{ticket.title}"
  end
end
