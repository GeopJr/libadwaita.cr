module Gtk
  # Meta-data to be passed to gtk_recent_manager_add_full() when
  # registering a recently used resource.
  class RecentData
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::RecentData))
      @pointer.copy_from(pointer, sizeof(LibGtk::RecentData))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(display_name : ::String? = nil, description : ::String? = nil, mime_type : ::String? = nil, app_name : ::String? = nil, app_exec : ::String? = nil, groups : Enumerable(::String)? = nil, is_private : Bool? = nil)
      _ptr = Pointer(Void).malloc(56)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.display_name = display_name unless display_name.nil?
      _instance.description = description unless description.nil?
      _instance.mime_type = mime_type unless mime_type.nil?
      _instance.app_name = app_name unless app_name.nil?
      _instance.app_exec = app_exec unless app_exec.nil?
      _instance.groups = groups unless groups.nil?
      _instance.is_private = is_private unless is_private.nil?
      _instance
    end

    def finalize
    end

    def display_name : ::String
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def display_name=(value : ::String)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def description : ::String
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def description=(value : ::String)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def mime_type : ::String
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def mime_type=(value : ::String)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def app_name : ::String
      # Property getter
      _var = (@pointer + 24).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def app_name=(value : ::String)
      # Property setter
      _var = (@pointer + 24).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def app_exec : ::String
      # Property getter
      _var = (@pointer + 32).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def app_exec=(value : ::String)
      # Property setter
      _var = (@pointer + 32).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def groups : Enumerable(::String)
      # Property getter
      _var = (@pointer + 40).as(Pointer(Pointer(Pointer(LibC::Char))))
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::Full)
    end

    def groups=(value : Enumerable(::String))
      # Property setter
      _var = (@pointer + 40).as(Pointer(Pointer(Pointer(LibC::Char)))).value = value
      value
    end

    def is_private : Bool
      # Property getter
      _var = (@pointer + 48).as(Pointer(LibC::Int))
      GICrystal.to_bool(_var.value)
    end

    def is_private=(value : Bool)
      # Property setter
      _var = (@pointer + 48).as(Pointer(LibC::Int)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
