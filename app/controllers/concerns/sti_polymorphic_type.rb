module StiPolymorphicType
  extend ActiveSupport::Concern

  included do
    def find_sti_class(type_name)
      super.becomes(base_class)
    end
  end
end