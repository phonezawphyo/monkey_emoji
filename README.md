#MonkeyEmoji
Encode and decode unicode emoji characters for saving in db that does not store 4 byte unicode characters.

Unicode characters are encoded into format `{{codepoint_hex}}` before being saved in db. For usage, please refer to the github page.

It injects `encode_emoji` and `decode_emoji` methods to String and NilClass. 
ActiveRecord::Base is also injected with `encode_emoji` class method so that attributes encodes emoji automatically before save.

#Usage
###Download the latest list of emoji.
```
bundle exec rake monkey_emoji:init
```
It will be saved in `app/assets/emoji/emoji.json`.
The list of emoji is used to perform regex matching to look for emoji to encode.

###Use in models
In your model add the following line to enable auto encoding before being saved into db.
```
encode_emoji :your_table_attribute_name
```

###String helpers
The following helper methods are provided for `String` and `NilClass`.
```
"😀smiley face".encode_emoji
# -> "{{1f600}} smiley face"

"{{1f600}} smiley face".decode_emoji
# -> "😀smiley face"

nil.encode_emoji
# -> nil

nil.decode_emoji
# -> nil
```
#Testing
```
cd test/dummy
bundle exec rake db:migrate RAILS_ENV=development
bundle exec rake db:migrate RAILS_ENV=production
cd ../../
bundle exec rake test
```

#License
This project uses MIT-LICENSE.
