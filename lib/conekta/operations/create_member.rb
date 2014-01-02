module Conekta
  module Operations
    module CreateMember
      def create_member(member, params)
        url = self.url + "/" + member
        member = member.to_sym
        requestor = Requestor.new
        response = requestor.request(:post, url, params)

        if self.method(member).call.class.class_name == "ConektaObject"
          arr = [response]
          self.method(member).call.values.each do |(k,v)|
            arr << v.to_hash
          end
          self.method(member).call.load_from(arr)
          self.load_from
          instances = self.method(member).call
          instance = instances[0]
        else
          instance = Util.types[member].new()
          instance.load_from(response)
          self.create_attr(member.to_s, instance)
          self.set_val(member.to_sym, instance)
          self.load_from
        end
        instance
      end
    end
  end
end