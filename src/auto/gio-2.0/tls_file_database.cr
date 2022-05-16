module Gio
  # #GTlsFileDatabase is implemented by #GTlsDatabase objects which load
  # their certificate information from a file. It is an interface which
  # TLS library specific subtypes implement.
  module TlsFileDatabase
    def anchors=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "anchors", unsafe_value, Pointer(Void).null)
      value
    end

    def anchors : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "anchors", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def new(anchors : ::String) : Gio::TlsFileDatabase
      # g_tls_file_database_new: (Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_tls_file_database_new(anchors, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::AbstractTlsFileDatabase.new(_retval, GICrystal::Transfer::Full)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractTlsFileDatabase < GObject::Object
    include TlsFileDatabase

    GICrystal.define_new_method(Gio::AbstractTlsFileDatabase, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_tls_file_database_get_type
    end

    # Cast a `GObject::Object` to `TlsFileDatabase`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to TlsFileDatabase")
    end

    # Cast a `GObject::Object` to `TlsFileDatabase`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
