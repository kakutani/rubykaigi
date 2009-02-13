if RUBY_VERSION >= "1.9"
  require 'ruby19_monkey'

  ActionView::Base.send(:include, Ruby19Monkey::ForceEncoding::OutputBuffer)
  ActionView::Template.send(:include, Ruby19Monkey::ForceEncoding::RenderResult)

  response_klass = (defined? ActionController::AbstractResponse) ?  ActionController::AbstractResponse : ActionController::Response
  response_klass.send(:include, Ruby19Monkey::StringBytesize::ResponseContentLength)
else
  # do nothing
end

