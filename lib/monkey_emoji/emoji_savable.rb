module MonkeyEmoji
  module EmojiSavable
    extend ActiveSupport::Concern

    included do
      def parse_emoji(attr)
        value = self[attr]

        if value.present?
          value = value.encode_emoji
          self[attr] = value
        end
      end
    end

    module ClassMethods
      def encode_emoji(*args)
        args.each do |arg|
          before_save "parse_emoji(:#{arg})"
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, MonkeyEmoji::EmojiSavable
