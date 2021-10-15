module Gio
  # Information about an annotation.
  class DBusAnnotationInfo
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::DBusAnnotationInfo))
      @pointer.copy_from(pointer, sizeof(LibGio::DBusAnnotationInfo))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(ref_count : Int32? = nil, key : ::String? = nil, value : ::String? = nil, annotations : Enumerable(Gio::DBusAnnotationInfo)? = nil)
      _ptr = Pointer(Void).malloc(32)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.ref_count = ref_count unless ref_count.nil?
      _instance.key = key unless key.nil?
      _instance.value = value unless value.nil?
      _instance.annotations = annotations unless annotations.nil?
      _instance
    end

    def finalize
    end

    def ref_count : Int32
      # Property getter
      _var = (@pointer + 0).as(Pointer(Int32))
      _var.value
    end

    def ref_count=(value : Int32)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Int32)).value = value
      value
    end

    def key : ::String
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def key=(value : ::String)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def value : ::String
      # Property getter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def value=(value : ::String)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def annotations : Enumerable(Gio::DBusAnnotationInfo)
      # Property getter
      _var = (@pointer + 24).as(Pointer(Pointer(Pointer(Void))))
      GICrystal.transfer_null_ended_array(_var.value, GICrystal::Transfer::Full)
    end

    def annotations=(value : Enumerable(Gio::DBusAnnotationInfo))
      # Property setter
      _var = (@pointer + 24).as(Pointer(Pointer(Pointer(Void)))).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_annotation_info_get_type
    end

    def ref : Gio::DBusAnnotationInfo
      # g_dbus_annotation_info_ref: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_annotation_info_ref(self)
      Gio::DBusAnnotationInfo.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_dbus_annotation_info_unref: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_annotation_info_unref(self)
    end

    def self.lookup(annotations : Enumerable(Gio::DBusAnnotationInfo)?, name : ::String) : ::String?
      # g_dbus_annotation_info_lookup: (None)
      # @annotations: (nullable) (array zero-terminated=1 element-type Interface)
      # Returns: (transfer none)

      annotations = if annotations.nil?
                      Pointer(Pointer(Void)).null
                    else
                      annotations.to_a.map(&.to_unsafe).to_unsafe
                    end

      _retval = LibGio.g_dbus_annotation_info_lookup(annotations, name)
      ::String.new(_retval) unless _retval.null?
    end

    def to_unsafe
      @pointer
    end
  end
end
