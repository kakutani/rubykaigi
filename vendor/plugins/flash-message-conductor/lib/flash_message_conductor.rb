# ArgonHelpers

module PlanetArgon 
  module FlashMessageConductor
    FLASH_MESSAGE_TYPES = [ :error, :notice, :message ]
    
    module ControllerHelpers
      def add_error(msg, options = {})
        set_flash(:error, msg, options )
      end

      def add_notice(msg, options = {})
        set_flash(:notice, msg, options )
      end

      def add_message(msg, options = {})
        set_flash(:message, msg, options )
      end
      
      protected
        def set_flash(type, msg, options)
          flash[type] = msg
          
          options[:state].to_sym if options[:state]
          
          case options[:state]
          when :discard
            flash.discard(type)
          when :now
            flash.now[type] = msg
          when :keep
            flash.keep(type)
          end
            
          if options[:fade] == true
            flash[:fade] = 'fade'
          end
        end
    end
  
    module ViewHelpers
      def render_flash_message( css_class, message = "", fade_option = "" ) 
        return "" if message.nil? or message.blank?
        content_tag( "p", message, :class => "#{css_class} #{fade_option}" )
      end
    
      def render_flash_messages( div_id = "flash_messages", div_class = "" )
        div_content = ''
        FLASH_MESSAGE_TYPES.each do |key|
          div_content << render_flash_message( key.to_s, flash[key], flash[:fade] ) unless flash[key].blank?
        end
        if div_content.blank?
          return ""
        else
          return content_tag( 'div', div_content, :id => div_id, :class => div_class )
        end
      end
      
      def flash_message_set?
        flash_set = false
        FLASH_MESSAGE_TYPES.each do |key|
          flash_set = true unless flash[key].blank?
        end
        return flash_set
      end
    end
  end
end