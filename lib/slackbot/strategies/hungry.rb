module Slackbot
  module Strategy
    class Hungry < ::Slackbot::Strategy::Base
      def search_terms
        ["food", "hungry", "eat", "ate", "eaten"]
      end

      def should_post?
        @db.new_content.each do |message|
          search_terms.each do |term|
            if message.has_key?("text") && message["text"].include?(term) && !message["text"].include?(text)
              return true
            end
          end
        end
        return false
      end
			
			def text
				"I already ate lunch"
			end

      def post
        chat_request = ApiRequest::Base.new("chat.postMessage", {username: "Ghost of Jeremiah", text: text})
        chat_request.make_request
      end
    end
  end
end
