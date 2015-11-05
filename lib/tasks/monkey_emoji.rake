#coding: utf-8
require "open-uri"

namespace :monkey_emoji do
  desc "Download emoji codes from unicode.org"
  task :init do
    dir = Rails.root.join("app","assets","emoji")
    Dir.mkdir(dir) unless Dir.exist?(dir)

    unicode_url = 'http://www.unicode.org/Public/emoji/1.0/emoji-data.txt'
    file_contents = open(unicode_url).read
    emoji_code = file_contents
      .split("\n")
      .reject{|o|o.starts_with? "#"}
      .map{ |x| x.split(" ;\t")[0] }
      .map{|o|o.split(" ").map{|o|[o.to_i(16)].pack("U")}.join("")}
    output_file = dir.join('emoji.json')

    File.write(output_file, JSON.pretty_generate(emoji_code))
  end

end
