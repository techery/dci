module DCI
  module Context
    include ContextAccessor

    def context=(context)
      Thread.current[:context] = context
    end

    def in_context
      previous_context = self.context
      self.context = self
      result = yield
      self.context = previous_context

      result
    end
  end
end