class Command
  attr_reader :code, :action

  def initialize(code, action)
    @code = code
    @action = action
  end

  def call(*args)
    action.call(*args)
  end
end
