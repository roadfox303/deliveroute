module MultipleUpdate
  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def multi_update(params, model)
      params.to_h[model].map do |id, attributes|
        instance = self.find(id)
        instance.update_attributes!(attributes)
      end
    end
  end
  
end
