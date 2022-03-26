module HarfBuzz
  # Current drawing state.
  class DrawStateT
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibHarfBuzz::DrawStateT))
      @pointer.copy_from(pointer, sizeof(LibHarfBuzz::DrawStateT))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(path_open : Int32? = nil, path_start_x : Float32? = nil, path_start_y : Float32? = nil, current_x : Float32? = nil, current_y : Float32? = nil, reserved1 : HarfBuzz::VarNumT? = nil, reserved2 : HarfBuzz::VarNumT? = nil, reserved3 : HarfBuzz::VarNumT? = nil, reserved4 : HarfBuzz::VarNumT? = nil, reserved5 : HarfBuzz::VarNumT? = nil, reserved6 : HarfBuzz::VarNumT? = nil, reserved7 : HarfBuzz::VarNumT? = nil)
      _ptr = Pointer(Void).malloc(48)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.path_open = path_open unless path_open.nil?
      _instance.path_start_x = path_start_x unless path_start_x.nil?
      _instance.path_start_y = path_start_y unless path_start_y.nil?
      _instance.current_x = current_x unless current_x.nil?
      _instance.current_y = current_y unless current_y.nil?
      _instance.reserved1 = reserved1 unless reserved1.nil?
      _instance.reserved2 = reserved2 unless reserved2.nil?
      _instance.reserved3 = reserved3 unless reserved3.nil?
      _instance.reserved4 = reserved4 unless reserved4.nil?
      _instance.reserved5 = reserved5 unless reserved5.nil?
      _instance.reserved6 = reserved6 unless reserved6.nil?
      _instance.reserved7 = reserved7 unless reserved7.nil?
      _instance
    end

    def finalize
    end

    def path_open : Int32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def path_open=(value : Int32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def path_start_x : Float32
      # Property getter
      _var = (@pointer + 4).as(Pointer(Float32))
      _var.value
    end

    def path_start_x=(value : Float32)
      # Property setter
      _var = (@pointer + 4).as(Pointer(Float32)).value = value
      value
    end

    def path_start_y : Float32
      # Property getter
      _var = (@pointer + 8).as(Pointer(Float32))
      _var.value
    end

    def path_start_y=(value : Float32)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Float32)).value = value
      value
    end

    def current_x : Float32
      # Property getter
      _var = (@pointer + 12).as(Pointer(Float32))
      _var.value
    end

    def current_x=(value : Float32)
      # Property setter
      _var = (@pointer + 12).as(Pointer(Float32)).value = value
      value
    end

    def current_y : Float32
      # Property getter
      _var = (@pointer + 16).as(Pointer(Float32))
      _var.value
    end

    def current_y=(value : Float32)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Float32)).value = value
      value
    end

    def reserved1 : HarfBuzz::VarNumT
      # Property getter
      _var = (@pointer + 20).as(Pointer(LibHarfBuzz::VarNumT))
      HarfBuzz::VarNumT.new(_var.value, GICrystal::Transfer::None)
    end

    def reserved1=(value : HarfBuzz::VarNumT)
      # Property setter
      _var = (@pointer + 20).as(Pointer(LibHarfBuzz::VarNumT)).value = value.to_unsafe
      value
    end

    def reserved2 : HarfBuzz::VarNumT
      # Property getter
      _var = (@pointer + 24).as(Pointer(LibHarfBuzz::VarNumT))
      HarfBuzz::VarNumT.new(_var.value, GICrystal::Transfer::None)
    end

    def reserved2=(value : HarfBuzz::VarNumT)
      # Property setter
      _var = (@pointer + 24).as(Pointer(LibHarfBuzz::VarNumT)).value = value.to_unsafe
      value
    end

    def reserved3 : HarfBuzz::VarNumT
      # Property getter
      _var = (@pointer + 28).as(Pointer(LibHarfBuzz::VarNumT))
      HarfBuzz::VarNumT.new(_var.value, GICrystal::Transfer::None)
    end

    def reserved3=(value : HarfBuzz::VarNumT)
      # Property setter
      _var = (@pointer + 28).as(Pointer(LibHarfBuzz::VarNumT)).value = value.to_unsafe
      value
    end

    def reserved4 : HarfBuzz::VarNumT
      # Property getter
      _var = (@pointer + 32).as(Pointer(LibHarfBuzz::VarNumT))
      HarfBuzz::VarNumT.new(_var.value, GICrystal::Transfer::None)
    end

    def reserved4=(value : HarfBuzz::VarNumT)
      # Property setter
      _var = (@pointer + 32).as(Pointer(LibHarfBuzz::VarNumT)).value = value.to_unsafe
      value
    end

    def reserved5 : HarfBuzz::VarNumT
      # Property getter
      _var = (@pointer + 36).as(Pointer(LibHarfBuzz::VarNumT))
      HarfBuzz::VarNumT.new(_var.value, GICrystal::Transfer::None)
    end

    def reserved5=(value : HarfBuzz::VarNumT)
      # Property setter
      _var = (@pointer + 36).as(Pointer(LibHarfBuzz::VarNumT)).value = value.to_unsafe
      value
    end

    def reserved6 : HarfBuzz::VarNumT
      # Property getter
      _var = (@pointer + 40).as(Pointer(LibHarfBuzz::VarNumT))
      HarfBuzz::VarNumT.new(_var.value, GICrystal::Transfer::None)
    end

    def reserved6=(value : HarfBuzz::VarNumT)
      # Property setter
      _var = (@pointer + 40).as(Pointer(LibHarfBuzz::VarNumT)).value = value.to_unsafe
      value
    end

    def reserved7 : HarfBuzz::VarNumT
      # Property getter
      _var = (@pointer + 44).as(Pointer(LibHarfBuzz::VarNumT))
      HarfBuzz::VarNumT.new(_var.value, GICrystal::Transfer::None)
    end

    def reserved7=(value : HarfBuzz::VarNumT)
      # Property setter
      _var = (@pointer + 44).as(Pointer(LibHarfBuzz::VarNumT)).value = value.to_unsafe
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
