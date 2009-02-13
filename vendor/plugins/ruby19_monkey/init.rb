if RUBY_VERSION >= "1.9"
  require 'ruby19_monkey'

  ActionView::Base.send(:include, Ruby19Monkey::ForceEncoding::OutputBuffer)
  ActionView::Template.send(:include, Ruby19Monkey::ForceEncoding::RenderResult)

  if Rails::VERSION::STRING >= "2.3.0"
    ActionController::Response.send(:include, Ruby19Monkey::StringBytesize::ResponseContentLength)
    ActionController::Dispatcher.send(:include, Ruby19Monkey::StringEach::RackAppCall)
    ::Rack::File.send(:include, Ruby19Monkey::StringEach::RackAppCall)
  else
    ActionController::AbstractResponse.send(:include, Ruby19Monkey::StringBytesize::ResponseContentLength)
  end
else
  # do nothing
end

