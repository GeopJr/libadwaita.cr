module Gio
  # Objects that describe one or more potential socket endpoints
  # implement #GSocketConnectable. Callers can then use
  # g_socket_connectable_enumerate() to get a #GSocketAddressEnumerator
  # to try out each socket address in turn until one succeeds, as shown
  # in the sample code below.
  #
  # |[<!-- language="C" -->
  # MyConnectionType *
  # connect_to_host (const char    *hostname,
  #                  guint16        port,
  #                  GCancellable  *cancellable,
  #                  GError       **error)
  # {
  #   MyConnection *conn = NULL;
  #   GSocketConnectable *addr;
  #   GSocketAddressEnumerator *enumerator;
  #   GSocketAddress *sockaddr;
  #   GError *conn_error = NULL;
  #
  #   addr = g_network_address_new (hostname, port);
  #   enumerator = g_socket_connectable_enumerate (addr);
  #   g_object_unref (addr);
  #
  #   // Try each sockaddr until we succeed. Record the first connection error,
  #   // but not any further ones (since they'll probably be basically the same
  #   // as the first).
  #   while (!conn && (sockaddr = g_socket_address_enumerator_next (enumerator, cancellable, error))
  #     {
  #       conn = connect_to_sockaddr (sockaddr, conn_error ? NULL : &conn_error);
  #       g_object_unref (sockaddr);
  #     }
  #   g_object_unref (enumerator);
  #
  #   if (conn)
  #     {
  #       if (conn_error)
  #         {
  #           // We couldn't connect to the first address, but we succeeded
  #           // in connecting to a later address.
  #           g_error_free (conn_error);
  #         }
  #       return conn;
  #     }
  #   else if (error)
  #     {
  #       /// Either initial lookup failed, or else the caller cancelled us.
  #       if (conn_error)
  #         g_error_free (conn_error);
  #       return NULL;
  #     }
  #   else
  #     {
  #       g_error_propagate (error, conn_error);
  #       return NULL;
  #     }
  # }
  # ]|
  module SocketConnectable
    def enumerate : Gio::SocketAddressEnumerator
      # g_socket_connectable_enumerate: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_socket_connectable_enumerate(self)
      Gio::SocketAddressEnumerator.new(_retval, GICrystal::Transfer::Full)
    end

    def proxy_enumerate : Gio::SocketAddressEnumerator
      # g_socket_connectable_proxy_enumerate: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_socket_connectable_proxy_enumerate(self)
      Gio::SocketAddressEnumerator.new(_retval, GICrystal::Transfer::Full)
    end

    def to_string : ::String
      # g_socket_connectable_to_string: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_socket_connectable_to_string(self)
      GICrystal.transfer_full(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class SocketConnectable__Impl
    include SocketConnectable

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_connectable_get_type
    end

    # Cast a `GObject::Object` to `SocketConnectable`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to SocketConnectable")
    end

    # Cast a `GObject::Object` to `SocketConnectable`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
