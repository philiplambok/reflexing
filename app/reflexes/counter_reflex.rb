class CounterReflex < ApplicationReflex
  def increment(step_param = 1)
    step = element.dataset[:step].to_i || step_param
    current_count = element.dataset[:count].to_i
    @count = current_count + step
    cable_ready.console_log(message: "Cable Ready rocks!").broadcast
    flash[:message] = "Hello world! #{rand(1..100)}"
  end
end