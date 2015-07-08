module Liquid
  class RangeLookup
    def self.parse(start_markup, end_markup)
      start_obj = Expression.parse(start_markup)
      end_obj = Expression.parse(end_markup)
      if start_obj.respond_to?(:evaluate) || end_obj.respond_to?(:evaluate)
        new(start_obj, end_obj)
      else
        start_obj.to_i..end_obj.to_i
      end
    end

    def initialize(start_obj, end_obj)
      @start_obj = start_obj
      @end_obj = end_obj
    end

    def evaluate(context)
      start_int = Utils.to_integer(context.evaluate(@start_obj))
      end_int = Utils.to_integer(context.evaluate(@end_obj))
      start_int..end_int
    end
  end
end
