# frozen_string_literal: true

class Hash
  def slice(*fields)
    select { |key, _value| fields.include?(key) }
  end
end
