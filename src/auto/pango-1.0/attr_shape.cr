module Pango
  # The `PangoAttrShape` structure is used to represent attributes which
  # impose shape restrictions.
  class AttrShape
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::AttrShape))
      @pointer.copy_from(pointer, sizeof(LibPango::AttrShape))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(attr : Pango::Attribute? = nil, ink_rect : Pango::Rectangle? = nil, logical_rect : Pango::Rectangle? = nil, data : Pointer(Void)? = nil, copy_func : Pointer(Void)? = nil, destroy_func : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(72)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.attr = attr unless attr.nil?
      _instance.ink_rect = ink_rect unless ink_rect.nil?
      _instance.logical_rect = logical_rect unless logical_rect.nil?
      _instance.data = data unless data.nil?
      _instance.copy_func = copy_func unless copy_func.nil?
      _instance.destroy_func = destroy_func unless destroy_func.nil?
      _instance
    end

    def finalize
    end

    def attr : Pango::Attribute
      # Property getter
      _var = (@pointer + 0).as(Pointer(Void))
      Pango::Attribute.new(_var.value, GICrystal::Transfer::None)
    end

    def attr=(value : Pango::Attribute)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    def ink_rect : Pango::Rectangle
      # Property getter
      _var = (@pointer + 16).as(Pointer(Void))
      Pango::Rectangle.new(_var.value, GICrystal::Transfer::None)
    end

    def ink_rect=(value : Pango::Rectangle)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    def logical_rect : Pango::Rectangle
      # Property getter
      _var = (@pointer + 32).as(Pointer(Void))
      Pango::Rectangle.new(_var.value, GICrystal::Transfer::None)
    end

    def logical_rect=(value : Pango::Rectangle)
      # Property setter
      _var = (@pointer + 32).as(Pointer(Void)).value = value.to_unsafe
      value
    end

    def data : Pointer(Void)
      # Property getter
      _var = (@pointer + 48).as(Pointer(Pointer(Void)))
      _var.value
    end

    def data=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 48).as(Pointer(Pointer(Void))).value = value
      value
    end

    def copy_func : Pointer(Void)
      # Property getter
      _var = (@pointer + 56).as(Pointer(LibPango::AttrDataCopyFunc))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def copy_func=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 56).as(Pointer(LibPango::AttrDataCopyFunc)).value = value.to_unsafe
      value
    end

    def destroy_func : Pointer(Void)
      # Property getter
      _var = (@pointer + 64).as(Pointer(LibGLib::DestroyNotify))
      Pointer(Void).new(_var.value, GICrystal::Transfer::None)
    end

    def destroy_func=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 64).as(Pointer(LibGLib::DestroyNotify)).value = value.to_unsafe
      value
    end

    def self.new(ink_rect : Pango::Rectangle, logical_rect : Pango::Rectangle) : Pango::Attribute
      # pango_attr_shape_new: (None)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibPango.pango_attr_shape_new(ink_rect, logical_rect)

      # Return value handling
      Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_with_data(ink_rect : Pango::Rectangle, logical_rect : Pango::Rectangle, data : Pointer(Void)?, copy_func : Pointer(Void)?, destroy_func : Pointer(Void)?) : Pango::Attribute
      # pango_attr_shape_new_with_data: (None)
      # @data: (nullable)
      # @copy_func: (nullable)
      # @destroy_func: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end
      copy_func = if copy_func.nil?
                    LibPango::AttrDataCopyFunc.null
                  else
                    copy_func.to_unsafe
                  end
      destroy_func = if destroy_func.nil?
                       LibGLib::DestroyNotify.null
                     else
                       destroy_func.to_unsafe
                     end

      # C call
      _retval = LibPango.pango_attr_shape_new_with_data(ink_rect, logical_rect, data, copy_func, destroy_func)

      # Return value handling
      Pango::Attribute.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
