module CorrectResponseContentLength
  def self.included(base)
    base.alias_method_chain :set_content_length!, :string_bytesize
  end
  private
  def set_content_length_with_string_bytesize!
    if "1.8.7 or lator".respond_to?(:bytesize)
      unless body.respond_to?(:call) || (status && status[0..2] == '304')
        self.headers["Content-Length"] ||= body.bytesize
      end
    else
      set_content_length_without_string_bytesize!
    end
  end
end

module EncodeOutputBuffer
  def self.included(base)
    base.alias_method_chain :output_buffer=, :encoding
  end

  @@template_encoding = "UTF-8"
  mattr_accessor :template_encoding

  def output_buffer_with_encoding=(out)
    out && out.force_encoding(template_encoding)
    self.output_buffer_without_encoding = out
  end
end

module EncodeRenderedTemplate
  def self.included(base)
    base.alias_method_chain :render_template, :encode
  end

  def render_template_with_encode(v, l = {})
    render_template_without_encode(v, l).tap do |out|
      out && out.force_encoding("UTF-8")
    end
  end
end

ActionController::AbstractResponse.send(:include, CorrectResponseContentLength)
ActionView::Base.send(:include, EncodeOutputBuffer)
ActionView::Template.send(:include, EncodeRenderedTemplate)

