class CodeParser
  def initialize(rules)
    @rules = rules
  end

  def call(code)
    Proc.new do
      code.each_line do |line|
        line_without_comments = line.chomp.split('#').first.strip
        next if line_without_comments.empty?
        tokens = line_without_comments.split(' ')
        code = tokens.first
        args = tokens[1..tokens.size - 1]
        @rules.get_command(code).call(*args)
      end
    end
  end
end
