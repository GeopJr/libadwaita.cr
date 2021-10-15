require "../g_object-2.0/object"

module Gio
  # #GSocketAddressEnumerator is an enumerator type for #GSocketAddress
  # instances. It is returned by enumeration functions such as
  # g_socket_connectable_enumerate(), which returns a #GSocketAddressEnumerator
  # to list each #GSocketAddress which could be used to connect to that
  # #GSocketConnectable.
  #
  # Enumeration is typically a blocking operation, so the asynchronous methods
  # g_socket_address_enumerator_next_async() and
  # g_socket_address_enumerator_next_finish() should be used where possible.
  #
  # Each #GSocketAddressEnumerator can only be enumerated once. Once
  # g_socket_address_enumerator_next() has returned %NULL, further
  # enumeration with that #GSocketAddressEnumerator is not possible, and it can
  # be unreffed.
  class SocketAddressEnumerator < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_address_enumerator_get_type
    end

    def _next(cancellable : Gio::Cancellable?) : Gio::SocketAddress
      # g_socket_address_enumerator_next: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_socket_address_enumerator_next(self, cancellable)
      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    def next_async(cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_socket_address_enumerator_next_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_socket_address_enumerator_next_async(self, cancellable, callback, user_data)
    end

    def next_finish(result : Gio::AsyncResult) : Gio::SocketAddress
      # g_socket_address_enumerator_next_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_socket_address_enumerator_next_finish(self, result)
      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
