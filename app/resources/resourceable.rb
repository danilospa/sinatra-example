# frozen_string_literal: true

module Resourceable
  def self.included(base)
    base.class_eval do
      attr_reader :entity
    end
  end

  def initialize(entity)
    @entity = entity
  end

  def to_h
    @entity.slice(*attr_mapper)
  end
end
