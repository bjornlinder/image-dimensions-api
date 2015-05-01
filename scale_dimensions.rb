class Dimensions
  def self.scale(images,bounding)
    begin
      image_dim = to_dimensions(images)
    rescue Exception => e
      return e
    end
    begin
      bounds = to_dimensions(bounding)
    rescue Exception => e
      return e
    end
    scaled_dim = scale_with_bounds(image_dim,bounds)
    bounds[0] = format_num(bounds[0])
    bounds[1] = format_num(bounds[1])
    return {'scaled_dimensions'=>scaled_dim,
            'bounding_box'=>bounds}
  end
  
  def self.to_dimensions(string)
    array = string.split(',')
    raise Exception, "Must pass an even number of dimensions!" unless array.length.even?
    array.each_with_object([]) do |dim, array|
      num = dim.to_f
      if num == 0
        raise Exception, "dimensions must be numbers!"
      else
        array << num
      end
    end
  end
  
  def self.scale_with_bounds(dimensions,bounds)
    max_w = bounds[0]
    max_h = bounds[1]
    i = 0
    until i >= dimensions.length do
      w = dimensions[i]
      h = dimensions[i+1]
      scale_w = w/max_w
      scale_h = h/max_h
      if scale_w > scale_h
        new_h = format_num(h/scale_w)
        new_w = format_num(max_w)
      else
        new_w = format_num(w/scale_h)
        new_h = format_num(max_h)
      end
      dimensions[i] = new_w
      dimensions[i+1] = new_h        
      i = i+2
    end
    dimensions
  end
  
  def self.format_num(x)
    x.to_i
  end
end