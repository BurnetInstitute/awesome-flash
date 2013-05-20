require "awesome-flash/engine"

module AwesomeFlash
  module ActionController
    def set_flash(type, *params)
      options = {:locals => {}, :now => false}
      options = options.update(params.extract_options!.symbolize_keys)
      options[:scope] ||= "awesome.flash.controller.#{controller_name}.#{action_name}.#{type}"
      message = t(options[:scope], options[:locals])
      message.each_key { |key| message[key] = t("#{options[:scope]}.#{key}", options[:locals]) } if message.is_a?(Hash)
      if options[:now]
        flash.now[type] = message
      else
        flash[type] = message
      end
    end
  end

  module ActionView
    def flash_messages
      flash_messages = flash.collect do |type, message|
        if message.is_a?(Hash)
          header = message[:header]
          body = message[:body]
        else
          header = message
        end
        render partial: 'awesome/flash/flash', locals: { type: type.to_s, header: header, body: body }
      end
      flash.discard
      flash_messages.join.html_safe
    end
  end
end

ActiveSupport.on_load(:action_controller) do
  include AwesomeFlash::ActionController
end

ActiveSupport.on_load(:action_view) do
  include AwesomeFlash::ActionView
end
