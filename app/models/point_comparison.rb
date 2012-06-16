require 'natcmp'

module PointComparison
  extend Comparable
  
  def <=>(other)
    Natcmp.natcmp(self.name, other.name)
  end

  def self.compare_point_names(a, b)
    Natcmp.natcmp(a, b)
  end

  def self.sort_point_names(point_names)
    point_names.sort {|a, b| compare_point_names(a, b) }
  end
end