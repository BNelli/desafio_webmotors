# deduplicacao necessaria para realizar carregamento da massa
class Object
  def duplicable?
    true
  end

  def deep_dup
    duplicable? ? dup : self
  end
end

class Array
  def deep_dup
    map(&:deep_dup)
  end
end
