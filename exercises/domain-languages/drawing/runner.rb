if __FILE__ == $0
  require_relative 'code_parser'
  require_relative 'rules'
  require_relative 'command'

  code_file = File.open('rectangle.draw')
  code_string = code_file.read
  code_file.close

  rules = Rules.new(
    Command.new('P', Proc.new { |pen|      puts("select pen #{pen}") } ),
    Command.new('D', Proc.new {            puts('pen down') } ),
    Command.new('U', Proc.new {            puts('pen up') } ),
    Command.new('N', Proc.new { |distance| puts("draw west #{distance}cm") }),
    Command.new('S', Proc.new { |distance| puts("draw south #{distance}cm") }),
    Command.new('E', Proc.new { |distance| puts("draw east #{distance}cm") }),
    Command.new('W', Proc.new { |distance| puts("draw west #{distance}cm") })
  )

  parser = CodeParser.new(rules)
  executable = parser.call(code_string)
  executable.call
end
