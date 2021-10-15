module Pango
  # A `PangoMatrix` specifies a transformation between user-space
  # and device coordinates.
  #
  # The transformation is given by
  #
  # ```
  # x_device = x_user * matrix->xx + y_user * matrix->xy + matrix->x0;
  # y_device = x_user * matrix->yx + y_user * matrix->yy + matrix->y0;
  # ```
  class Matrix
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::Matrix))
      @pointer.copy_from(pointer, sizeof(LibPango::Matrix))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(xx : Float64? = nil, xy : Float64? = nil, yx : Float64? = nil, yy : Float64? = nil, x0 : Float64? = nil, y0 : Float64? = nil)
      _ptr = Pointer(Void).malloc(48)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.xx = xx unless xx.nil?
      _instance.xy = xy unless xy.nil?
      _instance.yx = yx unless yx.nil?
      _instance.yy = yy unless yy.nil?
      _instance.x0 = x0 unless x0.nil?
      _instance.y0 = y0 unless y0.nil?
      _instance
    end

    def finalize
    end

    def xx : Float64
      # Property getter
      _var = (@pointer + 0).as(Pointer(Float64))
      _var.value
    end

    def xx=(value : Float64)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Float64)).value = value
      value
    end

    def xy : Float64
      # Property getter
      _var = (@pointer + 8).as(Pointer(Float64))
      _var.value
    end

    def xy=(value : Float64)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Float64)).value = value
      value
    end

    def yx : Float64
      # Property getter
      _var = (@pointer + 16).as(Pointer(Float64))
      _var.value
    end

    def yx=(value : Float64)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Float64)).value = value
      value
    end

    def yy : Float64
      # Property getter
      _var = (@pointer + 24).as(Pointer(Float64))
      _var.value
    end

    def yy=(value : Float64)
      # Property setter
      _var = (@pointer + 24).as(Pointer(Float64)).value = value
      value
    end

    def x0 : Float64
      # Property getter
      _var = (@pointer + 32).as(Pointer(Float64))
      _var.value
    end

    def x0=(value : Float64)
      # Property setter
      _var = (@pointer + 32).as(Pointer(Float64)).value = value
      value
    end

    def y0 : Float64
      # Property getter
      _var = (@pointer + 40).as(Pointer(Float64))
      _var.value
    end

    def y0=(value : Float64)
      # Property setter
      _var = (@pointer + 40).as(Pointer(Float64)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_matrix_get_type
    end

    def concat(new_matrix : Pango::Matrix) : Nil
      # pango_matrix_concat: (Method)
      # Returns: (transfer none)

      LibPango.pango_matrix_concat(self, new_matrix)
    end

    def copy : Pango::Matrix?
      # pango_matrix_copy: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_matrix_copy(self)
      Pango::Matrix.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def free : Nil
      # pango_matrix_free: (Method)
      # Returns: (transfer none)

      LibPango.pango_matrix_free(self)
    end

    def font_scale_factor : Float64
      # pango_matrix_get_font_scale_factor: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_matrix_get_font_scale_factor(self)
      _retval
    end

    def font_scale_factors : Nil
      # pango_matrix_get_font_scale_factors: (Method)
      # @xscale: (out) (transfer full) (optional)
      # @yscale: (out) (transfer full) (optional)
      # Returns: (transfer none)

      xscale = Pointer(Float64).null
      yscale = Pointer(Float64).null

      LibPango.pango_matrix_get_font_scale_factors(self, xscale, yscale)
    end

    def rotate(degrees : Float64) : Nil
      # pango_matrix_rotate: (Method)
      # Returns: (transfer none)

      LibPango.pango_matrix_rotate(self, degrees)
    end

    def scale(scale_x : Float64, scale_y : Float64) : Nil
      # pango_matrix_scale: (Method)
      # Returns: (transfer none)

      LibPango.pango_matrix_scale(self, scale_x, scale_y)
    end

    def transform_distance(dx : Float64, dy : Float64) : Nil
      # pango_matrix_transform_distance: (Method)
      # @dx: (inout) (transfer full)
      # @dy: (inout) (transfer full)
      # Returns: (transfer none)

      LibPango.pango_matrix_transform_distance(self, dx, dy)
    end

    def transform_pixel_rectangle : Nil
      # pango_matrix_transform_pixel_rectangle: (Method)
      # @rect: (inout) (transfer full) (optional)
      # Returns: (transfer none)

      rect = Pointer(Void).null

      LibPango.pango_matrix_transform_pixel_rectangle(self, rect)
    end

    def transform_point(x : Float64, y : Float64) : Nil
      # pango_matrix_transform_point: (Method)
      # @x: (inout) (transfer full)
      # @y: (inout) (transfer full)
      # Returns: (transfer none)

      LibPango.pango_matrix_transform_point(self, x, y)
    end

    def transform_rectangle : Nil
      # pango_matrix_transform_rectangle: (Method)
      # @rect: (inout) (transfer full) (optional)
      # Returns: (transfer none)

      rect = Pointer(Void).null

      LibPango.pango_matrix_transform_rectangle(self, rect)
    end

    def translate(tx : Float64, ty : Float64) : Nil
      # pango_matrix_translate: (Method)
      # Returns: (transfer none)

      LibPango.pango_matrix_translate(self, tx, ty)
    end

    def to_unsafe
      @pointer
    end
  end
end
