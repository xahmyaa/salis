# salis

A simple Crystal library to colorize and style terminal text.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     salis:
       github: xahmyaa/salis
   ```

2. Run `shards install`

## Usage

```crystal
require "salis"

# Chain styles on strings
puts "Hello".red.bold
puts "World".green.underline

# Or use module methods (accepts any type)
puts Salis.red(123)
puts Salis.colorize("Multi", :bold, :red, :bg_white)
```

### Terminal Detection

```crystal
Salis.supports_color?  # Check support
Salis.enabled = false  # Disable colors
Salis.auto_detect!     # Auto-detect
```

### Strip ANSI

```crystal
"colored".red.strip_ansi  # => "colored"
```

## Available styles

| Category | Options |
|----------|---------|
| Styles | `bold`, `dim`, `italic`, `underline`, `blink`, `reverse`, `hidden`, `strike` |
| Colors | `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white` |
| Bright | `bright_black`, `bright_red`, `bright_green`, `bright_yellow`, `bright_blue`, `bright_magenta`, `bright_cyan`, `bright_white` |
| Background | `bg_black`, `bg_red`, `bg_green`, `bg_yellow`, `bg_blue`, `bg_magenta`, `bg_cyan`, `bg_white` |
| Bg Bright | `bg_bright_black`, `bg_bright_red`, `bg_bright_green`, `bg_bright_yellow`, `bg_bright_blue`, `bg_bright_magenta`, `bg_bright_cyan`, `bg_bright_white` |

## Contributing

1. Fork it (<https://github.com/xahmyaa/salis/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [xahmyaa](https://github.com/xahmyaa) - creator and maintainer
