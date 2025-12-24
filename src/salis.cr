module Salis
  VERSION = "0.1.0"

  CODES = {
    :reset => "\e[0m",

    :bold      => "\e[1m",
    :dim       => "\e[2m",
    :italic    => "\e[3m",
    :underline => "\e[4m",
    :blink     => "\e[5m",
    :reverse   => "\e[7m",
    :hidden    => "\e[8m",
    :strike    => "\e[9m",

    :black   => "\e[30m",
    :red     => "\e[31m",
    :green   => "\e[32m",
    :yellow  => "\e[33m",
    :blue    => "\e[34m",
    :magenta => "\e[35m",
    :cyan    => "\e[36m",
    :white   => "\e[37m",

    :bright_black   => "\e[90m",
    :bright_red     => "\e[91m",
    :bright_green   => "\e[92m",
    :bright_yellow  => "\e[93m",
    :bright_blue    => "\e[94m",
    :bright_magenta => "\e[95m",
    :bright_cyan    => "\e[96m",
    :bright_white   => "\e[97m",

    :bg_black   => "\e[40m",
    :bg_red     => "\e[41m",
    :bg_green   => "\e[42m",
    :bg_yellow  => "\e[43m",
    :bg_blue    => "\e[44m",
    :bg_magenta => "\e[45m",
    :bg_cyan    => "\e[46m",
    :bg_white   => "\e[47m",

    :bg_bright_black   => "\e[100m",
    :bg_bright_red     => "\e[101m",
    :bg_bright_green   => "\e[102m",
    :bg_bright_yellow  => "\e[103m",
    :bg_bright_blue    => "\e[104m",
    :bg_bright_magenta => "\e[105m",
    :bg_bright_cyan    => "\e[106m",
    :bg_bright_white   => "\e[107m",
  }

  @@enabled : Bool = true

  @[AlwaysInline]
  def self.enabled? : Bool
    @@enabled
  end

  @[AlwaysInline]
  def self.enabled=(value : Bool)
    @@enabled = value
  end

  @[AlwaysInline]
  def self.supports_color? : Bool
    return false unless STDOUT.tty?
    term = ENV["TERM"]? || ""
    colorterm = ENV["COLORTERM"]? || ""
    !term.empty? && term != "dumb" || !colorterm.empty?
  end

  @[AlwaysInline]
  def self.auto_detect!
    @@enabled = supports_color?
  end

  @[AlwaysInline]
  def self.strip(text) : String
    text.to_s.gsub(/\e\[[0-9;]*m/, "")
  end

  {% for name, code in CODES %}
    {% if name != :reset %}
      @[AlwaysInline]
      def self.{{name.id}}(text) : String
        return text.to_s unless @@enabled
        "#{CODES[{{name}}]}#{text}#{CODES[:reset]}"
      end
    {% end %}
  {% end %}

  @[AlwaysInline]
  def self.colorize(text, *styles : Symbol) : String
    return text.to_s unless @@enabled
    codes = styles.map { |s| CODES[s] }.join
    "#{codes}#{text}#{CODES[:reset]}"
  end

  module Ext
    {% for name, code in CODES %}
      {% if name != :reset %}
        @[AlwaysInline]
        def {{name.id}} : String
          Salis.{{name.id}}(self)
        end
      {% end %}
    {% end %}
  end
end

class String
  include Salis::Ext
end
