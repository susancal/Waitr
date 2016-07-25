class WaitingroomChannel < ApplicationCable::WaitingroomChannel
	def subscribed
		stream_from 'waiiting_players'
		# Was stream_from 'messages' in the example
	end
end