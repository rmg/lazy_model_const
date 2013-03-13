require 'lazy_const'

module LazyModelConst
  include LazyConst
  def lazy_model_const(name, attrs = {})
    lazy_const name do
      find_or_create_by_name(attrs)
    end
  end
end
