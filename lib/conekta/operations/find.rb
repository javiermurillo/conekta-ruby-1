module Conekta
  module Operations
    module Find
      module ClassMethods
        def find(id)
          instance = self.new(id)
          url = instance.url
          requestor = Requestor.new
          response = requestor.request(:get, url)
          instance.load_from(response)
          instance
        end
        # <b>DEPRECATED:</b> Please use <tt>find</tt> instead.
        def retrieve(id)
          instance = self.new(id)
          url = instance.url
          requestor = Requestor.new
          response = requestor.request(:get, url)
          instance.load_from(response)
          instance
        end
      end
      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
