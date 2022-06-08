# frozen_string_literal: true

class NullBoard
	def valid_position?(x:, y:)
		false
	end

	def occupy(obj:, x:, y:)
    false
	end
end
