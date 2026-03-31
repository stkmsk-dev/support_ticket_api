class TicketSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :status, :priority
end
