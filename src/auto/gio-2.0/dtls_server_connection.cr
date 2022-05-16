module Gio
  # #GDtlsServerConnection is the server-side subclass of #GDtlsConnection,
  # representing a server-side DTLS connection.
  module DtlsServerConnection
    def authentication_mode=(value : Gio::TlsAuthenticationMode) : Gio::TlsAuthenticationMode
      unsafe_value = value

      LibGObject.g_object_set(self, "authentication-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def authentication_mode : Gio::TlsAuthenticationMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "authentication-mode", pointerof(value), Pointer(Void).null)
      Gio::TlsAuthenticationMode.new(value)
    end

    def new(base_socket : Gio::DatagramBased, certificate : Gio::TlsCertificate?) : Gio::DtlsServerConnection
      # g_dtls_server_connection_new: (Throws)
      # @certificate: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      certificate = if certificate.nil?
                      Pointer(Void).null
                    else
                      certificate.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dtls_server_connection_new(base_socket, certificate, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::AbstractDtlsServerConnection.new(_retval, GICrystal::Transfer::Full)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractDtlsServerConnection < GObject::Object
    include DtlsServerConnection

    GICrystal.define_new_method(Gio::AbstractDtlsServerConnection, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dtls_server_connection_get_type
    end

    # Cast a `GObject::Object` to `DtlsServerConnection`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DtlsServerConnection")
    end

    # Cast a `GObject::Object` to `DtlsServerConnection`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
