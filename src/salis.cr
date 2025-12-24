module Salis
  VERSION = "0.1.0"

  CODES = {
    :reset => "\e[0m",

    # Styles
    :bold      => "\e[1m",
    :dim       => "\e[2m",
    :italic    => "\e[3m",
    :underline => "\e[4m",
    :blink     => "\e[5m",
    :reverse   => "\e[7m",
    :hidden    => "\e[8m",
    :strike    => "\e[9m",

    # Couleurs
    :black   => "\e[30m",
    :red     => "\e[31m",
    :green   => "\e[32m",
    :yellow  => "\e[33m",
    :blue    => "\e[34m",
    :magenta => "\e[35m",
    :cyan    => "\e[36m",
    :white   => "\e[37m",

    # Couleurs bright
    :bright_black   => "\e[90m",
    :bright_red     => "\e[91m",
    :bright_green   => "\e[92m",
    :bright_yellow  => "\e[93m",
    :bright_blue    => "\e[94m",
    :bright_magenta => "\e[95m",
    :bright_cyan    => "\e[96m",
    :bright_white   => "\e[97m",

    # Background
    :bg_black   => "\e[40m",
    :bg_red     => "\e[41m",
    :bg_green   => "\e[42m",
    :bg_yellow  => "\e[43m",
    :bg_blue    => "\e[44m",
    :bg_magenta => "\e[45m",
    :bg_cyan    => "\e[46m",
    :bg_white   => "\e[47m",

    # Background bright
    :bg_bright_black   => "\e[100m",
    :bg_bright_red     => "\e[101m",
    :bg_bright_green   => "\e[102m",
    :bg_bright_yellow  => "\e[103m",
    :bg_bright_blue    => "\e[104m",
    :bg_bright_magenta => "\e[105m",
    :bg_bright_cyan    => "\e[106m",
    :bg_bright_white   => "\e[107m",
  }

  {% for name, code in CODES %}
    {% if name != :reset %}
      @[AlwaysInline]
      def self.{{name.id}}(text : String) : String
        "#{CODES[{{name}}]}#{text}#{CODES[:reset]}"
      end
    {% end %}
  {% end %}

  @[AlwaysInline]
  def self.colorize(text : String, *styles : Symbol) : String
    codes = styles.map { |s| CODES[s] }.join
    "#{codes}#{text}#{CODES[:reset]}"
  end
end
