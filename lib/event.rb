class Event
	attr_reader :handlers
	def initialize
		@handlers = []
	end

	def subscribe(handler)
		@handlers.push(handler)
	end

	def unsubscribe(handler)
		@handlers.delete(handler)
	end

	def broadcast(*args)
		@handlers.each do |handler|
      handler.call(*args)
    end
	end
end