class NotifySlackJob < ApplicationJob
  queue_as :default

  def perform(ticket_id)
    ticket = Ticket.find(ticket_id)

    HTTParty.post(
      ENV["SLACK_WEBHOOK_URL"],
      body: {
        text: "新しいチケットが作成されました: #{ticket.title}"
      }.to_json,
      headers: { "Content-Type" => "application/json" }
    )
  end
end
