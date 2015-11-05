require 'rails'
module MonkeyEmoji
  class Railtie < Rails::Railtie
    railtie_name :monkey_emoji

    rake_tasks do
      load "tasks/monkey_emoji.rake"
    end

    initializer "Load monkey_emoji initializers" do
      require "monkey_emoji/core_ext"
      require "monkey_emoji/emoji_savable"
    end
  end
end
