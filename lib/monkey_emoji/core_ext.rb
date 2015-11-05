String.class_eval do
  begin
    path = open(Rails.root.join("app","assets","emoji","emoji.json"))
    emoji_hex = JSON.parse(File.open(path).read)
    class_variable_set(:@@emoji_hex, emoji_hex)
    class_variable_set(:@@emoji_match_regexp, Regexp.new(emoji_hex.join("|").gsub!(/\*/,"\\*")))
  rescue Errno::ENOENT
    puts 'You must `bundle exec rake monkey_emoji:init` to use monkey_emoji'
    exit
  end

  def self.emoji_hex
    class_variable_get(:@@emoji_hex)
  end

  def self.emoji_matches
    class_variable_get(:@@emoji_match_regexp)
  end
  def encode_emoji
    gsub(String.class_variable_get(:@@emoji_match_regexp)) do |o|
      "{{#{o.unpack("U").map{|o|o.to_s(16)}.join("")}}}"
    end
  end

  def decode_emoji
    gsub(/{{([^}]*)}}/) do |o| 
      if Regexp.last_match.present?
        "#{[Regexp.last_match[1].to_i(16)].pack("U")}"
      else
        o
      end
    end
  end
end

# Add methods to NilClass to avoid annoying errors during string manipulation in case of nil
NilClass.class_eval do
  def encode_emoji
    nil
  end

  def decode_emoji
    nil
  end
end
