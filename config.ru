require "./lib/hello"
require "./lib/bye"
require "./lib/not_found"

run Proc.new { |env| ["200", { "Content-Type" => "text/html" }, [get_resp(env)]] }

def get_resp(env)
  const = env["PATH_INFO"].split("-").last.capitalize
  Object.const_get(const).new.say

  rescue NameError
  NotFound.new.say
end

