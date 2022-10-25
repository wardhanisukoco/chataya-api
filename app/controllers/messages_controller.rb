class MessagesController < ApplicationController
  before_action :set_room

  # GET /rooms/:room_id/messages
  def index
    @messages = @room.messages.paginate(page: params[:page], per_page: 20).order('id ASC')
    result = {}
    result[:messages] = @messages
    result[:session_id] = session_id[:value]
    json_response(result, :created)
  end

  # POST /rooms/:room_id/messages
  def create
    room = Room.find(params[:room_id])
    message = room.messages.new(message_params)
    message.session_id = session_id
    if message.save!
      ActionCable.server.broadcast "room_#{room.id}", message: message
    end
    json_response(room, :created)
  end

  private

  def message_params
    params.permit(:content)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

end