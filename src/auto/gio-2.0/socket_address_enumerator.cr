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
  @[GObject::GeneratedWrapper]
  class SocketAddressEnumerator < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SocketAddressEnumeratorClass), class_init,
        sizeof(LibGio::SocketAddressEnumerator), instance_init, 0)
    end

    GICrystal.define_new_method(SocketAddressEnumerator, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SocketAddressEnumerator`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_address_enumerator_get_type
    end

    # Retrieves the next #GSocketAddress from @enumerator. Note that this
    # may block for some amount of time. (Eg, a #GNetworkAddress may need
    # to do a DNS lookup before it can return an address.) Use
    # g_socket_address_enumerator_next_async() if you need to avoid
    # blocking.
    #
    # If @enumerator is expected to yield addresses, but for some reason
    # is unable to (eg, because of a DNS error), then the first call to
    # g_socket_address_enumerator_next() will return an appropriate error
    # in *@error. However, if the first call to
    # g_socket_address_enumerator_next() succeeds, then any further
    # internal errors (other than @cancellable being triggered) will be
    # ignored.
    def _next(cancellable : Gio::Cancellable?) : Gio::SocketAddress
      # g_socket_address_enumerator_next: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_socket_address_enumerator_next(@pointer, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end

    # Asynchronously retrieves the next #GSocketAddress from @enumerator
    # and then calls @callback, which must call
    # g_socket_address_enumerator_next_finish() to get the result.
    #
    # It is an error to call this multiple times before the previous callback has finished.
    def next_async(cancellable : Gio::Cancellable?, callback : Gio::AsyncReadyCallback?, user_data : Pointer(Void)?) : Nil
      # g_socket_address_enumerator_next_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_socket_address_enumerator_next_async(@pointer, cancellable, callback, user_data)

      # Return value handling
    end

    # Retrieves the result of a completed call to
    # g_socket_address_enumerator_next_async(). See
    # g_socket_address_enumerator_next() for more information about
    # error handling.
    def next_finish(result : Gio::AsyncResult) : Gio::SocketAddress
      # g_socket_address_enumerator_next_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_socket_address_enumerator_next_finish(@pointer, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::SocketAddress.new(_retval, GICrystal::Transfer::Full)
    end
  end
end
