class Rules
  def initialize(*commands)
    @commands = {}
    commands.each { |command| @commands[command.code] = command }
  end

  def get_command(code)
    @commands[code]
  end
end
